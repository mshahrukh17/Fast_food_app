import '../../Export/AllExport.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      checkdata();
    });
  }
  Future<void> checkdata() async {
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool("Login") ?? false;

  if (isLoggedIn) {
    final userType = prefs.getString("usertype");

    if (userType == "admin") {
      Get.offAllNamed(AppRoutes.AdminDashboard);
      print('admin logged in');
    } else {
      Get.offAllNamed(AppRoutes.BottomNavBar);
      debugPrint("User Logged In");
    }
  } else {
    Get.offAllNamed(AppRoutes.onboarding);
    print('No user is logged in right now');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
                tag: 'assets/logo.png',
                child: Image.asset('assets/logo.png', height: 180)),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomMainText(
            text: 'ARestro',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
