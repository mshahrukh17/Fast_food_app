import 'package:fastfood_app/Animation/Animations.dart';
import '../../Export/AllExport.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor:const Color(0xFFFFFFFF),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset(
                    'assets/logo2.png',
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListOfDrawer(Icon(Icons.home_outlined), 'H O M E',
                    () => Get.offNamed(AppRoutes.BottomNavBar)),
                ListOfDrawer(Icon(Icons.fastfood_outlined), 'F O O D', () => null),
                ListOfDrawer(
                    Icon(Icons.restaurant_menu), 'R E S T U R A N T', () => null),
                ListOfDrawer(Icon(Icons.history), 'H I S T O R Y', () => null),
                Spacer(),
                ListOfDrawer(Icon(Icons.notifications_outlined),
                    'N O T I F I C A T I O N S', () => null),
                ListOfDrawer(Icon(Icons.settings_outlined), 'S E T T I N G S',
                    () => null),
                ListOfDrawer(Icon(Icons.logout), 'L O G O U T', () => null)
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
            physics: const BouncingScrollPhysics(),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Best Offer',
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
                      )
                    ],
                  ),
                ),
                Container(
                  height: sh * 0.3,
                  width: sw,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.FoodDetails,
                              arguments: food),
                          child: Container(
                            height: sh,
                            width: sw * 0.36,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 5,
                                    right: 15,
                                    left: 15,
                                    child: Container(
                                      height: sh * 0.2,
                                      width: sw * 0.22,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                                child: CustomMainText(
                                              text: food.foodname,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                            SizedBox(height: 8),
                                            FittedBox(
                                                child: CustomMainText(
                                              text: food.details,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade600,
                                            )),
                                            SizedBox(height: 8),
                                            FittedBox(
                                                child: CustomMainText(
                                              text:
                                                  'Rs ' + food.price.toString(),
                                              color: Color(0xff009944),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                  top: 0,
                                  left: 5,
                                  right: 5,
                                  child: Container(
                                    height: sh * 0.155,
                                    width: sw * 0.1,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: FadeAnimation(
                                      delay: 1,
                                      child: Center(
                                        child: Hero(
                                          tag: food.foodimage,
                                          child: Image.asset(
                                            food.foodimage,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Resturant Nearby',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomMainText(
                        text: 'See all >',
                        color: Color(0xff009944),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 187,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: sh * 0.13,
                              width: sw * 0.45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/hotel.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomMainText(
                                    text: 'Resturant Nearby',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFFF9900),
                                      ),
                                      CustomMainText(
                                        text: ' 4.5',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Resturant Nearby',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomMainText(
                        text: 'See all >',
                        color: Color(0xff009944),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 187,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: sh * 0.13,
                              width: sw * 0.45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/hotel.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomMainText(
                                    text: 'Resturant Nearby',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFFF9900),
                                      ),
                                      CustomMainText(
                                        text: ' 4.5',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
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
