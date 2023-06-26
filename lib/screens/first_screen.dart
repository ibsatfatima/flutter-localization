
import 'package:flutter/material.dart';
import 'package:fruit/screens/second_screen.dart';
import 'package:get/get.dart';

import 'bottomsheet.dart';
import '../controllers/cart_controller.dart';
import '../models/fruit_model.dart';

class Screen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final List<Fruit> fruits = [
    Fruit(name: 'a1'.tr, price: 10, image: 'lib/images/apple.jpg'),
    Fruit(name: 'a2'.tr, price: 0.99, image: 'lib/images/banana.jpg'),
    Fruit(name: 'a3'.tr, price: 2.49, image: 'lib/images/orange 1.jpg'),
    Fruit(name: 'a4'.tr, price: 3.99, image: 'lib/images/grapes.jpg'),
    Fruit(name: 'a5'.tr, price: 5.99, image: 'lib/images/pinneaple.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(CartScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'searchHint'.tr,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: fruits.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      cartController.addToCart(fruits[index]);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            fruits[index].image,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            fruits[index].name,
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '\$${fruits[index].price}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                OutlinedButton(onPressed: (){
                  ForgetPasswordBottomSheet.buildBottomSheet(context);

                  // context.setLocale(Locale('ur', 'PK'));

                }, child: const Text('Select Language')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
