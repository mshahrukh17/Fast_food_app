import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  static TextStyle themetext(fontSize, color) {
    return GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize, 
          color: color,
          fontWeight: FontWeight.bold));
  }

   static TextStyle ButtonTextTheme(fontSize, color) {
    return GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize, 
          color: color,
          fontWeight: FontWeight.bold));
  }
}
