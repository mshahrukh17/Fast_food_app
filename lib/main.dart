import 'package:responsive_framework/responsive_framework.dart';
import '../Export/AllExport.dart';

void main() {
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
        maxWidth: 1200,
        minWidth: 375,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(375, name: MOBILE),
          ResponsiveBreakpoint.autoScale(768, name: TABLET),
          ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
        ],
      ),
      // home: HomeScreen(),
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}
