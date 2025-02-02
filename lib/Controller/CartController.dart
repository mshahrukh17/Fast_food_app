import '../Export/AllExport.dart';

class CartController extends GetxController {
  RxList<Foodmodel> cartItems = <Foodmodel>[].obs;

  bool isInCart(Foodmodel food) {
    return cartItems.any((item) => item.foodname == food.foodname);
  }

  addToCart(Foodmodel food) {
    if (isInCart(food)) {
      int index = cartItems.indexWhere((item) => item.foodname == food.foodname);
      cartItems[index].quantity += 1;
      cartItems.refresh();
    } else {
      cartItems.add(food);
    }
  }

  removeFromCart(Foodmodel food) {
    cartItems.removeWhere((item) => item.foodname == food.foodname);
  }

  increaseQuantity(Foodmodel food) {
    int index = cartItems.indexWhere((item) => item.foodname == food.foodname);
    if (index != -1) {
      cartItems[index].quantity += 1;
      cartItems.refresh();
    }
  }

  decreaseQuantity(Foodmodel food) {
    int index = cartItems.indexWhere((item) => item.foodname == food.foodname);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
      cartItems.refresh();
    }
  }

  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
