import '../../Export/AllExport.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: FadeInAnimation(
          duration: Duration(milliseconds: 600),
          delay: Duration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/logo.png',
                height: sh * 0.15,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Log In",
                style: ThemeText.themetext(24.0, Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  prefixicon: Icon(Icons.mail),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labeltext: "Email Address"),
              SizedBox(
                height: 18,
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
                height: 20,
              ),
              AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.Home);
                  },
                  child: Text(
                    "Log In",
                    style: ThemeText.ButtonTextTheme(18.0, Colors.white),
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
                    child: Text(
                      "or continue with",
                      style: ThemeText.themetext(14.0, Colors.grey.shade700),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset('assets/google.png', height: 45),
                    SizedBox(width: 48),
                    Text(
                      'Login with Google',
                      style: ThemeText.themetext(16.0, Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.Signup),
                child: Text(
                  'Don’t have an account ? Sign Up',
                  style: ThemeText.themetext(18.0, Colors.black),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
