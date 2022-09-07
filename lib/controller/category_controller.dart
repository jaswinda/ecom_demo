import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_project/model/category.dart';
import 'package:my_first_flutter_project/utils/api.dart';
import 'package:my_first_flutter_project/utils/constants.dart';
import 'package:my_first_flutter_project/utils/shared_preds.dart';

class CategroyController extends GetxController {
  var loading = false.obs;
  var categories = <Category>[].obs;

  final AuthService authService = AuthService();

  //on init state
  @override
  void onInit() {
    super.onInit();
    get();
  }

  get() async {
    loading.value = true;
    var url = Uri.parse(GET_CATEGORIES_API);
    var response = await http.get(url);
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        categories.value = (jsonResponse["data"] as List)
            .map((e) => Category.fromJson(e))
            .toList();
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
