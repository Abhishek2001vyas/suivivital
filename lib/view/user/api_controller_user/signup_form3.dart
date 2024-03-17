import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/form/thearpy/therapy.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../form/thearpy/therapy_controller.dart';

class Signup_form_3_api extends GetxController {
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

  signup_user_form3_0(multiple_daily_injections, insulin_pen_dose_increments,
      insulin_pump, insulin_name, non_insulin) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body = {
      "user_id": user_id_signup.toString(),
      "non_insulin": non_insulin.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}users_signup_third"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}26');
        update();
        print(resData);
        var user_signup_status = shared_preferences.setString(
            "user_signup_status", resData["data"]["user_status"].toString());

        //print(resData["data"]["id"].toString());
        //var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        //var user_otp = shared_preferences.setString("otp_doc",resData["data"]["otp"].toString());
        Get.to(Form3());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}e26');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }

  signup_user_form3_1(multiple_daily_injections, insulin_pen_dose_increments,
      insulin_pump, insulin_name, non_insulin) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body =
        // {
        //   "user_id":user_id_signup.toString(),
        //   // "multiple_daily_injections":multiple_daily_injections.toString(),
        //   // "insulin_pen_dose_increments":insulin_pen_dose_increments.toString(),
        //   // "insulin_pump":insulin_pump.toString(),
        //   // "insulin_name":insulin_name.toString(),
        //   "non_insulin":non_insulin.toString(),
        // }
        // :
        // therapy_contoller.noninsulin == 1?
        {
      "user_id": user_id_signup.toString(),
      "multiple_daily_injections": multiple_daily_injections.toString(),
      "insulin_pen_dose_increments": insulin_pen_dose_increments.toString(),
      // "insulin_pump":insulin_pump.toString(),
      // "insulin_name":insulin_name.toString(),
      // "non_insulin":non_insulin.toString(),
    }
        // {
        //   "user_id":user_id_signup.toString(),
        //   // "multiple_daily_injections":multiple_daily_injections.toString(),
        //   // "insulin_pen_dose_increments":insulin_pen_dose_increments.toString(),
        //   "insulin_pump":insulin_pump.toString(),
        //   "insulin_name":insulin_name.toString(),
        //   // "non_insulin":non_insulin.toString(),
        // }
        ;

    try {
      var res = await http.post(Uri.parse("${base_url}users_signup_third"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}27');
        update();
        print("sdgfds=====================================");
        print(resData);
        var user_signup_status = shared_preferences.setString(
            "user_signup_status", resData["data"]["user_status"].toString());

        //print(resData["data"]["id"].toString());
        //var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        //var user_otp = shared_preferences.setString("otp_doc",resData["data"]["otp"].toString());
        Get.to(Form3());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}e27');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }

  signup_user_form3_2(multiple_daily_injections, insulin_pen_dose_increments,
      insulin_pump, insulin_name, non_insulin) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get("user_signup_id");
    Map body =
        // {
        //   "user_id":user_id_signup.toString(),
        //   // "multiple_daily_injections":multiple_daily_injections.toString(),
        //   // "insulin_pen_dose_increments":insulin_pen_dose_increments.toString(),
        //   // "insulin_pump":insulin_pump.toString(),
        //   // "insulin_name":insulin_name.toString(),
        //   "non_insulin":non_insulin.toString(),
        // }
        // :
        // therapy_contoller.noninsulin == 1?
        // {
        //   "user_id":user_id_signup.toString(),
        //   "multiple_daily_injections":multiple_daily_injections.toString(),
        //   "insulin_pen_dose_increments":insulin_pen_dose_increments.toString(),
        //   // "insulin_pump":insulin_pump.toString(),
        //   // "insulin_name":insulin_name.toString(),
        //   // "non_insulin":non_insulin.toString(),
        // }
        // :
        {
      "user_id": user_id_signup.toString(),
      "insulin_pump": insulin_pump.toString(),
      "insulin_name": insulin_name.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}users_signup_third"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(resData);
        var user_signup_status = shared_preferences.setString(
            "user_signup_status", resData["data"]["user_status"].toString());
        Get.to(Form3());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }
}
