import 'dart:convert';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/utils/constants.dart';

class CartController extends GetxController {
  var cart = {}.obs;
  var quantity = 0.obs;
  var total = 0.0.obs;
  final storage = LocalStorage('cart');

  @override
  void onInit() {
    super.onInit();
    storage.ready.then((value) {
      if (storage.getItem('cart') != null) {
        var cartMap = jsonDecode(storage.getItem('cart'));
        cart.clear();
        cartMap.forEach((key, value) {
          cart[key] = Product.fromJson(value);
        });
      }
    });
  }

  add(Product product) {
    product.quantity = quantity.value;
    cart[product.id] = product;
    Get.back();
    showMessage(message: "${product.description} added to cart");
    storage.setItem("cart", jsonEncode(cart));
    getTotal();
  }

  remove(Product product) {
    cart.remove(product.id);
    storage.setItem("cart", jsonEncode(cart));
    getTotal();
  }

  clearCart() {
    cart.value = {};
    storage.setItem("cart", jsonEncode(cart));
    getTotal();
    update();
  }

  getTotal() {
    var tempTotal = 0.0;
    cart.forEach((key, value) {
      tempTotal += double.parse(value.price.toString()) *
          int.parse(value.quantity.toString());
    });
    total.value = tempTotal;
  }
}
