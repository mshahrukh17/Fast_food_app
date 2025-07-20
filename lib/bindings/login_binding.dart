import '../Export/AllExport.dart';

class LoginBindings extends Bindings{
 @override
 void dependencies(){
  Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
 } 
}