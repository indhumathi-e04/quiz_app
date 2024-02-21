import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ui_constants.dart';
import 'app_colors.dart';

class AppTheme {
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
    primary: AppDarkColors.lightBlue,
    onPrimary: AppDarkColors.black,
    secondary: AppDarkColors.lightPink,
    onSecondary: AppDarkColors.black,
    tertiary: AppDarkColors.lightGreen,
    onTertiary: AppDarkColors.black,
    error: AppDarkColors.lightPink,
    onError: AppDarkColors.black,
    background: AppDarkColors.black,
    onBackground: AppDarkColors.white,
    surface: AppDarkColors.white.withOpacity(0.1),
    onSurface: AppDarkColors.white,
    outline: AppDarkColors.white.withOpacity(0.1),
    outlineVariant: AppDarkColors.white,
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
      fontSize: 11,
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
        bodyColor: brightness == Brightness.dark
            ? darkColorScheme.onBackground
            : lightColorScheme.onBackground,
        displayColor: brightness == Brightness.dark
            ? darkColorScheme.onBackground
            : lightColorScheme.onBackground,
      );

  static AppBarTheme appBarTheme(
    Brightness brightness,
  ) =>
      AppBarTheme(
        backgroundColor: brightness == Brightness.dark
            ? darkColorScheme.background
            : lightColorScheme.background,
        iconTheme: const IconThemeData(
          size: UIConstants.defaultIconSize,
        ),
        titleSpacing: UIConstants.defaultMargin,
        actionsIconTheme: const IconThemeData(
          size: UIConstants.defaultIconSize,
        ),
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme(brightness).displaySmall,
      );

  static InputDecorationTheme inputDecorationTheme(
    Brightness brightness,
  ) =>
      InputDecorationTheme(
        labelStyle: textTheme(brightness).bodyMedium,
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
        size: UIConstants.defaultIconSize,
        color: brightness == Brightness.dark
            ? darkColorScheme.onBackground
            : lightColorScheme.onBackground,
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
          UIConstants.defaultIconSize,
        ),
        iconColor: MaterialStateProperty.all<Color>(
          brightness == Brightness.dark
              ? darkColorScheme.primary
              : lightColorScheme.primary,
        ),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          textTheme(brightness).bodySmall?.copyWith(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
        ),
      );

  static ExpansionTileThemeData expansionTileTheme(Brightness brightness) =>
      ExpansionTileThemeData(
        backgroundColor: brightness == Brightness.dark
            ? darkColorScheme.primary.withOpacity(0.1)
            : lightColorScheme.primary.withOpacity(0.1),
        collapsedBackgroundColor: brightness == Brightness.dark
            ? darkColorScheme.primary.withOpacity(0.1)
            : lightColorScheme.primary.withOpacity(0.1),
        childrenPadding: const EdgeInsets.all(
          UIConstants.defaultPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            UIConstants.defaultBorderRadius,
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            UIConstants.defaultBorderRadius,
          ),
        ),
        expandedAlignment: Alignment.centerLeft,
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme(
    Brightness brightness,
  ) =>
      BottomNavigationBarThemeData(
        backgroundColor: brightness == Brightness.dark
            ? darkColorScheme.background
            : lightColorScheme.background,
        selectedIconTheme: IconThemeData(
          color: brightness == Brightness.dark
              ? darkColorScheme.onBackground
              : lightColorScheme.onBackground,
          size: UIConstants.defaultIconSize * 1.2,
        ),
        unselectedIconTheme: IconThemeData(
          color: brightness == Brightness.dark
              ? darkColorScheme.onBackground.withOpacity(0.5)
              : lightColorScheme.onBackground.withOpacity(0.5),
          size: UIConstants.defaultIconSize,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: textTheme(brightness).bodyMedium,
        unselectedLabelStyle: textTheme(brightness).bodySmall,
        selectedItemColor: brightness == Brightness.dark
            ? darkColorScheme.onBackground
            : lightColorScheme.onBackground,
        unselectedItemColor: brightness == Brightness.dark
            ? darkColorScheme.onBackground.withOpacity(0.5)
            : lightColorScheme.onBackground.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      );

  static ThemeData appTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required BuildContext context,
  }) =>
      ThemeData.from(
        useMaterial3: true,
        colorScheme: colorScheme,
      ).copyWith(
        brightness: brightness,
        scaffoldBackgroundColor: Colors.transparent,
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
                  ? darkColorScheme.primary
                  : lightColorScheme.primary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.onPrimary
                  : lightColorScheme.onPrimary,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(UIConstants.defaultBorderRadius),
                side: BorderSide.none,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: buttonStyle(brightness).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.background
                  : lightColorScheme.background,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.onBackground
                  : lightColorScheme.onBackground,
            ),
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
          style: buttonStyle(brightness).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.secondary
                  : lightColorScheme.secondary,
            ),
            iconColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.secondary
                  : lightColorScheme.secondary,
            ),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: buttonStyle(brightness).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.secondary
                  : lightColorScheme.secondary,
            ),
            iconColor: MaterialStateProperty.all<Color>(
              brightness == Brightness.dark
                  ? darkColorScheme.secondary
                  : lightColorScheme.secondary,
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 0.5,
        ),
        expansionTileTheme: expansionTileTheme(
          brightness,
        ),
        bottomNavigationBarTheme: bottomNavigationBarTheme(
          brightness,
        ),
      );
}
