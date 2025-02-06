import '../../Export/AllExport.dart';

class AuthController extends GetxController {
  // Controller of SignUp Page
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;

  // Controller of Login Page
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  RxBool loginshowPassword = false.obs;

  RxBool isloading = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }

  void SignUp() async {
    if (usernameController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please enter your Name', SnackBarType.error);
      return;
    }
    if (emailController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please enter your Email', SnackBarType.error);
      return;
    }
    if (phoneController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please enter your Phone Number', SnackBarType.error);
      return;
    }
    if (passwordController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please set your Password', SnackBarType.error);
      return;
    }
    isloading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isloading.value = false;
    Get.offAllNamed(AppRoutes.BottomNavBar);
  }

  Future<void> LoginUser() async {
    if (loginEmailController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please enter your Email', SnackBarType.error);
      return;
    }
    if (loginPasswordController.text.isEmpty) {
      showUltimateSnackBar(
          'Error', 'Please enter your Password', SnackBarType.error);
      return;
    }
    isloading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isloading.value = false;
    Get.offAllNamed(AppRoutes.BottomNavBar);
  }

  void logout() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Yes",
      textCancel: "No",
      radius: 12,
      buttonColor: const Color(0xff009944),
      cancelTextColor: const Color(0xff000000),
      backgroundColor: const Color(0xFFFFFFFF),
      confirmTextColor: const Color(0xFFFFFFFF),
      onConfirm: () {
        Get.delete<AuthController>();
        Get.offAllNamed(AppRoutes.Login);
        Get.put(AuthController());
      },
    );
  }
}
