import '../../../Export/AllExport.dart';

class ResturantDetails extends StatelessWidget {
  final ResturantModel resturantdata;
  const ResturantDetails({super.key, required this.resturantdata});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    height: 250,
                    width: sw,
                    child: Image.asset(
                      resturantdata.resturantimage,
                      fit: BoxFit.cover,
                    )),
                Container(
                  height: 565,
                  width: sw,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMainText(
                        text: resturantdata.resturantname,
                        color:const Color(0xFF000000),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color:const Color(0xff004422),
                          ),
                          CustomMainText(
                            text: '  2.5 km from location',
                            color:const Color(0xFF9E9E9E),
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          Spacer(),
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color:const Color(0xFFFC8907),
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomMainText(
                        text: 'Description',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomMainText(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi' +
                                resturantdata.details,
                        color:const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomMainText(
                        text: 'Facilities',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          CustomMainText(
                            text: 'Snack Bar',
                            color:const Color(0xFF000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 80,),
                          CustomMainText(
                            text: 'Bikes and Car Parking',
                            color:const Color(0xFF000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          CustomMainText(
                            text: 'Toilet',
                            color:const Color(0xFF000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 110,),
                          CustomMainText(
                            text: '24/7 Water facility',
                            color:const Color(0xFF000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      CustomMainText(text: 'Best offers',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
                FoodsHoriList(),
                const SizedBox(height: 80,)
              ],
            ),
          ),
          Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: FadeAnimation(
                delay: 1,
                child: AppButtonTheme(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ReserveTable);
                    },
                    child: CustomMainText(
                      text: 'View Available Tables',
                      color:const Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    iscolor: true),
              ))
        ],
      ),
    );
  }
}
