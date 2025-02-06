
import 'package:fastfood_app/View/Home/sub_Screen/Favorite.dart';

import '../Export/AllExport.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingSC(),
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginPage(),
        curve: Curves.easeInOut,
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Signup,
        page: () => SignupPage(),
        curve: Curves.easeInOut,
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.BottomNavBar,
        page: () => BottomNavBar(),
        curve: Curves.easeInOut,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Home,
        page: () => HomePage(),
        curve: Curves.easeInOut,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.FoodDetails,
        page: () => FoodDetails(
              foodmodel: Get.arguments,
            ),
        curve: Curves.easeInOut,
        transition: Transition.upToDown,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.SeeAllPage,
        page: () => SeeAllPage(),
        curve: Curves.easeInOut,
        transition: Transition.downToUp,
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
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.ResturantDetails,
        page: () => ResturantDetails(
              resturantdata: Get.arguments,
            ),
        curve: Curves.easeInOut,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.ReserveTable,
        page: () => ReserveTable(),
        curve: Curves.easeInOut,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.TableBook,
        page: () => TableBook(),
        curve: Curves.easeInOut,
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 600)),
        GetPage(
        name: AppRoutes.FavoriteItems,
        page: () => FavoriteItems(),
        curve: Curves.easeInOut,
        transition: Transition.topLevel,
        transitionDuration: Duration(milliseconds: 600)),
  ];
}
