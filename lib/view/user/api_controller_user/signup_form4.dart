import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/form/glucose/glucoselevel.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../form/thearpy/therapy_controller.dart';

class Signup_form_4_api extends GetxController {
  final therapy_contoller = Get.put(Therapy_controller());
  RxBool isloading = false.obs;
  var view = 0.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  void view_change(int value) {
    view.value = value;
  }

  signup_user_form4(rapid_short_acting_insulin, dose_2, qty_2, medi_name, dose,
      qty, medi_name_2, intermediate_long) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body = {
      "user_id": user_id_signup.toString(),
      "rapid_short_acting_insulin": rapid_short_acting_insulin.toString(),
      "medi_name": medi_name.toString(),
      "dose": dose.toString(),
      "qty": qty.toString(),
      "medi_name_2": medi_name_2.toString(),
      "dose_2": dose_2.toString(),
      "qty_2": qty_2.toString(),
      "intermediate_long": intermediate_long.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}users_signup_forth"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData);
        print(resData["data"]);
        var user_signup_status = shared_preferences.setString(
            "user_signup_status", resData["data"]["user_status"].toString());

        //var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        //var user_otp = shared_preferences.setString("otp_doc",resData["data"]["otp"].toString());
        Get.to(Form5());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
