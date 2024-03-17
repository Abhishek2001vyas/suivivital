import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../home/home1.dart';
import '../verify_otp_user/verify_otp_controller.dart';

class Verify_api_user_controller extends GetxController {
  final verify_otp_user = Get.put(Verify_otp_user());

  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  verify(body) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    try {
      var res =
          await http.post(Uri.parse("${base_url}user_verify_otp"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData["data"].toString());
        //print(resData["data"]["id"].toString());
        // var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        Get.off(Home1());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }

  resend_otp() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
    };
    try {
      var res =
          await http.post(Uri.parse("${base_url}user_resend_otp"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData["data"].toString());
        var otp_set = shared_preferences.setString(
            'otp', resData["data"]["otp"].toString());
        verify_otp_user.resentagain();
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
