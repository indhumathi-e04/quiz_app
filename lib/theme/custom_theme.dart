import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ui_constants.dart';

class CustomTheme {
  static final ColorScheme lightColorScheme = ColorScheme(
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
    outline: Colors.black.withOpacity(0.2),
  );

  static final ColorScheme darkColorScheme = ColorScheme(
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
    outline: Colors.white.withOpacity(0.2),
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

  static TextTheme textTheme(
    Brightness brightness,
  ) =>
      GoogleFonts.latoTextTheme(_baseTextTheme).apply(
        bodyColor: brightness == Brightness.dark ? Colors.white : Colors.black,
        displayColor:
            brightness == Brightness.dark ? Colors.white : Colors.black,
      );

  static AppBarTheme appBarTheme(
    Brightness brightness,
  ) =>
      AppBarTheme(
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

  static InputDecorationTheme inputDecorationTheme(
    Brightness brightness,
  ) =>
      InputDecorationTheme(
        floatingLabelStyle: textTheme(brightness).bodyMedium,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: textTheme(brightness).bodySmall?.copyWith(
              color: brightness == Brightness.dark
                  ? darkColorScheme.error
                  : lightColorScheme.error,
            ),
        errorMaxLines: 2,
        filled: true,
        contentPadding: const EdgeInsets.all(UIConstants.defaultPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: brightness == Brightness.dark
                ? darkColorScheme.outline
                : lightColorScheme.outline,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: brightness == Brightness.dark
                ? darkColorScheme.error
                : lightColorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: brightness == Brightness.dark
                ? darkColorScheme.primary
                : lightColorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          borderSide: BorderSide(
            color: brightness == Brightness.dark
                ? darkColorScheme.outline
                : lightColorScheme.outline,
          ),
        ),
        outlineBorder: BorderSide(
          color: brightness == Brightness.dark
              ? darkColorScheme.outline
              : lightColorScheme.outline,
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
        backgroundColor: MaterialStateProperty.all<Color>(
          brightness == Brightness.dark
              ? darkColorScheme.primary
              : lightColorScheme.primary,
        ),
        iconColor: MaterialStateProperty.all<Color>(
          brightness == Brightness.dark
              ? darkColorScheme.primary
              : lightColorScheme.primary,
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
        inputDecorationTheme: inputDecorationTheme(brightness),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: inputDecorationTheme(brightness),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: buttonStyle(brightness).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.outline
                  : lightColorScheme.outline,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: buttonStyle(brightness).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(UIConstants.defaultBorderRadius),
                side: BorderSide(
                  color: brightness == Brightness.dark
                      ? darkColorScheme.outline
                      : lightColorScheme.outline,
                ),
              ),
            ),
          ),
        ),
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
