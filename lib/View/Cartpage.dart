import 'package:fastfood_app/Components/Snackbar.dart';
import '../Export/AllExport.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final CartController controller =
        Get.put(CartController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart Page',
          style: ThemeText.themetext(22.0, Colors.black),
        ),
        centerTitle: true,
      ),
      body: controller.cartItems.isEmpty
          ? Center(
              child: Text(
                "No Items in Cart",
                style: ThemeText.themetext(20.0, Color(0xFF9C9A9A)),
              ),
            )
          : Column(
              children: [
                Container(
                  height: sh * 0.62,
                  width: sw,
                  // color: Colors.red,
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
                              vertical: 8,
                            ),
                            child: Container(
                              color: Color(0xff004422),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
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
                                vertical: 8, horizontal: 12),
                            child: Container(
                              height: sh * 0.14,
                              width: sw,
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
                                    height: sh * 0.12,
                                    width: sw * 0.3,
                                  ),
                                  SizedBox(
                                    width: 8,
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
                                            18.0, Colors.black),
                                      ),
                                      Text(
                                        cartitem.details,
                                        style: ThemeText.themetext(
                                            18.0, Color(0xffBEBCBC)),
                                      ),
                                      Text(
                                        'Rs ' + cartitem.price.toString(),
                                        style: ThemeText.themetext(
                                            18.0, Color(0xff009944)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
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
                                            height: 20,
                                            child: Text(
                                              cartitem.quantity.toString(),
                                              style: ThemeText.themetext(
                                                  15.0, Colors.black),
                                            )),
                                        Container(
                                          height: 30,
                                          width: 30,
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
                                    height: sh,
                                    width: 38,
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
                                            onTap: () =>
                                               showUltimateSnackBar('Info', 'Swipe left to remove this item', false),
                                            child: Text(
                                              'D E L E T E',
                                              style: ThemeText.themetext(
                                                  15.0, Colors.white),
                                            ),
                                          )),
                                    )),
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
                Container(
                  height: sh * 0.28,
                  width: sw,
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Container(
                      height: sh * 0.18,
                      width: sw,
                      decoration: BoxDecoration(
                          color: Color(0xff004422),
                          borderRadius: BorderRadius.circular(8),
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
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs ' + controller.totalAmount.toString(),
                                  style: ThemeText.themetext(
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delievery Charges',
                                  style: ThemeText.themetext(
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs 50',
                                  style: ThemeText.themetext(
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: ThemeText.themetext(
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                                Text(
                                  'Rs 0',
                                  style: ThemeText.themetext(
                                      15.0, Color(0xF9DFDBDB)),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style:
                                      ThemeText.themetext(24.0, Colors.white),
                                ),
                                Text(
                                  'Rs ${controller.totalAmount + 50}',
                                  style:
                                      ThemeText.themetext(24.0, Colors.white),
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
                                      18.0, Color(0xff004422)),
                                ),
                                iscolor: false)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
