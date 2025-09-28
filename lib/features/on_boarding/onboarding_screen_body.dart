import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/on_boarding/onboarding_item.dart';
import 'package:evently_app/features/on_boarding/widgets/custom_dots_indicator.dart';
import 'package:evently_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  PageController controller = PageController(initialPage: 0);
  double pos = 0;
  List<OnboardingModel> litsOfPage = [
    OnboardingModel(
      pathImage: ImagesAssets.onboarding2,
      title: 'Find Events That Inspire You',
      subTitle:
          'Dive into a world of events crafted to fit your unique interests. Whether you re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnboardingModel(
      pathImage: ImagesAssets.onboarding3,
      title: 'Effortless Event Planning',
      subTitle:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    OnboardingModel(
      pathImage: ImagesAssets.onboarding4,
      title: "Connect with Friends & Share Moments",
      subTitle:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pos = value.toDouble();
                  });
                },
                itemBuilder: (context, index) =>
                    OnboardingItem(model: litsOfPage[index]),
                itemCount: litsOfPage.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                pos == 0
                    ? SizedBox(width: 75.w)
                    : IconButton(
                        onPressed: () {
                          _previousPage();
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 37,
                          color: ColorsManager.blue,
                        ),
                      ),
                CustomDotsIndicatorWidget(pos: pos),
                IconButton(
                  onPressed: () {
                    _nextPage(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 37,
                    color: ColorsManager.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _previousPage() {
    if (pos > 0) {
      controller.previousPage(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 500),
      );
      setState(() {
        pos--;
      });
    }
  }

  void _nextPage(BuildContext context) {
    if (pos < 2) {
      controller.nextPage(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 500),
      );
      setState(() {
        pos++;
      });
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
    }
  }
}
