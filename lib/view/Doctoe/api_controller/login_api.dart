import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/fcm_dart.dart';
import '../verify_otp/Verify_otp_doc.dart';

class Login_doctor_api extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  login_api(mobile) async {
    var shared_preferences = await SharedPreferences.getInstance();
    Map body = {
      'mobile': mobile,
      "fcm_id": fCMToken,
    };
    loader();
    try {
      var res =
          await http.post(Uri.parse("${base_url}doctor_login"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        var user_id = shared_preferences.setString(
            "user_id", resData["data"]["id"].toString());
        var user_otp = shared_preferences.setString(
            "otp_doc", resData["data"]["otp"].toString());
        Get.off(Verify_otp_doc(otp_dis: resData["data"]["otp"].toString()));
        isloading.value = false;
      } else {
        Utils().alertbox('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
