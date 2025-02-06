// ignore_for_file: must_be_immutable
import '../Export/AllExport.dart';

class AppButtonTheme extends StatelessWidget {
  final void Function() onPressed;
  var child;
  bool iscolor;
  AppButtonTheme(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.iscolor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color:iscolor ?const Color(0xff009944) :const Color(0xFFFFFFFF),
      minWidth: MediaQuery.of(context).size.width * 0.88,
      height: 50,
      animationDuration: Duration(milliseconds: 800),
      hoverColor:iscolor? const Color(0xFF0A552C) :const Color(0xFFE0E0E0),
      elevation: 1,
      splashColor:iscolor? const Color(0xFF0A552C) :const Color(0xFFE0E0E0),
      focusElevation: 1,
      disabledColor:iscolor ? const Color(0xff009944) : const Color(0xFFE0E0E0),
      disabledTextColor:iscolor ? const Color(0xff009944) :const Color(0xFFE0E0E0),
      focusColor:iscolor ? const Color(0xff009944) :const Color(0xFFE0E0E0),
      highlightColor:iscolor ? const Color(0xFF0CC05D) :const Color(0xFFE0E0E0),
      mouseCursor: SystemMouseCursors.basic,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(
        color: iscolor ?const Color(0xff009944) :const Color(0xFF000000),
        width: 1
      )),
    );
  }
}
