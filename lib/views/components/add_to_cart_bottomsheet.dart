import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.find<CartController>();
  AddToCartBottomSheet({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
