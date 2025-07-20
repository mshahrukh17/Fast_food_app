import '../Export/AllExport.dart';

class AdminBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AdminOrderController>(() => AdminOrderController());
  }
}
