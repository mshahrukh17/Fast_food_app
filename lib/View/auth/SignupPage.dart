import '../../Export/AllExport.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: sh * 0.15,
              ),
              SizedBox(height: 10),
              Text(
                "Sign Up",
                style: ThemeText.themetext(24.0, Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  prefixicon: Icon(Icons.person),
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  labeltext: "User Name"),
              SizedBox(height: 18),
              TextFieldWidget(
                  prefixicon: Icon(Icons.mail),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labeltext: "Email Address"),
              SizedBox(height: 18),
              TextFieldWidget(
                  obscuretext: true,
                  prefixicon: Icon(Icons.lock),
                  suffixicon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labeltext: "Password"),
              SizedBox(height: 20),
              TextFieldWidget(
                  prefixicon: Icon(Icons.phone),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  labeltext: "Phone Number"),
              SizedBox(height: 18),
              AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.Home);
                  },
                  child: Text(
                    "Sign up",
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
                      width: 30,
                    ),
                    Text(
                      'Sign Up with Google',
                      textAlign: TextAlign.center,
                      style: ThemeText.themetext(16.0, Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.Login),
                child: Text(
                  'Already have an account ? Log In',
                  style: ThemeText.themetext(18.0, Colors.black),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
