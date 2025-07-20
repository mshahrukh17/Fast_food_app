import '../../../../Export/AllExport.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
            child: Row(
              children: [
                CustomMainText(
                  text: 'Best Offers',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset('assets/fire.png'),
              ],
            ),
          ),
          FoodsHoriList(isFromMain: false,),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, bottom: 20),
            child: Row(
              children: [
                CustomMainText(
                  text: 'Best Offers',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset('assets/fire.png'),
              ],
            ),
          ),
          HotelHoriList()
        ],
      ),
    );
  }
}
