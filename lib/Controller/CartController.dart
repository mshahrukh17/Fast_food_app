import 'package:fastfood_app/model/model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Foodmodel> cartItems = <Foodmodel>[].obs;

  bool isInCart(Foodmodel food) {
    return cartItems.any((item) => item.foodname == food.foodname);
  }

  addToCart(Foodmodel food) {
    if (isInCart(food)) {
      // If item already in cart, increase quantity
      int index = cartItems.indexWhere((item) => item.foodname == food.foodname);
      cartItems[index].quantity += 1;
      cartItems.refresh(); // Notify UI about the change
    } else {
      // Add item with default quantity 1
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
      cartItems.refresh(); // Notify UI about the change
    }
  }

  decreaseQuantity(Foodmodel food) {
    int index = cartItems.indexWhere((item) => item.foodname == food.foodname);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
      cartItems.refresh(); // Notify UI about the change
    }
  }

  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
