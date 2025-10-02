import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/profile/drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64.r)),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SafeArea(
              child: Row(
                children: [
                  Image.asset(ImagesAssets.profileImage),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ahmed Moo',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          overflow: TextOverflow.clip,
                          'AhmedMoo@gmail.com',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: ColorsManager.whiteBlue,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        const DropDownItem(
          label: 'Language',
          selectedItem: 'Arabic',
          menuItems: ['Arabic', 'English'],
        ),
        SizedBox(
          height: 16.h,
        ),
        const DropDownItem(
          label: 'Theme',
          selectedItem: 'Light',
          menuItems: ['Light', 'Dark'],
        ),
        Padding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 260),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.all(16),
              backgroundColor: ColorsManager.redWhite,
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.logout),
                SizedBox(
                  width: 5.w,
                ),
                const Text('Logout'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
