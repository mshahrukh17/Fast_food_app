import 'package:fastfood_app/Components/ButtonTheme.dart';
import 'package:fastfood_app/Components/TextTheme.dart';
import 'package:fastfood_app/View/LoginPage.dart';
import 'package:fastfood_app/View/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingSC extends StatelessWidget {
  const OnboardingSC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 1.sh * 0.15),
              Image.asset('assets/logo.png', height: 1.sh * 0.25),
              SizedBox(
                height: 10.h,
              ),
              Text("ARestro", style: ThemeText.themetext(36.h, Colors.black)),
              SizedBox(height: 1.sh * 0.15),
              AppButtonTheme(
                  iscolor: true,
                  onPressed: () {
                    Get.to(
                      () => LoginPage(),
                      curve: Curves.easeInOut,
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 400),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: ThemeText.ButtonTextTheme(18.h, Colors.white),
                  )),
              SizedBox(
                height: 18.h,
              ),
              AppButtonTheme(
                  onPressed: () {
                     Get.to(
                      () => SignupPage(),
                      curve: Curves.easeInOut,
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 400),
                    );
                  },
                  child: Text("Sign Up",
                      style: ThemeText.ButtonTextTheme(18.h, Colors.black)),
                  iscolor: false)
            ],
          ),
        ),
      ),
    );
  }
}
