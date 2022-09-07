import 'package:get/get.dart';
import 'package:my_first_flutter_project/model/product.dart';
import 'package:my_first_flutter_project/utils/constants.dart';

class CartController extends GetxController {
  var cart = {}.obs;
  var quantity = 0.obs;

  add(Product product) {
    product.quantity = quantity.value;
    cart[product.id] = product;
    Get.back();
    showMessage(message: "${product.description} added to cart");
  }

  remove(Product product) {
    cart.remove(product.id);
  }
}
