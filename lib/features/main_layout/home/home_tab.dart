import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/features/main_layout/home/event_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
          ),
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.welcome_back,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Ahmed Moo',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: ColorsManager.white,
                              ),
                              Text(
                                'Cairo , Egypt',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.light_mode_outlined,
                        color: ColorsManager.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorsManager.ofWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'EN',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTabBar(
                    categories: CategoryModel.categoriesWithAll(context),
                    selectedTapBgColor: isDark == Brightness.light
                        ? ColorsManager.whiteBlue
                        : ColorsManager.blue,
                    selectedTapFgColor: isDark == Brightness.light
                        ? ColorsManager.blue
                        : ColorsManager.whiteBlue,
                    unSelectedTapFgColor: ColorsManager.whiteBlue,
                    unSelectedTapBgColor: isDark == Brightness.light
                        ? ColorsManager.blue
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: REdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                category: CategoryModel.categories(context)[3],
                dateTime: DateTime.now(),
                timeOfDay: TimeOfDay.now(),
                title: 'Meeting for Updating The Development Method ',
                description: 'Meeting for Updating The Development Method ',
              ),
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
