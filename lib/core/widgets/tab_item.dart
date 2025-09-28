import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,
    required this.category,
    required this.isSelected,
  });
  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;

  final CategoryModel category;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
<<<<<<< HEAD
=======

>>>>>>> developer
      decoration: BoxDecoration(
        color: isSelected ? selectedTapBgColor : unSelectedTapBgColor,
        borderRadius: BorderRadius.circular(46),

        border: BoxBorder.all(color: selectedTapBgColor),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? selectedTapFgColor : unSelectedTapFgColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? selectedTapFgColor : unSelectedTapFgColor,
            ),
          ),
        ],
      ),
    );
  }
}
