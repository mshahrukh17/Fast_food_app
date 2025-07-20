import '../../Export/AllExport.dart';

class UserOrderController extends GetxController {
  var pendingOrders = <UserOrder>[].obs;
  var acceptedOrders = <UserOrder>[].obs;
  var rejectedOrders = <UserOrder>[].obs;
  var completedOrders = <UserOrder>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  void fetchUserOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString('userID') ?? '';

    FirebaseFirestore.instance
        .collection("orders")
        .where('userID', isEqualTo: userID)
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
}
