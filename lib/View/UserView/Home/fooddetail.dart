import '../../../Export/AllExport.dart';

class FoodDetails extends StatelessWidget {
  final Foodmodel foodmodel;
  const FoodDetails({super.key, required this.foodmodel});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final cartController = Get.find<CartController>();
    final favController = Get.find<FavoriteController>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        title:const Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    width: sw,
                    child: Hero(
                      tag: foodmodel.foodimage,
                      child: Image.asset(
                        foodmodel.foodimage,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 35,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:const Color(0xFFC7C6C6),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: CustomMainText(
                                text: 'Popular',
                                color: const Color(0xff004422),
                                fontWeight: FontWeight.bold,
                              ))),
                          Obx(
                            () => CircleAvatar(
                              backgroundColor: const Color(0xFFC7C6C6),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      if (favController.isInFav(foodmodel)) {
                                        favController.removeFromFav(foodmodel);
                                        showUltimateSnackBar(
                                            'Removed',
                                            'Item removed from Favorite',
                                            SnackBarType.delete);
                                      } else {
                                        favController.addtoFav(foodmodel);
                                        showUltimateSnackBar(
                                            'Favorite',
                                            'Item added in Favorite',
                                            SnackBarType.added);
                                      }
                                    },
                                    icon: Icon(
                                      favController.isInFav(foodmodel)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: favController.isInFav(foodmodel)
                                          ? const Color(0xFFFF0101)
                                          : const Color(0xFF000000),
                                      size: 25,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
                            color:const Color(0xff009944),
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
                        color:const Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomMainText(
                        text: 'Resturants',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                HotelHoriList(),
                const SizedBox(
                  height: 80,
                ),
              ],
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
                        if (cartController.isInCart(foodmodel)) {
                          cartController.removeFromCart(foodmodel);
                          showUltimateSnackBar('Removed',
                              'Food Removed from Cart', SnackBarType.delete);
                        } else {
                          cartController.addToCart(foodmodel);
                          showUltimateSnackBar('Success',
                              'Checkout in your Cart', SnackBarType.success);
                        }
                      },
                      child: CustomMainText(
                        text: cartController.isInCart(foodmodel)
                            ? 'Remove from cart'
                            : 'Add to cart',
                        color: const Color(0xFFFFFFFF),
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
