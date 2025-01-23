import 'package:fastfood_app/Components/ButtonTheme.dart';
import 'package:fastfood_app/Components/TextFieldWidget.dart';
import 'package:fastfood_app/View/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Components/TextTheme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                Image.asset(
                  'assets/logo.png',
                  height: 1.sh * 0.15,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Sign Up",
                  style: ThemeText.themetext(24.h, Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWidget(
                    prefixicon: Icon(Icons.person),
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    labeltext: "User Name"),
                SizedBox(
                  height: 18.h,
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
                    suffixicon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    labeltext: "Password"),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWidget(
                    prefixicon: Icon(Icons.phone),
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    labeltext: "Phone Number"),
                SizedBox(
                  height: 18.h,
                ),
                AppButtonTheme(
                    onPressed: () {},
                    child: Text(
                      "Sign up",
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
                        width: 30.w,
                      ),
                      Text(
                        'Sign Up with Google',
                        textAlign: TextAlign.center,
                        style: ThemeText.themetext(16.h, Colors.grey.shade700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () => Get.to(() => LoginPage(),
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 500),
                      transition: Transition.topLevel),
                  child: Text(
                    'Already have an account ? Log In',
                    style: ThemeText.themetext(18.h, Colors.black),
                  ),
                )
              ],
            ),
          )),
    );
  }
}