import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/controller/product_controller.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/views/cart_page.dart';
import 'package:my_first_flutter_project/views/components/product_component.dart';

class TabOne extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.find<CartController>();
  TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecom"),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 60),
            child: InkWell(
              onTap: () => Get.to(() => CartPage()),
              child: Badge(
                badgeContent:
                    Obx(() => Text(cartController.cart.length.toString())),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: Obx(() => Wrap(
            children: productController.products.value
                .map((Product product) => ProductComponent(product: product))
                .toList(),
          )),
    );
  }
}
