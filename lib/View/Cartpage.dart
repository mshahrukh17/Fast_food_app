import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:fastfood_app/Components/ButtonTheme.dart';
import 'package:fastfood_app/Components/TextTheme.dart';
import 'package:fastfood_app/Controller/CartController.dart';
import 'package:fastfood_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller =
        Get.put(CartController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Page',
          style: ThemeText.themetext(22.h, Colors.black),
        ),
        centerTitle: true,
      ),
      body: controller.cartItems.isEmpty
          ? Center(
              child: Text("No Items in Cart",
              style: ThemeText.themetext(20.h, Color(0xFF9C9A9A)),
              ),
            )
          : Column(
              children: [
                Container(
                  height: 1.sh * 0.63,
                  width: 1.sw,
                  child: Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        Foodmodel cartitem = controller.cartItems[index];
                        return Dismissible(
                          key: Key(cartitem.foodimage),
                          direction: DismissDirection.endToStart,
                          background: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h,),
                            child: Container(
                              color: Color(0xff004422),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child:
                                          Icon(Icons.delete, color: Colors.white),
                                    ),
                                    Text(
                                      'D E L E T E',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            controller.removeFromCart(cartitem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text("${cartitem.foodname} dismissed")),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 12.w),
                            child: Container(
                              height: 1.sh * 0.14,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    cartitem.foodimage,
                                    height: 1.sh * 0.12,
                                    width: 1.sw * 0.3,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        cartitem.foodname,
                                        style: ThemeText.themetext(
                                            18.h, Colors.black),
                                      ),
                                      Text(
                                        cartitem.details,
                                        style: ThemeText.themetext(
                                            18.h, Color(0xffBEBCBC)),
                                      ),
                                      Text(
                                        'Rs ' + cartitem.price.toString(),
                                        style: ThemeText.themetext(
                                            18.h, Color(0xff009944)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 30.h,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff004422),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () => controller
                                                .increaseQuantity(cartitem),
                                            child: Icon(
                                              Icons.add,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          )),
                                        ),
                                        SizedBox(
                                            height: 20.h,
                                            child: Text(
                                              cartitem.quantity.toString(),
                                              style: ThemeText.themetext(
                                                  15.h, Colors.black),
                                            )),
                                        Container(
                                          height: 30.h,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFDAD8D8),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () => controller
                                                .decreaseQuantity(cartitem),
                                            child: Icon(
                                              Icons.remove,
                                              color: Color(0xff004422),
                                            ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 1.sh,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xff009944),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: RotatedBox(
                                          quarterTurns: -1,
                                          child: InkWell(
                                            onTap: () => ElegantNotification.info(
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
                                                title: Text('Info'),
                                                description: Text(
                                                    'Swipe left to Delete this item'),
                                                onDismiss: () {},
                                                onNotificationPressed: () {},
                                              ).show(context),
                                            child: Text('D E L E T E',
                                            style: ThemeText.themetext(15.h, Colors.white),
                                            ),
                                          )),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
                Obx(() => controller.cartItems.isEmpty ? Center(child: Text('You Deleted this Food')) : 
                   Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                    ),
                    child: Container(
                      height: 1.sh * 0.26,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff004422),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff004422),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub-Total',
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs ' + controller.totalAmount.toString(),
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delievery Charges',
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs 50',
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs 0',
                                  style: ThemeText.themetext(
                                      15.h, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style:
                                      ThemeText.themetext(24.h, Colors.white),
                                ),
                                Text(
                                  'Rs ${controller.totalAmount + 50}',
                                  style:
                                      ThemeText.themetext(24.h, Colors.white),
                                ),
                              ],
                            ),
                            Spacer(),
                            AppButtonTheme(
                                onPressed: () {
                                  QuickAlert.show(
                                    context: context,
                                    title: 'Order Placed',
                                    type: QuickAlertType.success,
                                    text: 'Order Completed Successfully!',
                                    autoCloseDuration:
                                        const Duration(seconds: 3),
                                    showConfirmBtn: false,
                                  );
                                  controller.cartItems.clear();
                                },
                                child: Text(
                                  'Place my order',
                                  style: ThemeText.ButtonTextTheme(
                                      18.h, Color(0xff004422)),
                                ),
                                iscolor: false)
                          ],
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
    );
  }
}
