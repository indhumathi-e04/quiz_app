import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'routes/app_routes.dart';
import 'routes/route_constants.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.appTheme(
        colorScheme: AppTheme.lightColorScheme,
        brightness: Brightness.light,
        context: context,
      ),
      darkTheme: AppTheme.appTheme(
        colorScheme: AppTheme.darkColorScheme,
        brightness: Brightness.dark,
        context: context,
      ),
      initialRoute: RouteConstants.routeExaminations,
      getPages: AppRoutes.appRoutes,
    );
  }
}
