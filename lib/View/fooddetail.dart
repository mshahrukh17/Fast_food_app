import 'package:fastfood_app/Components/Snackbar.dart';

import '../Export/AllExport.dart';

class FoodDetails extends StatelessWidget {
  final Foodmodel foodmodel;
  const FoodDetails({super.key, required this.foodmodel});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final CartController controller =
        Get.put(CartController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(foodmodel.foodname),
        centerTitle: true,
        actions: [
          Obx(() {
            if (controller.cartItems.isEmpty) {
              return IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.CartPage);
                  },
                  icon: Icon(Icons.shopping_bag));
            } else {
              return Badge(
                  backgroundColor: Color(0xff009944),
                  alignment: Alignment.topLeft,
                  label: Text(controller.cartItems.length.toString()),
                  textStyle: ThemeText.themetext(10, Colors.white),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.CartPage);
                      },
                      icon: Icon(Icons.shopping_bag)));
            }
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                  tag: foodmodel.foodimage,
                  child: Transform.rotate(
                      angle: 6,
                      child: Image.asset(
                        foodmodel.foodimage,
                        height: sh * 0.25,
                        width: sw * 0.54,
                        fit: BoxFit.fill,
                      ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color(0xFFC9C6C6),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'Popular',
                        style: ThemeText.themetext(12, const Color(0xff004422)),
                      ),
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor: Color(0xFFC9C6C6),
                      child: Icon(
                        Icons.favorite_outlined,
                        color: const Color(0xff004422),
                      ))
                ],
              ),
            ),
            Text(
              foodmodel.foodname,
              style: ThemeText.themetext(28, Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_half,
                  color: const Color(0xffFF9F06),
                ),
                Text(
                  '  4.8 Rating',
                  style: ThemeText.themetext(14, Color(0xff989898)),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xff009944),
                ),
                Text(
                  '  2000+ Orders',
                  style: ThemeText.themetext(14, Color(0xff989898)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Lettuse Nulla occaecat velit laborum exercita',
              style: ThemeText.themetext(16, Color(0xff000000)),
              textAlign: TextAlign.left,
            ),
            Spacer(),
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: AppButtonTheme(
                    onPressed: () {
                      if (controller.isInCart(foodmodel)) {
                        controller.removeFromCart(foodmodel);
                        showUltimateSnackBar('Removed', 'Food removed from cart', false);
                      } else {
                        controller.addToCart(foodmodel);
                        showUltimateSnackBar('Success', 'Food Added in cart', true);
                      }
                    },
                    child: Text(
                      controller.isInCart(foodmodel)
                          ? 'Remove from cart'
                          : 'Add to cart',
                      style: ThemeText.ButtonTextTheme(18, Colors.white),
                    ),
                    iscolor: true),
              );
            })
          ],
        ),
      ),
    );
  }
}
