import '../../../Export/AllExport.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified,
                  color: Color(0xFF009944),
                  size: 60,
                  shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0, 3))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomMainText(
                  text: 'Thank You!\nOrder Completed',
                  color: const Color(0xff004422),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        5,
                        (index) => Icon(
                              Icons.star,
                              color: Color(0xffFEAD1D),
                              size: 30,
                            ))
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: AppButtonTheme(
                  onPressed: () {
                    Get.toNamed(AppRoutes.BottomNavBar);
                  },
                  child: CustomMainText(
                    text: 'Go Home',
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  iscolor: true))
        ],
      ),
    );
  }
}
