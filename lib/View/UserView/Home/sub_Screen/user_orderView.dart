import 'package:intl/intl.dart';
import '../../../../Export/AllExport.dart';

class UserOrderScreen extends StatelessWidget {
  final UserOrderController orderController = Get.find<UserOrderController>();
  UserOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: CustomMainText(
              text: 'My Orders',
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: const Color(0xFFFFFFFF),
            backgroundColor: const Color(0xff009944),
            centerTitle: true,
            bottom: const TabBar(
                automaticIndicatorColorAdjustment: true,
                physics: const BouncingScrollPhysics(),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: const Color(0xFFFFFFFF),
                labelStyle: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                    fontSize: 15,
                    color: const Color(0xFFDFDFDF),
                    fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Accepted',
                  ),
                  Tab(
                    text: 'Rejected',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            OrderListView(orders: orderController.pendingOrders),
            OrderListView(orders: orderController.acceptedOrders),
            OrderListView(orders: orderController.rejectedOrders),
            OrderListView(orders: orderController.completedOrders),
          ]),
        ));
  }
}

class OrderListView extends StatelessWidget {
  final List<UserOrder> orders;

  const OrderListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (orders.isEmpty) {
        return Center(child: Text("No Orders"));
      }
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, index) {
          final order = orders[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: CustomMainText(
                text: order.name,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Status: ${order.orderStatus}"),
              children: [
                ...order.order.map((item) {
                  return ListTile(
                    leading:
                        Image.asset(item['foodimage'], width: 40, height: 40),
                    title: Text(item['foodname']),
                    subtitle: Text("Qty: ${item['quantity']}"),
                    trailing: Text("Rs ${item['price']}"),
                  );
                }).toList(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Total: Rs ${order.totalPrice}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Date: ${DateFormat.yMMMd().add_jm().format(order.timeStamp)}",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
