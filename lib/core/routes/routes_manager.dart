import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/auth/login/login.dart';
import 'package:evently_app/features/auth/register/register.dart';
<<<<<<< HEAD
=======
import 'package:evently_app/features/create_event/create_event.dart';
import 'package:evently_app/features/main_layout/main_layout.dart';
>>>>>>> developer
import 'package:evently_app/features/on_boarding/onboarding_screen.dart';
import 'package:evently_app/features/on_boarding/onboarding_screen_start.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/main_layout/main_layout.dart';

abstract class RoutesManager {


  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        {
          return MaterialPageRoute(builder: (context) => const Login());
        }
      case AppRoutes.register:
        {
          return MaterialPageRoute(builder: (context) => const Register());
        }
      case AppRoutes.splash:
        {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }
      case AppRoutes.onboarding:
        {
          return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
        }
      case AppRoutes.onboardingStart:
        {
          return MaterialPageRoute(
            builder: (context) => const OnboardingScreenStart(),
          );
        }
      case AppRoutes.mainLayout:
        {
          return MaterialPageRoute(builder: (context) => const MainLayout());
<<<<<<< HEAD
=======
        }
      case AppRoutes.createEvent:
        {
          return MaterialPageRoute(builder: (context) => const CreateEvent());
>>>>>>> developer
        }
    }
  }
}
