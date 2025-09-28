import 'package:evently_app/config/theme/theme_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeManager.light,
        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.mainLayout,
      ),
    );
  }
}
