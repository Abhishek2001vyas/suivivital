import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../verify_otp/verify_controller.dart';

class Resend_doctor_api extends GetxController {
  RxBool isloading = false.obs;
  final verify_otp_user = Get.put(verify());

  void loader() {
    isloading.value = true;
    update();
  }

  resend_otp() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    Map body = {
      'user_id': isLogedIn.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}doctor_resend_otp"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        var otp_set = shared_preferences.setString(
            'otp_doc', resData["data"]["otp"].toString());
        verify_otp_user.resentagain();
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }
}
