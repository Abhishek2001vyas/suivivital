import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../common/modle/Profile_user.dart';

List todaynotlist = [];
List tornotlist = [];

class Getnotification extends GetxController {
  RxBool isloading = false.obs;
  var resData;
  var resData1;
  void loader() {
    isloading.value = true;
    update();
  }

  todaynot() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res =
      await http.post(Uri.parse("${base_url}today_notifaction"), body: {
        "user_id": isLogedIn.toString(),
      });
       resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //print(resData.toString());
        todaynotlist.clear();
        todaynotlist.add(resData["data"]);
        print("7777${todaynotlist.elementAt(0)[1]}");
      } else {
      }
    } catch (e) {}
  }
  torrnot() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res =
      await http.post(Uri.parse("${base_url}yesterday_notifaction"), body: {
        "user_id": isLogedIn.toString(),
      });
       resData1 = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData1["result"].toString() == "true".toString()) {
        print(resData1.toString());
        tornotlist.clear();
        tornotlist.add(resData1["data"]);
        print(tornotlist.toString());
      } else {
      }
    } catch (e) {}
  }
}
