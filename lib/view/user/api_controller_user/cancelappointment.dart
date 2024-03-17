import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/history/history.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/waiting_pat.dart';

class Reject_user_api extends GetxController {

  RxBool isloading1 = false.obs;

  void loader() {
    isloading1.value = true;
    update();
  }

  void loader_fa() {
    isloading1.value = false;
    update();
  }

  rejectuser(appointment_id,doctor_id,) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    print(doctor_id);
    print(appointment_id);

    try {
      var res = await http
          .post(Uri.parse("${base_url}booking_canceled"), body: {
        "doctor_id": doctor_id.toString(),
        "appointment_id":appointment_id.toString(),
        "user_id":isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        Get.to(()=>const History());
        loader_fa() ;

      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        // return qwer;
        loader_fa() ;
      }
    } catch (e) {}
  }
}