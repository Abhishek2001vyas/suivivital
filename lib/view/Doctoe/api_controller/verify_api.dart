import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../navgation_bar.dart';

class Verify_doctor_api extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  verify(body) async {
    var shared_preferences = await SharedPreferences.getInstance();
    try {
      var res = await http.post(Uri.parse("${base_url}doctor_verify_otp"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData["data"].toString());
        //print(resData["data"]["id"].toString());
       // var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        Get.off(Nav_bar());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
