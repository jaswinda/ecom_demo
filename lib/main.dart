import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/controller/category_controller.dart';
import 'package:my_first_flutter_project/views/pages/loader.dart';
import 'controller/authentication_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());
  Get.put(CategroyController());
  Get.put(CartController());
  runApp(const MaterialApp(
      home: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My First Flutter Project",
          home: Loader())));
}
