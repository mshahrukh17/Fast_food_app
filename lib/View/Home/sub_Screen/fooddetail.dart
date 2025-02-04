import 'package:fastfood_app/Animation/Animations.dart';
import 'package:fastfood_app/Components/Snackbar.dart';

import '../../../Export/AllExport.dart';

class FoodDetails extends StatelessWidget {
  final Foodmodel foodmodel;
  const FoodDetails({super.key, required this.foodmodel});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final CartController controller =
        Get.put(CartController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Container(
                      height: 200,
                      width: sw,
                      child: Hero(
                        tag: foodmodel.foodimage,
                        child: Image.asset(
                          foodmodel.foodimage,
                          fit: BoxFit.fitHeight,alignment: Alignment.center,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color(0xFFC7C6C6),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: CustomMainText(
                            text: 'Popular',
                            color: const Color(0xff004422),
                            fontWeight: FontWeight.bold,
                          ))),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFC7C6C6),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: const Color(0xFF000000),
                                size: 25,
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomMainText(
                    text: foodmodel.foodname,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half,
                        color: const Color(0xFFF39405),
                      ),
                      CustomMainText(
                        text: '  4.8 Ratings',
                        color: const Color(0xFF9E9E9E),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xff009944),
                      ),
                      CustomMainText(
                        text: '  2000+ Orders',
                        color: const Color(0xFF9E9E9E),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomMainText(
                    text:
                        'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Chicken Tomatoa Lettuse Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Chicken Tomatoa Lettuse Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Chicken Tomatoa Lettuse Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Chicken Tomatoa Lettuse Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.',
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Obx(
                () => FadeAnimation(
                  delay: 1,
                  child: AppButtonTheme(
                      onPressed: () {
                        if (controller.isInCart(foodmodel)) {
                          controller.removeFromCart(foodmodel);
                          showUltimateSnackBar('Removed',
                              'Food Removed from Cart', SnackBarType.delete);
                        } else {
                          controller.addToCart(foodmodel);
                          showUltimateSnackBar('Success', 'Checkout in your Cart',
                              SnackBarType.success);
                        }
                      },
                      child: CustomMainText(
                              text: controller.isInCart(foodmodel)
                                  ? 'Remove from cart'
                                  : 'Add to cart',
                              color:const Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      iscolor: true),
                ),
              )),
        ],
      ),
    );
  }
}
