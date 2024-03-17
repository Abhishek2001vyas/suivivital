import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import 'dart:convert';
import '../../../utils/constant.dart';


class Completerating extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  completerating_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var userIn = shared_preferences.getString('imcominguserid');
    var doctorIn = shared_preferences.getString('imcomingdoctorid');
    Map body = {
      'doctor_id': doctorIn.toString(),
      "user_id":userIn.toString(),
      "date":DateTime.now(),
      "call_time":"4.2".toString(),
      "rating":"4.2".toString(),
      "comment":""

    };
    try {
      var res =
      await http.post(Uri.parse("${base_url}call_disconnected"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Get.to(()=> Nav_bar());
        isloading.value = false;
      } else {
        isloading.value = false;
      }
    } catch (e) {}
  }



}


