import 'package:fastfood_app/Export/AllExport.dart';

class CustomMainText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomMainText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.manrope(
        textStyle : TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight
        ) 
      )
    );
  }
}
