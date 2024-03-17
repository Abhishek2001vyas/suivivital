import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../common/modle/Profile_user.dart';

List todaynotdocolist = [];
List tornotdocolist = [];

class Getdocotornotification extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  todaynot() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    print(isLogedIn);
    try {
      var res =
      await http.post(Uri.parse("${base_url}today_notifaction_doctor"), body: {
        "doctor_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("jfgj");
        todaynotdocolist.clear();
        todaynotdocolist.add(resData["data"]);
        print("7777${todaynotdocolist.elementAt(0)}");
        isloading.value = false;
      } else {
      }
    } catch (e) {}
  }
  torrnot() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res =
      await http.post(Uri.parse("${base_url}yesterday_notifaction_doctor"), body: {
        "doctor_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print(resData.toString());
        tornotdocolist.clear();
        tornotdocolist.add(resData["data"]);
        print(tornotdocolist.toString());
        isloading.value = false;
      } else {
      }
    } catch (e) {}
  }
}
