import 'package:flutter_svg/svg.dart';

import '../Export/AllExport.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SvgPicture.network(
                "https://static.vecteezy.com/system/resources/thumbnails/022/664/807/small_2x/cat-face-silhouettes-cat-face-svg-black-and-white-cat-vector.jpg",height: 200,width: 100,),
            SvgPicture.asset(
              'assets/images/svg/salad.svg',
              height: 50,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                height: sh * 0.2,
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
                          Text(
                            'Special Offer\nfor March',
                            textAlign: TextAlign.start,
                            style: ThemeText.themetext(20, Colors.white),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'We are here with the\nBest Burgers in town.',
                            style: ThemeText.themetext(10, Colors.white),
                          ),
                          Container(
                            height: 30,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: ThemeText.themetext(12, Colors.black),
                              ),
                            ),
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
                  Text(
                    'Best Offers',
                    style: ThemeText.themetext(20, Colors.black),
                  ),
                  Text(
                    'See all >',
                    style: ThemeText.themetext(16, Color(0xff009944)),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: sh * 0.36,
                  width: sw,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () => Get.toNamed(AppRoutes.FoodDetails,
                              arguments: food),
                          child: Container(
                            height: sh,
                            width: sw * 0.35,
                            // color: Colors.blue,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 10,
                                    right: 15,
                                    left: 15,
                                    child: Container(
                                      height: sh * 0.3,
                                      width: sw * 0.2,
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
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              child: Text(food.foodname,
                                                  style: ThemeText.themetext(
                                                      18, Colors.black)),
                                            ),
                                            SizedBox(height: 12),
                                            FittedBox(
                                              child: Text(food.details,
                                                  style: ThemeText.themetext(
                                                      13.0, Colors.grey)),
                                            ),
                                            SizedBox(height: 15),
                                            FittedBox(
                                              child: Text(
                                                  'Rs ' + food.price.toString(),
                                                  style: ThemeText.themetext(
                                                      18.0, Color(0xff009944))),
                                            ),
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
                                    child: Center(
                                      child: Hero(
                                        tag: food.foodimage,
                                        child: Transform.rotate(
                                            angle: 0.1,
                                            child: Image.asset(food.foodimage)),
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
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurants Nearby',
                    style: ThemeText.themetext(20, Colors.black),
                  ),
                  Text(
                    'See all >',
                    style: ThemeText.themetext(16, Color(0xff009944)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: sw * 0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: Offset(1, 3))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: sh * 0.16,
                              width: sw,
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
                                  Text(
                                    'Restaurant Name',
                                    style:
                                        ThemeText.themetext(15, Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '4.5',
                                        style: ThemeText.themetext(
                                            13, Colors.black),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
