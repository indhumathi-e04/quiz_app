import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData customTheme({
    required Color seedColor,
    required Brightness brightness,
    required BuildContext context,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: GoogleFonts.lato(
          fontSize: 17,
          fontWeight: FontWeight.w900,
        ),
        headlineLarge: GoogleFonts.lato(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.lato(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.lato(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.lato(
          fontSize: 17,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: 15,
        ),
        titleSmall: GoogleFonts.lato(
          fontSize: 13,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 13,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 12,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: GoogleFonts.lato(
          fontSize: 8,
          fontWeight: FontWeight.w400,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.lato(
          fontSize: 12,
        ),
        floatingLabelStyle: GoogleFonts.lato(
          fontSize: 12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        outlineBorder: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          textStyle: MaterialStateProperty.all<TextStyle>(
            GoogleFonts.lato(
              fontSize: 12,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.lato(
            fontSize: 12,
          ),
          floatingLabelStyle: GoogleFonts.lato(
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          outlineBorder: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
    );
  }
}
