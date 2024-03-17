import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/form/thearpy/therapy.dart';

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

class Signup_form_1_api extends GetxController {
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

  signup_user_form1(
      referral_code, diabetes_types, weight, height, activity_factor) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body = {
      "user_id": user_id_signup.toString(),
      "referral_code": referral_code,
      "diabetes_types": diabetes_types,
      "weight": weight,
      "height": height,
      "activity_factor": activity_factor,
    };

    try {
      var res = await http.post(Uri.parse("${base_url}users_signup_second"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData);
        var user_signup_status = shared_preferences.setString(
            "user_signup_status", resData["data"]["user_status"].toString());

        //print(resData["data"]["id"].toString());
        //var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        //var user_otp = shared_preferences.setString("otp_doc",resData["data"]["otp"].toString());
        Get.to(Form3());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
