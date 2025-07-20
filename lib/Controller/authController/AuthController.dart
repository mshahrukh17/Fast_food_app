import 'package:fastfood_app/services/auth_service.dart';
import '../../Export/AllExport.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final userController = Get.lazyPut<UserController>(() => UserController());
  // TextController of SignUp Page
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;

  // TextController of Login Page
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  RxBool loginshowPassword = false.obs;

  RxBool isloading = false.obs;
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> setpreference(UserModel data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Login", true);
    await prefs.setString("usertype", data.type);
    await prefs.setString("name", data.name);
    await prefs.setString("email", data.email);
    await prefs.setString("userID", data.userID);
    await prefs.setString("image", data.image ?? '');
  }

  void signupWithEmailPassword() async {
    try {
      isloading.value = true;
      final UserCredential = await _authService.registerwithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());
      var userId = UserCredential.user!.uid;

      final userModel = UserModel(
          name: usernameController.text.trim(),
          email: emailController.text.trim(),
          userID: userId,
          type: 'user');
      await firestore.collection('users').doc(userId).set(userModel.toMap());
      await setpreference(userModel);
      await UserController().loadUserInfo();
      isloading.value = false;
      showUltimateSnackBar(
          'Success', 'Account created successfully', SnackBarType.success);
      resetFields();
      Get.offAllNamed(AppRoutes.BottomNavBar);
    } catch (e) {
      showUltimateSnackBar('Error', '${e.toString()}', SnackBarType.error);
    }finally{
      isloading.value = false;
    }
  }

  Future<void> loginwithEmailPassword() async {
    try {
      // if (loginEmailController.text.isEmpty) {
      //   showUltimateSnackBar(
      //       'Error', 'Please enter your Email', SnackBarType.error);
      //   return;
      // }
      // if (loginPasswordController.text.isEmpty) {
      //   showUltimateSnackBar(
      //       'Error', 'Please enter your Password', SnackBarType.error);
      //   return;
      // }
      isloading.value = true;
      final UserCredential = await _authService.loginWithEmalAndPassword(
          loginEmailController.text.trim(),
          loginPasswordController.text.trim());
      final uid = UserCredential.user!.uid;
      final userDoc = await firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final user = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        await setpreference(user);
        await UserController().loadUserInfo();
        print('user is logging $uid');
        resetFields();
        Get.offAllNamed(AppRoutes.BottomNavBar);
      } else {
        final adminDoc = await firestore.collection('admin').doc(uid).get();
        if (adminDoc.exists) {
          final admin =
              UserModel.fromMap(adminDoc.data() as Map<String, dynamic>);
          await setpreference(admin);
          resetFields();
          Get.offAllNamed(AppRoutes.AdminDashboard);
          print('admin is logging $uid');
        } else {
          showUltimateSnackBar('Error', 'User not found', SnackBarType.error);
        }
      }
      isloading.value = false;
      showUltimateSnackBar(
          'Success', 'User login successfully', SnackBarType.success);
      loginEmailController.clear();
      loginPasswordController.clear();
    } catch (e) {
      showUltimateSnackBar('Error', '$e', SnackBarType.error);
    } finally {
      isloading.value = false;
    }
  }

  Future<void> userLogout() async {
    try {
      await _authService.logout();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.offAllNamed(AppRoutes.Login);
    } catch (e) {
      showUltimateSnackBar(
          "Error", "${e.toString()}", SnackBarType.error);
    }
  }

  void logoutDialog() {
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
        resetFields();
        userLogout();
      },
    );
  }

  void resetFields() {
    usernameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    loginEmailController.clear();
    loginPasswordController.clear();
    showPassword.value = false;
    loginshowPassword.value = false;
    isloading.value = false;
  }
}
