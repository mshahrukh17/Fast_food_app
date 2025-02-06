import '../../Export/AllExport.dart';

class FavoriteController extends GetxController {
  RxList<Foodmodel> favoriteItems = <Foodmodel>[].obs;

  isInFav(Foodmodel food) {
    return favoriteItems.any((element) => element.foodname == food.foodname);
  }

  addtoFav(Foodmodel food) {
    favoriteItems.add(food);
  }

  removeFromFav(Foodmodel food) {
    favoriteItems.removeWhere((element) => element.foodname == food.foodname);
  }
}
