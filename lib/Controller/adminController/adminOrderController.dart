import '../../Export/AllExport.dart';

class AdminOrderController extends GetxController {
  var pendingOrders = <UserOrder>[].obs;
  var acceptedOrders = <UserOrder>[].obs;
  var rejectedOrders = <UserOrder>[].obs;
  var completedOrders = <UserOrder>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchOrders(); // 👈 Required to load orders
  }

  void fetchOrders() {
    FirebaseFirestore.instance
        .collection("orders")
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final allOrders =
          snapshot.docs.map((doc) => UserOrder.fromMap(doc.data())).toList();
      pendingOrders.value =
          allOrders.where((e) => e.orderStatus == "pending").toList();
      acceptedOrders.value =
          allOrders.where((e) => e.orderStatus == "accepted").toList();
      rejectedOrders.value =
          allOrders.where((e) => e.orderStatus == "rejected").toList();
      completedOrders.value =
          allOrders.where((e) => e.orderStatus == "completed").toList();
    });
  }

  Future<void> updateOrderStatus(String orderKey, String status) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderKey)
        .update({"orderStatus": status});
  }
}
