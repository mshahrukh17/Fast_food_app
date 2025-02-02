import '../Export/AllExport.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingSC(),
      curve: Curves.easeIn,
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginPage(),
        curve: Curves.easeIn,
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: AppRoutes.Signup,
        page: () => SignupPage(),
        curve: Curves.easeIn,
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: AppRoutes.Home,
        page: () => HomePage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: AppRoutes.FoodDetails,
        page: () => FoodDetails(
              foodmodel: Get.arguments,
            ),
        curve: Curves.easeIn,
        transition: Transition.upToDown,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: AppRoutes.CartPage,
        page: () => Cartpage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500))
  ];
}
