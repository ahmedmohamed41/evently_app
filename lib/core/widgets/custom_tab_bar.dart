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
  });

  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;
  final void Function(CategoryModel)? onCategoryItemClicked;
  final List<CategoryModel> categories;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (value) {
          widget.onCategoryItemClicked?.call(widget.categories[value]);
          setState(() {
            isSelected = value;
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
                isSelected: isSelected ==
                    widget.categories.indexOf(category),
              ),
            )
            .toList(),
      ),
    );
  }
}
