import '../Export/AllExport.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<UserOrderController>(() => UserOrderController());
  }
}
