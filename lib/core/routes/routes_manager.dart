import 'package:evently_app/features/auth/login/login.dart';
import 'package:evently_app/features/auth/register/register.dart';
import 'package:evently_app/features/main_layout/home_screen.dart';
import 'package:evently_app/features/on_boarding/onboarding_screen.dart';
import 'package:evently_app/features/on_boarding/onboarding_screen_start.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

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
          return MaterialPageRoute(builder: (context) => Login());
        }
      case register:
        {
          return MaterialPageRoute(builder: (context) => Register());
        }
      case splash:
        {
          return MaterialPageRoute(builder: (context) => SplashScreen());
        }
      case onboarding:
        {
          return MaterialPageRoute(builder: (context) => OnBoardingScreen());
        }
      case onboardingStart:
        {
          return MaterialPageRoute(
            builder: (context) => OnboardingScreenStart(),
          );
        }
      case home:
        {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
    }
  }
}
