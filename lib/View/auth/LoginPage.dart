import '../../Export/AllExport.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final AuthController controller = Get.find<AuthController>();
    return GestureDetector(
      onTap:()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(
                height: 50,
              ),
              Hero(
                tag: 'assets/logo.png',
                child: Image.asset(
                  'assets/logo.png',
                  height: sh * 0.15,
                ),
              ),
             const SizedBox(
                height: 10,
              ),
             const CustomMainText(
                text: 'Log In',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
             const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  prefixicon: Icon(Icons.mail),
                  controller: controller.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  labeltext: "Email Address"),
             const SizedBox(
                height: 18,
              ),
              Obx(
                () => TextFieldWidget(
                    obscuretext: !controller.loginshowPassword.value,
                    prefixicon: Icon(Icons.lock),
                    suffixicon: IconButton(
                        onPressed: () {
                          controller.loginshowPassword.value =
                              !controller.loginshowPassword.value;
                        },
                        icon: Icon(controller.loginshowPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    controller: controller.loginPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    labeltext: "Password"),
              ),
             const SizedBox(
                height: 20,
              ),
              AppButtonTheme(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.loginwithEmailPassword();
                  },
                  child: Obx(
                    () => controller.isloading.value ? CircularProgressIndicator(
                      color:const Color(0xFFFFFFFF),
                    ) : 
                   const CustomMainText(
                      text: 'Log In',
                      fontSize: 18,
                      color:const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  iscolor: true),
             const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Flexible(
                    child: Divider(
                      indent: 20,
                      thickness: 1,
                      endIndent: 15,
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: CustomMainText(text: 'Or Continue with'),
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
                onTap: () => showUltimateSnackBar('Unsupported','Google Sign In is not supported yet',SnackBarType.error),
                child: Container(
                  height: 55,
                  width: sw * 0.88,
                  decoration: BoxDecoration(
                      color:const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color:const Color(0xFF9E9E9E).withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        )
                      ],
                      border: Border.all(color:const Color(0xFF000000))),
                  child: Row(
                    children: [
                     const SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/google.png', height: 45),
                      SizedBox(width: 48),
                    const CustomMainText(
                        text: 'Log with Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
             const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => Get.offNamed(AppRoutes.Signup),
                child:const CustomMainText(
                    text: 'Dont have an Account? Sign Up',
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )),
      ),
    );
  }
}