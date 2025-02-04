import 'package:fastfood_app/Components/BottomNavBar.dart';
import 'package:fastfood_app/View/Cart/sub_screen/Order_done.dart';
import 'package:fastfood_app/View/Home/sub_Screen/See_all_Page.dart';
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
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Signup,
        page: () => SignupPage(),
        curve: Curves.easeIn,
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.BottomNavBar,
        page: () => BottomNavBar(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Home,
        page: () => HomePage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.FoodDetails,
        page: () => FoodDetails(
              foodmodel: Get.arguments,
            ),
        curve: Curves.easeIn,
        transition: Transition.upToDown,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.SeeAllPage,
        page: () => SeeAllPage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.CartPage,
        page: () => Cartpage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 600)),
        GetPage(
        name: AppRoutes.OrderDone,
        page: () => OrderDone(),
        curve: Curves.easeIn,
        transition: Transition.topLevel,
        transitionDuration: Duration(milliseconds: 600))
  ];
}
