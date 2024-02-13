import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ui_constants.dart';

class CustomTheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    tertiary: Colors.black38,
    onTertiary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.white,
    tertiary: Colors.white30,
    onTertiary: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
  );

  static const TextTheme _baseTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w900,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    displaySmall: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w900,
    ),
    headlineLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextTheme textTheme(Brightness brightness) =>
      GoogleFonts.latoTextTheme(_baseTextTheme).apply(
        bodyColor: brightness == Brightness.dark ? Colors.white : Colors.black,
        displayColor:
            brightness == Brightness.dark ? Colors.white : Colors.black,
      );

  static AppBarTheme appBarTheme(Brightness brightness) => AppBarTheme(
        iconTheme: const IconThemeData(
          size: UIConstants.defaultHeight * 2,
        ),
        titleSpacing: UIConstants.defaultMargin,
        actionsIconTheme: const IconThemeData(
          size: UIConstants.defaultHeight * 3,
        ),
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme(brightness).displayMedium,
      );

  static InputDecorationTheme inputDecorationTheme(BuildContext context) =>
      InputDecorationTheme(
        // labelStyle: , TODO: Provide the label style
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        contentPadding: const EdgeInsets.all(UIConstants.defaultPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        outlineBorder: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      );

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(UIConstants.defaultBorderRadius),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.zero,
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size.zero,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          iconSize: MaterialStateProperty.all<double>(
            UIConstants.defaultHeight * 2,
          ),
          iconColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary,
          ),
        ),
      );

  static IconThemeData iconTheme(Brightness brightness) => IconThemeData(
        size: UIConstants.defaultHeight * 2,
        color: brightness == Brightness.dark ? Colors.white : Colors.black,
      );

  static ButtonStyle buttonStyle(Brightness brightness) => ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size.zero,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        iconSize: MaterialStateProperty.all<double>(
          UIConstants.defaultHeight * 2,
        ),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          textTheme(brightness).bodyMedium,
        ),
      );

  static ThemeData customTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required BuildContext context,
  }) =>
      ThemeData.from(
        useMaterial3: true,
        colorScheme: colorScheme,
      ).copyWith(
        brightness: brightness,
        textTheme: textTheme(brightness),
        iconTheme: iconTheme(brightness),
        appBarTheme: appBarTheme(brightness),
        inputDecorationTheme: inputDecorationTheme(context),
        elevatedButtonTheme: elevatedButtonTheme(context),
        textButtonTheme: TextButtonThemeData(
          style: buttonStyle(brightness),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: buttonStyle(brightness),
        ),
        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 0.5,
        ),
      );
}
