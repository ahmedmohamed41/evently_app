import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigatorLocation extends StatelessWidget {
  const CustomNavigatorLocation({
    super.key,
    required this.icon,
    required this.title,
    this.desc,
    this.iconArrow,
    this.onTap,
  });
  final IconData icon;
  final IconData? iconArrow;
  final String title;
  final String? desc;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10),
        height: 65.h,
        width: 361.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.blue),
        ),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: ColorsManager.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: ColorsManager.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  overflow: TextOverflow.clip,
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorsManager.blue,
                  ),
                ),
                if (desc != null)
                  Text(
                    desc!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
            const Spacer(),
            if (iconArrow != null)
              Icon(
                iconArrow,
                color: ColorsManager.blue,
              ),
          ],
        ),
      ),
    );
  }
}
