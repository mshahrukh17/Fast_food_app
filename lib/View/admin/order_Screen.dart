import '../../Export/AllExport.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminOrderController orderController =
        Get.find<AdminOrderController>();
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
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
            automaticallyImplyLeading: true,
            foregroundColor: const Color(0xFFFFFFFF),
            backgroundColor: const Color(0xff009944),
            centerTitle: true,
            title: CustomMainText(
              text: 'Orders',
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          body: TabBarView(children: [
            OrderListView(
              orders: orderController.pendingOrders,
              controller: orderController,
              isPending: true,
            ),
            OrderListView(
              orders: orderController.acceptedOrders,
              controller: orderController,
              isAccepted: true,
            ),
            OrderListView(
              orders: orderController.rejectedOrders,
              controller: orderController,
            ),
            OrderListView(
              orders: orderController.completedOrders,
              controller: orderController,
            )
          ]),
        ));
  }
}
