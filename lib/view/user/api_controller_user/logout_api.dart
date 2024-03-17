import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/option_choose.dart';

class Logout_user_api extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  logout() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}user_logout"), body: {
        'user_id': isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("asfd");
        Utils().sendMassage('${resData['msg'].toString()}');
        print(resData["data"].toString());
        var isLogedIn1 = shared_preferences.remove('user1_id');
        Get.off(() => Choose_option());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
