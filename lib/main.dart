import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'communication/communication_manager.dart';
import 'network/network_manager.dart';
import 'routes/app_route_constants.dart';
import 'routes/app_routes.dart';
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
      initialRoute: AppRouteConstants.routeTestInstructions,
      getPages: AppRoutes.appRoutes,
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NetworkManager(),
    );
    Get.lazyPut(
      () => CommunicationManager(
        networkManager: Get.find<NetworkManager>(),
      ),
    );
  }
}
