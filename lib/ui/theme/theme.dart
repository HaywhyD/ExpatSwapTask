// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

final ThemeData LightTheme = ThemeData(
  primarySwatch: buildMaterialColor(Color(0xFF14394B)),
  primaryColor: Color(0xFF14394B),
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 24, fontWeight: FontWeight.w700),
    displayMedium: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 20, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 18, fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 16, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 14, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.poppins(
        color: Color(0xFF3C3C3C), fontSize: 12, fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white54;
          }
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Color(0xFF14394B).withOpacity(0.5);
          }
          return Color(0xFF14394B);
        },
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return GoogleFonts.poppins(
                color: Colors.white54,
                fontSize: 16.0,
                fontWeight: FontWeight.w600);
          }
          return GoogleFonts.poppins(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600);
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 60.0)),
      elevation: MaterialStateProperty.all(0.0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(
      Color(0xFF14394B),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(
      GoogleFonts.poppins(
          color: Color(0xFF14394B),
          fontSize: 16.0,
          fontWeight: FontWeight.w600),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
    side: MaterialStateProperty.all(
      BorderSide(
        color: Color(0xFF14394B),
      ),
    ),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50.0)),
  )),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Colors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ThemeData DarkTheme = ThemeData(
  primarySwatch: buildMaterialColor(Color(0xFF14394B)),
  primaryColor: Color(0xFF14394B),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 24, fontWeight: FontWeight.w700),
    displayMedium: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 20, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 18, fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 20, fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 16, fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 16, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 14, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.poppins(
        color: Color(0xFFE3E3E3), fontSize: 12, fontWeight: FontWeight.w500),
  ),
  scaffoldBackgroundColor: const Color(0xFF111111),
  colorScheme: const ColorScheme.light(
    background: Color(0xFF001025),
    brightness: Brightness.dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white54;
          }
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Color(0xFF14394B).withOpacity(0.5);
          }
          return Color(0xFF14394B);
        },
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return GoogleFonts.poppins(
                color: Colors.white54,
                fontSize: 16.0,
                fontWeight: FontWeight.w600);
          }
          return GoogleFonts.poppins(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600);
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 60.0)),
      elevation: MaterialStateProperty.all(0.0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(
      Colors.white,
    ),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(
      GoogleFonts.poppins(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
    side: MaterialStateProperty.all(
      BorderSide(
        color: Color(0xFF14394B),
      ),
    ),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50.0)),
  )),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Colors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  brightness: Brightness.dark,
);
