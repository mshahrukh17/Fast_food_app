import '../Export/AllExport.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.find<BottomNavController>();
  final CartController cartController = Get.find<CartController>();
  final FavoriteController favController = Get.find<FavoriteController>();

  final List<Widget> pages = [HomePage(), Cartpage(), MyProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: const Color(0xff004422),
          unselectedItemColor: const Color(0xFF9E9E9E),
          selectedLabelStyle: TextStyle(
            color: const Color(0xff004422),
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Badge(
                    alignment: Alignment.topRight,
                    backgroundColor: cartController.cartItems.isEmpty
                        ? const Color(0x00000000)
                        : const Color(0xFFF44336),
                    label: cartController.cartItems.isEmpty
                        ? null
                        : Text(cartController.cartItems.length.toString()),
                    child: Icon(Icons.shopping_cart)),
                label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
