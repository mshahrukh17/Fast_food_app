import 'package:fastfood_app/View/Profile.dart';
import '../Export/AllExport.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  final CartController cartController = Get.put(CartController());

  final List<Widget> pages = [HomePage(), Cartpage(),Text('Search'), MyProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Color(0xff004422),
          unselectedItemColor: Color(0xFF9E9E9E),
          selectedLabelStyle: TextStyle(
            color: Color(0xff004422),
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
                        ? Colors.transparent
                        : Colors.red,
                    label: cartController.cartItems.isEmpty
                        ? null
                        : Text(cartController.cartItems.length.toString()),
                    child: Icon(Icons.shopping_cart)),
                label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
