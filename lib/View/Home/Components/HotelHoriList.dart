import '../../../Export/AllExport.dart';

class HotelHoriList extends StatelessWidget {
  const HotelHoriList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 190,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: resturant.length,
        itemBuilder: (context, index) {
          ResturantModel restu = resturant[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.ResturantDetails, arguments: restu),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(1, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: sh * 0.14,
                        width: sw * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(restu.resturantimage),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomMainText(
                              text: restu.resturantname,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFF9900),
                                ),
                                CustomMainText(
                                  text: ' 4.5',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
