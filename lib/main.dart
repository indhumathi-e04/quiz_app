import 'package:flutter/material.dart';
import 'package:quiz/models/sections_model.dart';
import 'package:quiz/theme/custom_theme.dart';
import 'package:quiz/view/screens/examination_screen.dart';

import 'package:quiz/view/screens/new_test_screen.dart';
import 'package:quiz/view/screens/questions_screen.dart';

import 'package:quiz/view/screens/sections_screen.dart';
import 'package:quiz/view/screens/subject_screen.dart';
import 'package:quiz/view/screens/syllabus_screen.dart';
import 'package:quiz/view/widgets/syllabus.dart';

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
      home: QuestionScreen(
        sectionModelList: [SectionsModel(questionCount: 10)],
      ),
    );
  }
}
