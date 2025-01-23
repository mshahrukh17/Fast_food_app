import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:fastfood_app/Components/ButtonTheme.dart';
import 'package:fastfood_app/Components/TextTheme.dart';
import 'package:fastfood_app/Controller/CartController.dart';
import 'package:fastfood_app/View/Cartpage.dart';
import 'package:fastfood_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDetails extends StatelessWidget {
  final Foodmodel foodmodel;
  const FoodDetails({super.key, required this.foodmodel});

  @override
  Widget build(BuildContext context) {
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
                    Get.to(() => Cartpage(),
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 500),
                        transition: Transition.rightToLeftWithFade);
                  },
                  icon: Icon(Icons.shopping_bag));
            } else {
              return Badge(
                  backgroundColor: Color(0xff009944),
                  alignment: Alignment.topLeft,
                  label: Text(controller.cartItems.length.toString()),
                  textStyle: ThemeText.themetext(10.h, Colors.white),
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => Cartpage(),
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 500),
                            transition: Transition.rightToLeftWithFade);
                      },
                      icon: Icon(Icons.shopping_bag)));
            }
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                        height: 1.sh * 0.25,
                        width: 1.sw * 0.55,
                        fit: BoxFit.fill,
                      ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xFFC9C6C6),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'Popular',
                        style:
                            ThemeText.themetext(12.h, const Color(0xff004422)),
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
              style: ThemeText.themetext(28.h, Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_half,
                  color: const Color(0xffFF9F06),
                ),
                Text(
                  '  4.8 Rating',
                  style: ThemeText.themetext(14.h, Color(0xff989898)),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xff009944),
                ),
                Text(
                  '  2000+ Orders',
                  style: ThemeText.themetext(14.h, Color(0xff989898)),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Lettuse Nulla occaecat velit laborum exercita',
              style: ThemeText.themetext(16.h, Color(0xff000000)),
              textAlign: TextAlign.left,
            ),
            Spacer(),
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8),
                child: AppButtonTheme(
                    onPressed: () {
                      if (controller.isInCart(foodmodel)) {
                        controller.removeFromCart(foodmodel);
                        ElegantNotification.error(
                          width: 360,
                          isDismissable: false,
                          animationCurve: Curves.easeIn,
                          displayCloseButton: true,
                          stackedOptions: StackedOptions(
                            key: 'Top',
                            type: StackedType.same,
                            itemOffset: Offset(-5, -5),
                          ),
                          position: Alignment.topCenter,
                          animation: AnimationType.fromTop,
                          title: Text('Remove'),
                          description: Text('${foodmodel.foodname} Removed from the cart'),
                          onDismiss: () {},
                          onNotificationPressed: () {},
                        ).show(context);
                      } else {
                        controller.addToCart(foodmodel);
                         ElegantNotification.success(
                          width: 360,
                          isDismissable: false,
                          animationCurve: Curves.easeIn,
                          stackedOptions: StackedOptions(
                            key: 'top',
                            type: StackedType.same,
                            itemOffset: Offset(-5, -5),
                          ),
                          position: Alignment.topCenter,
                          animation: AnimationType.fromTop,
                          title: Text('Added'),
                          description: Text('${foodmodel.foodname} Added in the cart'),
                          onDismiss: () {},
                          onNotificationPressed: () {},
                        ).show(context);
                      }
                    },
                    child: Text(
                      controller.isInCart(foodmodel)
                          ? 'Remove from cart'
                          : 'Add to cart',
                      style: ThemeText.ButtonTextTheme(18.h, Colors.white),
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
