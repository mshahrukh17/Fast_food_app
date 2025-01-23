import 'package:fastfood_app/View/OnboardingSC.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context ,child) {
        return GetMaterialApp(
          title: 'Fast Food App',
          debugShowCheckedModeBanner: false,
          home: const OnboardingSC()
        );
      }
    );
  }
}