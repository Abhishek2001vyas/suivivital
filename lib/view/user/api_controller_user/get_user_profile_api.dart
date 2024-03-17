import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/Profile_user.dart';

List<ProfileUser> user_deatils = [];

class Get_profile_api_user_controller extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    user_profile();
    super.onInit();
  }

  Future<List<ProfileUser>?> user_profile() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');

    try {
      var res =
          await http.post(Uri.parse("${base_url}user_get_profile"), body: {
        "user_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print(resData.toString());
        var profile_data1 = ProfileUser.fromJson(resData);
        user_deatils.clear();
        user_deatils.add(profile_data1);
        //var last_len1=shared_preferences.setString("user_deatils_length","${user_deatils.length - 1.toInt()}");
        print(user_deatils.toString());
        var last_len = user_deatils.length - 1;
        return user_deatils;
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        return user_deatils;
      }
    } catch (e) {}
  }
}
