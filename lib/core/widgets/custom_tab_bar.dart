import 'package:evently_app/core/widgets/tab_item.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,
    required this.categories,
    this.onCategoryItemClicked,
    this.initialIndex,
  });
  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;
  final void Function(CategoryModel)? onCategoryItemClicked;
  final int? initialIndex;

  final List<CategoryModel> categories;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int isSelected = widget.initialIndex ?? 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      initialIndex: widget.initialIndex ?? 0,
      child: TabBar(
        indicatorColor: Colors.transparent,
        onTap: (index) {
          widget.onCategoryItemClicked?.call(widget.categories[index]);
          setState(() {
            isSelected = index;
          });
        },
        isScrollable: true,
        tabs: widget.categories
            .map(
              (category) => TabItem(
                selectedTapBgColor: widget.selectedTapBgColor,
                selectedTapFgColor: widget.selectedTapFgColor,
                unSelectedTapFgColor: widget.unSelectedTapFgColor,
                unSelectedTapBgColor: widget.unSelectedTapBgColor,
                category: category,
                isSelected:
                    isSelected ==
                    widget.categories.indexOf(
                      category,
                    ),
              ),
            )
            .toList(),
      ),
    );
  }
}
