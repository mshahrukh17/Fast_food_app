import '../../../Export/AllExport.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: Image.asset(
                    'assets/logo2.png',
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListOfDrawer(Icon(Icons.home_outlined), 'H O M E', () {
                  Get.back();
                  Get.offNamed(AppRoutes.BottomNavBar);
                }),
                ListOfDrawer(Icon(Icons.fastfood_outlined), 'F O O D', () {
                  Get.back();
                  Get.toNamed(AppRoutes.SeeAllPage);
                }),
                ListOfDrawer(Icon(Icons.restaurant_menu), 'R E S T U R A N T',
                    () {
                  Get.back();
                  Get.toNamed(AppRoutes.SeeAllPage);
                }),
                ListOfDrawer(Icon(Icons.favorite_border), 'F A V O R I T E',
                    () {
                  Get.back();
                  Get.toNamed(AppRoutes.FavoriteItems);
                }),
                Spacer(),
                ListOfDrawer(Icon(Icons.notifications_outlined), 'N O T I F Y',
                    () => null),
                ListOfDrawer(Icon(Icons.add_shopping_cart_sharp), 'O R D E R S',
                    () {
                  Get.back();
                  Get.toNamed(AppRoutes.UserOrderScreen);
                }),
                ListOfDrawer(Icon(Icons.logout), 'E X I T',
                    () => authController.logoutDialog())
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 160,
                    width: sw * 0.92,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff004422), Color(0xffD9FFEC)]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 6, bottom: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomMainText(
                                text: 'Special Offer\nfor match',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomMainText(
                                text:
                                    'We are here with the\nBest Burgers in town.',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                height: 30,
                                width: 85,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                    child: CustomMainText(
                                  text: 'Buy Now',
                                  fontWeight: FontWeight.bold,
                                )),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: -2, child: Image.asset('assets/burger.png'))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      CustomMainText(
                        text: 'Best Offers',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset('assets/fire.png'),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(
                          AppRoutes.SeeAllPage,
                        ),
                        child: CustomMainText(
                          text: 'See all >',
                          color: Color(0xff009944),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                FoodsHoriList(
                  isFromMain: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                RowHotelText(),
                HotelHoriList(),
                RowHotelText(),
                HotelHoriList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding RowHotelText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomMainText(
            text: 'Resturants Nearby',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.SeeAllPage),
            child: CustomMainText(
              text: 'See all >',
              color: Color(0xff009944),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  ListTile ListOfDrawer(Icon icon, String text, Function()? onTap) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: icon,
      title: CustomMainText(
        text: text,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
