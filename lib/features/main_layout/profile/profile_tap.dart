import 'dart:developer';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/main_layout/profile/drop_down_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
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
                          UserModel.currentUser!.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          overflow: TextOverflow.clip,
                           UserModel.currentUser!.email,
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
        DropDownItem(
          onChange: (newTheme) {
            log(newTheme.toString());
            configProvider.changeAppTheme(
              newTheme == appLocalizations.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          label: appLocalizations.theme,
          selectedItem: !configProvider.isDark
              ? appLocalizations.light
              : appLocalizations.dark,
          menuItems: [appLocalizations.light, appLocalizations.dark],
        ),
        SizedBox(
          height: 16.h,
        ),
        DropDownItem(
          onChange: (newLanguage) {
            configProvider.changeAppLanguage(
              newLanguage == 'English' ? 'en' : 'ar',
            );
          },
          label: appLocalizations.language,
          selectedItem: configProvider.currentlanguage == 'en'
              ? 'English'
              : 'Arabic',
          menuItems: ['English', 'Arabic'],
        ),
        Padding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 200),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.all(16),
              backgroundColor: ColorsManager.redWhite,
            ),
            onPressed: () => _logout(context),
            child: Row(
              children: [
                const Icon(Icons.logout),
                SizedBox(
                  width: 5.w,
                ),
                Text(appLocalizations.logout),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
