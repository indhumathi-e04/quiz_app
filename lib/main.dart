import 'package:flutter/material.dart';
import 'package:quiz/theme/custom_theme.dart';
import 'package:quiz/view/screens/create_new_test_flows.dart';
import 'package:quiz/view/screens/sections_screen.dart';

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
        seedColor: const Color(0xFF0F0F0F),
        brightness: Brightness.light,
        context: context,
      ),
      darkTheme: CustomTheme.customTheme(
        seedColor: const Color(0xFFF0F0F0),
        brightness: Brightness.dark,
        context: context,
      ),
      //home: const CreateNewTestFlows(),
      home: SectionsScreen(),
    );
  }
}
