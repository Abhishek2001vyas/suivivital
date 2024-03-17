import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/fcm_dart.dart';
import '../verify_otp_user/verify_otp.dart';

class Login_api_user_controller extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  login_user_api(mobile) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    Map body = {
      'mobile': mobile,
      "fcm_id": fCMToken,
    };

    try {
      var res = await http.post(Uri.parse("${base_url}user_login"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage(resData['msg'].toString());
        // update();
         shared_preferences.setString(
            "user1_id", resData["data"]["id"].toString());
         shared_preferences.setString(
            "otp", resData["data"]["otp"].toString());
        Get.off(Verify_otp(otp_dis: resData["data"]["otp"].toString()));
        isloading.value = false;
      } else {
        Utils().sendMassage(resData['msg'].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
