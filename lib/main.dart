// ignore_for_file: dead_code
import '../Export/AllExport.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = "pk_test_TYooMQauvdEDq54NiTphI7jx";
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fast Food App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1900,
        minWidth: 375,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(375, name: MOBILE),
          ResponsiveBreakpoint.autoScale(768, name: TABLET),
          ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1900, name: 'XL'),
        ],
      ),
      initialRoute: AppRoutes.SplashScreen,
      getPages: AppPages.routes,
    );
  }
}
