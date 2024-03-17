import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../account create/account_create.dart';

class Signup_form_5_api extends GetxController {
  RxBool isloading = false.obs;
  var view = 0.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  void view_change(int value) {
    view.value = value;
  }

  signup_user_form5(
    hypogly_cemia,
    glucose_traget,
    glucose_hi,
    glucose,
    hypoglycemia,
    ratio,
    ratio_2,
    time,
    time_2,
  ) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body = {
      "user_id": user_id_signup.toString(),
      "hyperglycemia": hypogly_cemia.toString(),
      "glucose_targets": glucose_traget.toString(),
      "glucose_high": glucose_hi.toString(),
      "glucose_low": glucose.toString(),
      "hypoglycemia": hypoglycemia.toString(),
      "ratio": ratio.toString(),
      "ratio_2": ratio_2.toString(),
      "time": DateTime.now().toString(),
      "time_2": DateTime.now().toString(),
    };

    try {
      // print("asfsadf");
      var res = await http.post(Uri.parse("${base_url}users_signup_fifth"),
          body: body);
      print("66666666666666666666");
      var resData = json.decode(res.body);
      print("++++++++++++++++++++++++++++++++++++++++");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(
            "++++++++++++++++++++++++==============================++++++++++++++++");
        print(resData);
        print(resData["data"]);
        var user_signup_status =
            shared_preferences.setString("user_signup_status", "0".toString());

        //var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        //var user_otp = shared_preferences.setString("otp_doc",resData["data"]["otp"].toString());
        Get.to(AccountCre());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
