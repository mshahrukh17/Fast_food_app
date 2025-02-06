import '../../../Export/AllExport.dart';

class FoodsHoriList extends StatelessWidget {
  const FoodsHoriList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Container(
      height: sh * 0.32,
      width: sw,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.FoodDetails, arguments: food),
              child: Container(
                height: sh,
                width: sw * 0.36,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 8,
                        right: 15,
                        left: 15,
                        child: Container(
                          height: sh * 0.18,
                          width: sw * 0.22,
                          decoration: BoxDecoration(
                              color:const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:const Color(0xFF9E9E9E).withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                    child: CustomMainText(
                                  text: food.foodname,
                                  color:const Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                                SizedBox(height: 8),
                                FittedBox(
                                    child: CustomMainText(
                                  text: food.details,
                                  fontWeight: FontWeight.w400,
                                  color:const Color(0xFF757575),
                                )),
                                SizedBox(height: 8),
                                FittedBox(
                                    child: CustomMainText(
                                  text: 'Rs ' + food.price.toString(),
                                  color:const Color(0xff009944),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      top: 8,
                      left: 5,
                      right: 5,
                      child: Container(
                        height: sh * 0.17,
                        width: sw,
                        decoration: BoxDecoration(
                          color:const Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:const Color(0xFF9E9E9E).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: FadeAnimation(
                          delay: 1,
                          child: Hero(
                            tag: food.foodimage,
                            child: Center(
                              child: Image.asset(
                                food.foodimage,
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}