import 'package:fastfood_app/Controller/favoriteController/FavoriteController.dart';
import '../../../Export/AllExport.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Image.asset('assets/logo2.png', height: 35),
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Obx(
        () => controller.favoriteItems.isEmpty
            ? Center(
                child: CustomMainText(
                text: 'No Items In Favorite List',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ))
            : GridView.builder(
                itemCount: controller.favoriteItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  Foodmodel fav = controller.favoriteItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () =>
                          Get.toNamed(AppRoutes.FoodDetails, arguments: fav),
                      child: Container(
                        height: 150,
                        width: 160,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9E9E9E).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: fav.foodimage,
                              child: Image.asset(
                                fav.foodimage,
                                height: 120,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xff009944)),
                              child: Center(
                                child: CustomMainText(
                                  text: fav.foodname,
                                  fontSize: 18,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
