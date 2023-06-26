import 'package:fruit/models/fruit_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <Fruit>[].obs;
  final totalAmount = 0.0.obs;

  void addToCart(Fruit fruit) {
    cartItems.add(fruit);
    _updateTotalAmount();
  }

  void removeFromCart(Fruit fruit) {
    cartItems.remove(fruit);
    _updateTotalAmount();
  }

  void clearCart() {
    cartItems.clear();
    _updateTotalAmount();
  }

  void _updateTotalAmount() {
    double total = 0.0;
    for (var fruit in cartItems) {
      total += fruit.price;
    }
    totalAmount.value = total;
  }
}