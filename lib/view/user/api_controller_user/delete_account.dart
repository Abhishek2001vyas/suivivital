import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/option_choose.dart';


class Delete_user extends GetxController {
  void delete_account() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');

    print(isLogedIn.toString());
    try {
      var res =
          await http.post(Uri.parse("${base_url}delete_account_users"), body: {
        "user_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print(resData.toString());

        Utils().sendMassage('${resData['msg'].toString()}');
        Get.to(Choose_option());
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
