import 'package:fastfood_app/View/UserView/Home/sub_Screen/user_orderView.dart';
import 'package:fastfood_app/bindings/admin_binding.dart';
import 'package:fastfood_app/bindings/app_binding.dart';
import 'package:fastfood_app/bindings/login_binding.dart';
import 'package:fastfood_app/bindings/signup_binding.dart';
import '../Export/AllExport.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashScreen(),
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 600)
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingSC(),
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 600)
    ),
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginPage(),
        curve: Curves.easeInOut,
        transition: Transition.downToUp,
        binding: LoginBindings(),
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Signup,
        page: () => SignupPage(),
        curve: Curves.easeInOut,
        transition: Transition.downToUp,
        binding: SignUpBindings(),
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.BottomNavBar,
        page: () => BottomNavBar(),
        curve: Curves.easeInOut,
        transition: Transition.fadeIn,
        binding: AppBindings(),
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.Home,
        page: () => HomePage(),
        curve: Curves.easeInOut,
        transition: Transition.fadeIn,
        binding: AppBindings(),
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.FoodDetails,
        page: () => FoodDetails(
              foodmodel: Get.arguments,
            ),
        curve: Curves.easeInOut,
        transition: Transition.upToDown,
        binding: AppBindings(),
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
        binding: AppBindings(),
        transitionDuration: Duration(milliseconds: 600)),
    GetPage(
        name: AppRoutes.OrderDone,
        page: () => OrderDone(),
        curve: Curves.easeIn,
        transition: Transition.zoom,
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
        binding: AppBindings(),
        transitionDuration: Duration(milliseconds: 600)),
        GetPage(
        name: AppRoutes.AdminDashboard,
        page: () => dashboardScreen(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
        binding: AdminBindings(),
        transitionDuration: Duration(milliseconds: 600)),
        GetPage(
        name: AppRoutes.AdminOrderScreen,
        page: () => orderScreen(),
        curve: Curves.easeIn,
        transition: Transition.leftToRight,
        binding: AdminBindings(),
        transitionDuration: Duration(milliseconds: 600)),
        GetPage(
        name: AppRoutes.UserOrderScreen,
        page: () => UserOrderScreen(),
        curve: Curves.easeIn,
        transition: Transition.leftToRight,
        binding: AppBindings(),
        transitionDuration: Duration(milliseconds: 600)),
  ];
}