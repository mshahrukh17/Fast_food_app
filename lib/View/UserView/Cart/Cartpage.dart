import '../../../Export/AllExport.dart';

class Cartpage extends StatelessWidget {
  Cartpage({super.key});
  final CartController cartController = Get.find<CartController>();
  // final UserController usercontroller = Get.find<UserController>();
  // final PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: CustomMainText(
                text: 'Try to Add some Food in Cart',
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ))
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: sh * 0.515,
                          width: sw,
                          // color: Colors.red,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              Foodmodel cartitem =
                                  cartController.cartItems[index];
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Icon(Icons.delete,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                          CustomMainText(
                                            text: 'D E L E T E',
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  cartController.removeFromCart(cartitem);
                                  showUltimateSnackBar(
                                      'Deleted',
                                      'Item Deleted From Cart',
                                      SnackBarType.delete);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Container(
                                    height: sh * 0.13,
                                    width: sw,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFF9E9E9E)
                                                .withOpacity(0.3),
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
                                            CustomMainText(
                                              text: cartitem.foodname,
                                              color: const Color(0xFF000000),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                            CustomMainText(
                                              text: cartitem.details,
                                              color: Color(0xFF6E6D6D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                            CustomMainText(
                                              text:
                                                  'Rs ${cartitem.price.toString()}',
                                              color: const Color(0xFF004422),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
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
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                    child: InkWell(
                                                  onTap: () => cartController
                                                      .increaseQuantity(
                                                          cartitem),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color(0xffFFFFFF),
                                                  ),
                                                )),
                                              ),
                                              SizedBox(
                                                height: 20,
                                                child: CustomMainText(
                                                  text: cartitem.quantity
                                                      .toString(),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFDAD8D8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                    child: InkWell(
                                                  onTap: () => cartController
                                                      .decreaseQuantity(
                                                          cartitem),
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
                                                  onTap: () => showUltimateSnackBar(
                                                      'Info',
                                                      'Swipe left to remove this item',
                                                      SnackBarType.info),
                                                  child: CustomMainText(
                                                    text: 'D E L E T E',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
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
                          )),
                    ],
                  ),
                  Positioned(
                      bottom: 10,
                      left: 16,
                      right: 16,
                      child: Container(
                        height: 210,
                        width: sw,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xff004422),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMainText(
                                  text: 'Sub-Total',
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomMainText(
                                    text: 'Rs ' +
                                        cartController.totalAmount.toString(),
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMainText(
                                    text: 'Delievery Charges',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                CustomMainText(
                                    text: 'Rs 50',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMainText(
                                    text: 'Discount',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                CustomMainText(
                                    text: 'Rs 0',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMainText(
                                    text: 'Total',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                CustomMainText(
                                    text:
                                        'Rs ${cartController.totalAmount + 50}',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                            Spacer(),
                            AppButtonTheme(
                                onPressed: () {
                                  showCheckOutSheet();
                                },
                                child: CustomMainText(
                                  text: 'Place my Order',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                iscolor: false)
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }

  void showCheckOutSheet() {
    final UserController userController = Get.find<UserController>();
    final PaymentController paymentController = Get.find<PaymentController>();
    final _nameCtrl = TextEditingController(text: userController.name.value);
    final _emailCtrl = TextEditingController(text: userController.email.value);
    final _phoneCtrl = TextEditingController();

    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          TextField(
            controller: _nameCtrl,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _emailCtrl,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _phoneCtrl,
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_nameCtrl.text.isEmpty ||
                  _emailCtrl.text.isEmpty ||
                  _phoneCtrl.text.isEmpty) {
                showUltimateSnackBar(
                    'Error', 'All fields are required', SnackBarType.error);
                return;
              }
              Get.back();
              // Pass these into your Stripe payment method:
              paymentController.makePayment(
                name: _nameCtrl.text.trim(),
                email: _emailCtrl.text.trim(),
                phone: _phoneCtrl.text.trim(),
              );
            },
            child: Text('Continue to Payment'),
          ),
          SizedBox(height: 16),
        ],
      ),
    ));
  }
}
