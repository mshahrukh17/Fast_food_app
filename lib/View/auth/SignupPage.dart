import 'package:fastfood_app/Controller/authController/AuthController.dart';

import '../../Export/AllExport.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final AuthController controller = Get.put(AuthController());
    return Scaffold(
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
              SizedBox(height: 10),
              CustomMainText(
                text: 'Sign Up',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  prefixicon: Icon(Icons.person),
                  controller: controller.usernameController,
                  keyboardType: TextInputType.name,
                  labeltext: "User Name"),
              SizedBox(height: 18),
              TextFieldWidget(
                  prefixicon: Icon(Icons.mail),
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  labeltext: "Email Address"),
              SizedBox(height: 18),
              Obx(()=> TextFieldWidget(
                    obscuretext: !controller.showPassword.value,
                    prefixicon: Icon(Icons.lock),
                    suffixicon: IconButton(
                        onPressed: () {
                          controller.showPassword.value = !controller.showPassword.value;
                        }, icon: Icon(controller.showPassword.value ? Icons.visibility : Icons.visibility_off)),
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    labeltext: "Password"),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                  prefixicon: Icon(Icons.phone),
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  labeltext: "Phone Number"),
              SizedBox(height: 18),
              AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.Home);
                  },
                  child: CustomMainText(
                    text: 'Sign Up',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  iscolor: true),
              SizedBox(
                height: 25,
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
              SizedBox(
                height: 25,
              ),
              Container(
                height: 55,
                width: sw * 0.88,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/google.png',
                      height: 45,
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    CustomMainText(
                      text: 'Sign Up with Google',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.Login),
                child: CustomMainText(text: 'Already Have an Account? Log In', fontWeight: FontWeight.w500,),
              )
            ],
          ),
        ),
      )),
    );
  }
}
