import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({super.key, required this.label, required this.selectedItem, required this.menuItems});
  final String label;
  final String selectedItem;
  final List<String> menuItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 56.h,
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: ColorsManager.blue),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  selectedItem,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                DropdownButton<String>(
                  dropdownColor: ColorsManager.blue,
                  iconEnabledColor: ColorsManager.blue,
                  underline: const SizedBox(),
                  items: menuItems.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
