import '../../Export/AllExport.dart';
import 'package:intl/intl.dart';


class OrderListView extends StatelessWidget {
  final List<UserOrder> orders;
  final AdminOrderController controller;
  final bool isPending;
  final bool isAccepted;

  const OrderListView({
    super.key,
    required this.orders,
    required this.controller,
    this.isPending = false,
    this.isAccepted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (orders.isEmpty) {
        return Center(child: Text('No Orders'));
      }
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic Order Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(order.orderStatus.toUpperCase(), style: TextStyle(color:const Color(0xFF9E9E9E))),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text("Total: Rs. ${order.totalPrice}", style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("Date: ${DateFormat.yMMMd().add_jm().format(order.timeStamp)}"),

                  const Divider(height: 20),

                  // Food Items
                  ...order.order.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['foodimage'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Icon(Icons.image, size: 50),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['foodname'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                Text("Qty: ${item['quantity']}"),
                              ],
                            ),
                          ),
                          Text("Rs. ${item['price']}", style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 12),

                  // Action Buttons
                  if (isPending)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => controller.updateOrderStatus(order.orderKey, 'accepted'),
                          icon: Icon(Icons.check, color:const Color(0xFF43CE48)),
                          label: Text('Accept', style: TextStyle(color:const Color(0xFF43CE48))),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton.icon(
                          onPressed: () => controller.updateOrderStatus(order.orderKey, 'rejected'),
                          icon: Icon(Icons.close, color: const Color(0xFFF44336)),
                          label: Text('Reject', style: TextStyle(color:const Color(0xFFF44336))),
                        ),
                      ],
                    )
                  else if (isAccepted)
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () => controller.updateOrderStatus(order.orderKey, 'completed'),
                        icon: Icon(Icons.done_all),
                        label: Text("Mark as Completed"),
                        style: ElevatedButton.styleFrom(backgroundColor:const Color(0xFFD4D4D4))
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
