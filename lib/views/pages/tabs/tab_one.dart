import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/product_controller.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/utils/api.dart';
import 'package:my_first_flutter_project/views/components/product_component.dart';

class TabOne extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecom"),
      ),
      body: Obx(() => Wrap(
            children: productController.products.value
                .map((Product product) => ProductComponent(
                    image: "$baseUrl/${product.image}",
                    name: product.description,
                    price: product.price,
                    description: product.description))
                .toList(),
          )),
    );
  }
}
