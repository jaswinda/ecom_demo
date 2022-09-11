import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_project/controller/cart_controller.dart';
import 'package:my_first_flutter_project/utils/api.dart';
import 'package:my_first_flutter_project/utils/shared_preds.dart';
import '../utils/constants.dart';
import '../views/payment/khalti.dart';

class OrderController extends GetxController {
  final authService = AuthService();
  final CartController cartController = Get.find<CartController>();
  var orderId = "".obs;

  place(data) async {
    var token_ = await authService.getToken();
    data["token"] = token_;
    var url = Uri.parse(PLACE_ORDER_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        orderId.value = jsonResponse["order_id"].toString();

        cartController.clearCart();
        Get.to(() => const KhaltiExampleApp());
      } else {
        print(jsonResponse);
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
