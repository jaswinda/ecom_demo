import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/utils/api.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';

class ProductPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final Product product;
  ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network("$baseUrl/${product.image}", height: 200),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(product.description.toUpperCase(),
                      style: const TextStyle(fontSize: 26))),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Rs ${product.price}",
                    style: const TextStyle(fontSize: 26, color: Colors.red)),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(product.description)),
              MyButton(
                  onTap: () {
                    onAddToCart();
                  },
                  text: "Add To Cart")
            ],
          ),
        ));
  }

  onAddToCart() {
    Get.bottomSheet(Container(
      color: Colors.white,
      height: 500,
      child: Column(
        children: [
          const Center(child: Text("Add To Cart")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (cartController.quantity.value > 1) {
                      cartController.quantity.value--;
                    }
                  },
                  child: const Text("-")),
              Center(
                  child: Obx(
                      () => Text(cartController.quantity.value.toString()))),
              ElevatedButton(
                  onPressed: () {
                    cartController.quantity.value++;
                  },
                  child: const Text("+")),
            ],
          ),
          MyButton(
              onTap: () {
                cartController.add(product);
              },
              text: "Add To Cart")
        ],
      ),
    ));
  }
}
