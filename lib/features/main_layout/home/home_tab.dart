import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/features/main_layout/home/event_item.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late CategoryModel selectedCategory = CategoryModel.categoriesWithAll(
    context,
  )[0];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness;
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.welcome_back,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              UserModel.currentUser!.name,
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
                      ),

                      IconButton(
                        onPressed: () {
                          if (!configProvider.isDark) {
                            configProvider.changeAppTheme(ThemeMode.dark);
                          } else {
                            configProvider.changeAppTheme(ThemeMode.light);
                          }
                        },
                        icon: Icon(
                          !configProvider.isDark
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          color: ColorsManager.white,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorsManager.ofWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (configProvider.currentlanguage == 'en') {
                              configProvider.changeAppLanguage('ar');
                            } else {
                              configProvider.changeAppLanguage('en');
                            }
                          },
                          child: Text(
                            configProvider.currentlanguage == 'en'
                                ? 'AR'
                                : 'EN',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTabBar(
                    onCategoryItemClicked: (category) {
                      selectedCategory = category;
                      setState(() {});
                    },
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

        FutureBuilder(
          future: FirebaseService.getEventFromFireStore(
            context,
            selectedCategory,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            List<EventModel> events = snapshot.data ?? [];
            return Expanded(
              child: ListView.separated(
                padding: REdgeInsets.only(top: 20),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
                itemBuilder: (context, index) =>
                    EventItem(event: events[index]),
                itemCount: events.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
