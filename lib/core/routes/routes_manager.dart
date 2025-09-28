import 'package:evently_app/features/auth/login/login.dart';
import 'package:evently_app/features/auth/register/register.dart';
import 'package:evently_app/features/on_boarding/onboarding_screen.dart';
import 'package:evently_app/features/on_boarding/onboarding_screen_start.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/main_layout/main_layout.dart';

abstract class RoutesManager {
  static const String login = '/login';
  static const String register = '/register';
  static const String splash = '/splash';
  static const String onboardingStart = '/onboardingStart';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        {
          return MaterialPageRoute(builder: (context) => const Login());
        }
      case register:
        {
          return MaterialPageRoute(builder: (context) => const Register());
        }
      case splash:
        {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }
      case onboarding:
        {
          return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
        }
      case onboardingStart:
        {
          return MaterialPageRoute(
            builder: (context) => const OnboardingScreenStart(),
          );
        }
      case home:
        {
          return MaterialPageRoute(builder: (context) => const MainLayout());
        }
    }
  }
}
