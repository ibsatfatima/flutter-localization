import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/fruit_model.dart';


class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  Fruit fruit = cartController.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      // shape: RoundedRectangleBorder( //<-- SEE HERE
                      //   side: BorderSide(width: 2),
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      title: Text(fruit.name),
                      subtitle: Text('\$${fruit.price}'),
                      leading: Image.asset(fruit.image, height: 60,),
                      trailing: Icon(Icons.more_vert),
                      onTap: () => cartController.removeFromCart(fruit),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: \$${cartController.totalAmount}'),
                ElevatedButton(
                  onPressed: cartController.clearCart,
                  child: Text('button'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}