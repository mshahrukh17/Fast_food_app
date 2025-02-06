import '../../../Export/AllExport.dart';

class TableBook extends StatelessWidget {
  const TableBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/success.png',
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomMainText(
                  text: 'Your Table was\nReserved Successfully!',
                  color: Color(0xff009944),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomMainText(
                  text:
                      'Please respect our policies and do come to\nyour reserved Table within the specified* time!',
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: AppButtonTheme(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.BottomNavBar);
                  },
                  child: CustomMainText(
                    text: 'Go Home',
                    fontSize: 18,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  iscolor: true))
        ],
      ),
    );
  }
}
