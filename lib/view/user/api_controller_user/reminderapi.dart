import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/fcm_dart.dart';
import '../verify_otp_user/verify_otp.dart';

class Reminderapi extends GetxController {
  RxBool isloading = false.obs;
  RxBool isloading1 = false.obs;
  RxList getreminder =[].obs;

  void loader() {
    isloading.value = true;
    update();
  }
  void loader1() {
    isloading1.value = true;
    update();
  }

  reminder_api(title,date,time,desription) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
      "title": title.toString(),
      "date":date.toString(),
      "time":time.toString(),
      "desription":desription.toString()
    };

    try {
      var res = await http.post(Uri.parse("${base_url}add_remainder"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
  reminderget_api() async {
    loader1();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}get_remainder"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        getreminder.clear();
        getreminder.add( resData["data"]);
      //  Utils().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      } else {
        //().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {}
  }

}
