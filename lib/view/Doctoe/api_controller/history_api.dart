import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';


class Histroy_api extends GetxController {
  List wallet_balance = [].obs;
  RxBool isloading1 = false.obs;

  void loader() {
    isloading1.value = true;
    update();
  }

  void loader_fa() {
    isloading1.value = false;
    update();
  }

  history_wallet_balanace() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http.post(
        Uri.parse("${base_url}doctor_wallet_balance"),
        body: {
          "doctor_id":isLogedIn.toString(),
        }

      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        wallet_balance.clear();
        wallet_balance.add( resData["data"]);
        loader_fa();
      } else {
        loader_fa();
      }
    } catch (e) {}
  }




}