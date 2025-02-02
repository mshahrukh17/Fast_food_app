import '../Export/AllExport.dart';

class ThemeText {
  static TextStyle themetext(double fontSize,Color color) {
    return GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize, 
          color: color,
          fontWeight: FontWeight.bold));
  }

   static TextStyle ButtonTextTheme(double fontSize,Color color) {
    return GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize, 
          color: color,
          fontWeight: FontWeight.bold));
  }
}
