import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductComponent extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  const ProductComponent(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width / 2,
      width: Get.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(child: Image.network(image)),
                Text(name),
                Text(price),
                Text(description)
              ],
            )),
      ),
    );
  }
}
