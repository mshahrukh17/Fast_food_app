// ignore_for_file: deprecated_member_use

import '../../Export/AllExport.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final AuthController controller = Get.find<AuthController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'assets/logo.png',
                  child: Image.asset(
                    'assets/logo.png',
                    height: sh * 0.15,
                  ),
                ),
               const SizedBox(height: 10),
               const CustomMainText(
                  text: 'Sign Up',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
               const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    prefixicon: Icon(Icons.person),
                    controller: controller.usernameController,
                    keyboardType: TextInputType.name,
                    labeltext: "User Name"),
               const SizedBox(height: 18),
                TextFieldWidget(
                    prefixicon: Icon(Icons.mail),
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    labeltext: "Email Address"),
               const SizedBox(height: 18),
              //   TextFieldWidget(
              //       prefixicon: Icon(Icons.phone),
              //       controller: controller.phoneController,
              //       keyboardType: TextInputType.phone,
              //       labeltext: "Phone Number"),
              //  const SizedBox(height: 18),
                Obx(
                  () => TextFieldWidget(
                      obscuretext: !controller.showPassword.value,
                      prefixicon: Icon(Icons.lock),
                      suffixicon: IconButton(
                          onPressed: () {
                            controller.showPassword.value =
                                !controller.showPassword.value;
                          },
                          icon: Icon(controller.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      labeltext: "Password"),
                ),
               const SizedBox(height: 18),
                AppButtonTheme(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.signupWithEmailPassword();
                    },
                    child: Obx(
                      () => controller.isloading.value
                          ? CircularProgressIndicator(
                              color: const Color(0xFFFFFFFF),
                            )
                          : const CustomMainText(
                              text: 'Sign Up',
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                    ),
                    iscolor: true),
               const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Divider(
                        indent: 20,
                        thickness: 1,
                        endIndent: 15,
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: CustomMainText(
                        text: 'Or Continue with',
                        fontWeight: FontWeight.w400,
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
               const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () => showUltimateSnackBar('Unsupported', 'Google Sign Up is not supported yet', SnackBarType.error),
                  child: Container(
                    height: 55,
                    width: sw * 0.88,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color:const Color(0xFF000000)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9E9E9E).withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                       const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/google.png',
                          height: 45,
                        ),
                       const SizedBox(
                          width: 45,
                        ),
                       const CustomMainText(
                          text: 'Sign Up with Google',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(AppRoutes.Login),
                  child: CustomMainText(
                    text: 'Already Have an Account? Log In',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
