import '../Export/AllExport.dart';

class SignUpBindings extends Bindings{
 @override
 void dependencies(){
  Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
 } 
}