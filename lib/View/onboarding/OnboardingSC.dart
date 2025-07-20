import '../../Export/AllExport.dart';

class OnboardingSC extends StatelessWidget {
  const OnboardingSC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Hero(
                    tag: 'assets/logo.png',
                    child: Image.asset('assets/logo.png', height: 160)),
             const SizedBox(
                height: 10,
              ),
            const CustomMainText(
                text: 'ARestro',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
             const SizedBox(height: 80),
              AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.Login);
                  },
                  child:const CustomMainText(
                    text: 'Log In',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  iscolor: true),
             const SizedBox(
                height: 20,
              ),
              AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.Signup);
                  },
                  child:const CustomMainText(
                    text: 'Sign Up',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  iscolor: false),
            ],
          ),
        ),
      ),
    );
  }
}
