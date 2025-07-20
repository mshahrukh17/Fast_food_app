import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Export/AllExport.dart';
import 'package:firebase_database/firebase_database.dart';

class PaymentController extends GetxController {
  final CartController cartController = Get.find<CartController>();

  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String name,
      required String email,
      required String phone}) async {
    try {
      int amount = cartController.totalAmount * 100;
      paymentIntentData = await createPaymentIntent(amount.toString(), 'PKR');

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        style: ThemeMode.light,
        merchantDisplayName: 'FastFood App',
        customerId: email,
      ));
      await displayPaymentSheet();
    } catch (e) {
      showUltimateSnackBar('Error', e.toString(), SnackBarType.error);
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      const String secretKey = 'sk_test_BQokikJOvBiI2HlWgH4olfQ2';

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': amount,
          'currency': currency,
          'payment_method_types[]': 'card'
        },
      );

      return jsonDecode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      orderOnProcessing();
      paymentIntentData = null;
      Get.offNamed(AppRoutes.OrderDone);
    } catch (e) {
      showUltimateSnackBar(
          "Error", "Payment cancelled or failed", SnackBarType.error);
    }
  }

  orderOnProcessing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email") ?? "No email";
    var name = prefs.getString("name") ?? "Guest";
    var userID = prefs.getString("userID") ?? "No uid";
    var orderKey = FirebaseDatabase.instance.ref('orders').push().key;

    // // 🔥 Convert cart items to map for Firestore
    List<Map<String, dynamic>> orderList =
        cartController.cartItems.map((item) => item.toMap()).toList();
    var totalAmount = cartController.totalAmount.toString();

    final userOrder = UserOrder(
      name: name.trim(),
      email: email.trim(),
      userID: userID,
      orderKey: orderKey,
      order: orderList,
      totalPrice: totalAmount,
      orderStatus: 'pending',
      timeStamp: DateTime.now(),
    );

    CollectionReference orderRef =
        FirebaseFirestore.instance.collection('orders');
    await orderRef.doc(orderKey).set(userOrder.toMap());

    showUltimateSnackBar(
        'Success', 'Order has been successfully', SnackBarType.success);
    cartController.cartItems.clear();
    update();
  }
}
