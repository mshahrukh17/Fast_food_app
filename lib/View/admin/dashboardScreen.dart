import '../../Export/AllExport.dart';

class dashboardScreen extends StatelessWidget {
  const dashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFFFFFFF),
        title: CustomMainText(
          text: 'Admin Dashboard',
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff009944),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CustomMainText(text: 'Admin Panel'),
            ),
            ListTile(
              title: CustomMainText(text: 'H O M E'),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.AdminDashboard);
              },
            ),
            ListTile(
              title: CustomMainText(text: 'O R D E R S'),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.AdminOrderScreen);
              },
            ),
            ListTile(
              title: CustomMainText(text: 'U S E R S'),
              onTap: () => null,
            ),
            ListTile(
              title: CustomMainText(text: 'S E T T I N G S'),
              onTap: () => null,
            ),
            ListTile(
              title: CustomMainText(text: 'E X I T'),
              leading: Icon(Icons.logout),
              onTap: () => authController.logoutDialog(),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
