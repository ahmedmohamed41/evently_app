import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/on_boarding/onboarding_item.dart';
import 'package:evently_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenStart extends StatelessWidget {
  const OnboardingScreenStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                child: OnboardingItem(
                  model: OnboardingModel(
                    pathImage: ImagesAssets.onboarding1,
                    title: 'Personalize Your Experience',
                    subTitle:
                        'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Text(
                      'Language',
                      style: TextStyle(
                        color: ColorsManager.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flag_circle_rounded),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Text(
                      'Language',
                      style: TextStyle(
                        color: ColorsManager.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flag_circle_rounded),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.onboarding,
                  );
                },
                child: const Text(
                  'Let’s Start',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
