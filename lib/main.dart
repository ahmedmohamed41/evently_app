import 'package:evently_app/config/theme/theme_manager.dart';
import 'package:evently_app/core/prefs/prefs_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/routes/routes_manager.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: const EventlyApp(),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(configProvider.currentlanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: configProvider.currentTheme,
        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.mainLayout,
      ),
    );
  }
}
