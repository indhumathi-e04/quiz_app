import 'package:flutter/material.dart';
import 'package:quiz/view/screens/login_screen.dart';

import 'theme/custom_theme.dart';
import 'view/screens/new_test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomTheme.customTheme(
        colorScheme: CustomTheme.lightColorScheme,
        brightness: Brightness.light,
        context: context,
      ),
      darkTheme: CustomTheme.customTheme(
        colorScheme: CustomTheme.darkColorScheme,
        brightness: Brightness.dark,
        context: context,
      ),
      home: NewTestScreen(),
    );
  }
}
