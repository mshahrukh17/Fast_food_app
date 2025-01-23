// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: onPressed,
        child: child,
        color:iscolor ?const Color(0xff009944) : Colors.white,
        minWidth: 1.sw * 0.88,
        height: 55.h,
        animationDuration: Duration(milliseconds: 800),
        hoverColor:iscolor? Color(0xFF0A552C) : Colors.grey.shade300,
        elevation: 5,
        splashColor:iscolor? const Color(0xFF0A552C) : Colors.grey.shade300,
        focusElevation: 5,
        disabledColor:iscolor ? const Color(0xff009944) : Colors.grey.shade300,
        disabledTextColor:iscolor ? const Color(0xff009944) : Colors.grey.shade300,
        focusColor:iscolor ? const Color(0xff009944) : Colors.grey.shade300,
        highlightColor:iscolor ? const Color(0xFF0CC05D) : Colors.grey.shade300,
        mouseCursor: SystemMouseCursors.basic,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(
          color: iscolor ?const Color(0xff009944) : Colors.black,
          width: 1.1
        )),
      ),
    );
  }
}
