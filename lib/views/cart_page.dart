import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/utils/api.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: cartController.cart.values
            .map((product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network("$baseUrl/${product.image}", height: 100),
                    Text(product.description),
                    Text(product.quantity.toString()),
                  ],
                ))
            .toList(),
      ),
    );
  }

  cartDetail(product) {
    return Container(
      child: const Text("product"),
    );
  }
}
