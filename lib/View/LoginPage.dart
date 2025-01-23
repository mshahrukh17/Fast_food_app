import 'package:fastfood_app/Components/ButtonTheme.dart';
import 'package:fastfood_app/Components/TextFieldWidget.dart';
import 'package:fastfood_app/Components/TextTheme.dart';
import 'package:fastfood_app/View/HomePage.dart';
import 'package:fastfood_app/View/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Image.asset(
              'assets/logo.png',
              height: 1.sh * 0.15,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Log In",
              style: ThemeText.themetext(24.h, Colors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldWidget(
                prefixicon: Icon(Icons.mail),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                labeltext: "Email Address"),
            SizedBox(
              height: 18.h,
            ),
            TextFieldWidget(
                obscuretext: true,
                prefixicon: Icon(Icons.lock),
                suffixicon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                labeltext: "Password"),
            SizedBox(
              height: 20.h,
            ),
            AppButtonTheme(
                onPressed: () {
                  Get.to(() => HomePage(),
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds:600),
                      transition: Transition.fadeIn);

                },
                child: Text(
                  "Log In",
                  style: ThemeText.ButtonTextTheme(18.h, Colors.white),
                ),
                iscolor: true),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(
                    indent: 20,
                    thickness: 1,
                    endIndent: 15,
                    color: Colors.black,
                  ),
                ),
                Flexible(
                  child: Text(
                    "or continue with",
                    style: ThemeText.themetext(14.h, Colors.grey.shade700),
                  ),
                ),
                Flexible(
                  child: Divider(
                    indent: 15,
                    thickness: 1,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              height: 55.h,
              width: 1.sw * 0.88,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Image.asset(
                    'assets/google.png',
                    height: 45.h,
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Text(
                    'Login with Google',
                    style: ThemeText.themetext(16.h, Colors.grey.shade700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () => Get.to(() => SignupPage(),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500),
                  transition: Transition.topLevel),
              child: Text(
                'Don’t have an account ? Sign Up',
                style: ThemeText.themetext(18.h, Colors.black),
              ),
            ),
            // Container(
            //   // color: Colors.red,
            //   child: SvgPicture.asset('assets/svg/image.svg', height: 150, width: 150,fit: BoxFit.cover,))
          ],
        ),
      )),
    );
  }
}
