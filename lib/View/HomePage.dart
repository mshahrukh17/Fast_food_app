import 'package:fastfood_app/Components/TextTheme.dart';
import 'package:fastfood_app/View/fooddetail.dart';
import 'package:fastfood_app/model/dummymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/logo2.png',
          height: 35.h,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Container(
                height: 1.sh * 0.2,
                width: 1.sw * 0.92,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff004422), Color(0xffD9FFEC)]),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, top: 6.h, bottom: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Special Offer\nfor March',
                            textAlign: TextAlign.start,
                            style: ThemeText.themetext(20.h, Colors.white),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'We are here with the\nBest Burgers in town.',
                            style: ThemeText.themetext(10.h, Colors.white),
                          ),
                          Container(
                            height: 30.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: ThemeText.themetext(12.h, Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: -2.w, child: Image.asset('assets/burger.png'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Offers',
                    style: ThemeText.themetext(20.h, Colors.black),
                  ),
                  Text(
                    'See all >',
                    style: ThemeText.themetext(16.h, Color(0xff009944)),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: 1.sh * 0.4,
                  width: 1.sw,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: InkWell(
                          onTap: () => Get.to(
                              () => FoodDetails(
                                    foodmodel: food,
                                  ),
                              curve: Curves.decelerate,
                              duration: Duration(milliseconds: 400),
                              transition: Transition.upToDown),
                          child: Container(
                            height: 1.sh,
                            width: 1.sw * 0.35,
                            // color: Colors.blue,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 10,
                                    right: 15,
                                    left: 15,
                                    child: Container(
                                      height: 1.sh * 0.3,
                                      width: 1.sw * 0.2,
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
                                        padding: const EdgeInsets.only(top: 70),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(food.foodname,
                                                style: ThemeText.themetext(
                                                    20.h, Colors.black)),
                                            SizedBox(height: 12.h),
                                            Text(food.details,
                                                style: ThemeText.themetext(
                                                    13.h, Colors.grey)),
                                            SizedBox(height: 15.h),
                                            Text('Rs ' + food.price.toString(),
                                                style: ThemeText.themetext(
                                                    18.h, Color(0xff009944))),
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: 10,
                                    left: 5,
                                    right: 5,
                                    child: Hero(
                                      tag: food.foodimage,
                                      child: Transform.rotate(
                                        angle: 0.1,
                                        child: Container(
                                          height: 1.sh * 0.155,
                                          width: 1.sw * 0.1,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    food.foodimage,
                                                  ),
                                                  alignment: Alignment.center,
                                                  fit: BoxFit.contain)),
                                        ),
                                      ),
                                    )),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurants Nearby',
                    style: ThemeText.themetext(20.h, Colors.black),
                  ),
                  Text(
                    'See all >',
                    style: ThemeText.themetext(16.h, Color(0xff009944)),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: 1.sh * 0.23,
                  width: 1.sw,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 1.sh,
                          width: 1.sw * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 1.sh * 0.13,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/hotel.png'),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Restaurant Name',
                                style: ThemeText.themetext(15.h, Colors.black),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '4.5',
                                    style:
                                        ThemeText.themetext(13.h, Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}