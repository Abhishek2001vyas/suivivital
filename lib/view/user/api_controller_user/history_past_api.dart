import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:suivivital/view/user/review/review.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../Doctoe/verify_otp/Verify_otp_doc.dart';
import '../doctor_deatil.dart';
import '../history/history.dart';

List past = [];
List upcoming = [];

class past_user extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  user_past_history() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}booking_history_past"),
          body: body);

      var resData = json.decode(res.body);
      print(resData);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        past.clear();
        past.add(resData["data"]);

        //Get.to(History());

        //Utils().sendMassage('${resData['msg'].toString()}');

        isloading.value = false;
      } else {
        past.clear();
      //  Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  doctor_upcoming_history() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}booking_history_upcomeing"),
          body: body);

      var resData = json.decode(res.body);
      upcoming.clear();
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        upcoming.clear();
        upcoming.add(resData["data"]);
        //Get.to(History());
        //Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      } else {
      //  Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
