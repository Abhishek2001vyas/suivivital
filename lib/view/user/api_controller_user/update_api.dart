import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/Profile_user.dart';
import '../edit_profile_u.dart';

List<ProfileUser> user_deatils2 = [];

class Update_profile_user extends GetxController {
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
        user_deatils2.clear();
        user_deatils2.add(profile_data1);
        //var last_len1=shared_preferences.setString("user_deatils_length","${user_deatils.length - 1.toInt()}");

        print(user_deatils2.toString());
        var last_len = user_deatils2.length - 1;
        return user_deatils2;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        return user_deatils2;
      }
    } catch (e) {}
  }

  update_profile(
    user_name,
    first_name,
    last_name,
    email,
    mobile,
    address,
    gender,
    dob,
    emial_rec,
    image,
    referral_code,
    diabetes_types,
    weight,
    height,
    activity_factor,
    multiple_daily_injections,
    insulin_pen_dose_increments,
    insulin_pump,
    insulin_name,
    non_insulin,
    rapid_short_acting_insulin,
    dose_2,
    qty_2,
    medi_name,
    dose,
    qty,
    medi_name_2,
    intermediate_long,
    hypogly_cemia,
    glucose_traget,
    glucose_hi,
    glucose,
    hypoglycemia,
    ratio,
    ratio_2,
    time,
    time_2,
  ) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id_signup = shared_preferences.get('user1_id');
    if (image != "")
    {

      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}user_update_profile"));
        request.fields.addAll({
          "user_id": user_id_signup.toString(),
          "user_name": user_name.toString(),
          "first_name": first_name.toString(),
          "last_name": last_name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "address": address.toString(),
          "gender": gender.toString(),
          "dob": dob.toString(),
          "receive_email": emial_rec.toString(),
          "referral_code": referral_code,
          "diabetes_types": diabetes_types,
          "weight": weight,
          "height": height,
          "activity_factor": activity_factor,
          "non_insulin": non_insulin.toString(),
          "multiple_daily_injections": multiple_daily_injections.toString(),
          "insulin_pen_dose_increments": insulin_pen_dose_increments.toString(),
          "insulin_pump": insulin_pump.toString(),
          "insulin_name": insulin_name.toString(),
          "rapid_short_acting_insulin": rapid_short_acting_insulin.toString(),
          "medi_name": medi_name.toString(),
          "dose": dose.toString(),
          "qty": qty.toString(),
          "medi_name_2": medi_name_2.toString(),
          "dose_2": dose_2.toString(),
          "qty_2": qty_2.toString(),
          "intermediate_long": intermediate_long.toString(),
          "hyperglycemia": hypogly_cemia.toString(),
          "glucose_targets": glucose_traget.toString(),
          "glucose_high": glucose_hi.toString(),
          "glucose_low": glucose.toString(),
          "hypoglycemia": hypoglycemia.toString(),
          "ratio": ratio.toString(),
          "ratio_2": ratio_2.toString(),
          "time": DateTime.now().toString(),
          "time_2": DateTime.now().toString(),
        });
        request.files.add(await http.MultipartFile.fromPath(
          "image",
          image.toString(),
        ));
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {

          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          Utils().sendMassage('${jsonResponse['msg'].toString()}');
          if (jsonResponse['result'].toString() == "true".toString()) {
            print(jsonResponse.toString());
            isloading.value = false;
            //var shared_preferences = await SharedPreferences.getInstance();
            // var user_signup_id = shared_preferences.setString(
            //    "user_signup_id", jsonResponse["data"]["id"].toString());
            //var user_signup_status = shared_preferences.setString(
            //  "user_signup_status",
            //  jsonResponse["data"]["user_status"].toString());
            // user_signup.clear();
            // user_signup.add(jsonResponse.toString());
            Get.to(() => Edit_profile_u());
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    } else {
      print("null___________________________________________________");
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}user_update_profile"));
        request.fields.addAll({
          "user_id": user_id_signup.toString(),
          "user_name": user_name.toString(),
          "first_name": first_name.toString(),
          "last_name": last_name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "address": address.toString(),
          "gender": gender.toString(),
          "dob": dob.toString(),
          "receive_email": emial_rec.toString(),
          "referral_code": referral_code,
          "diabetes_types": diabetes_types,
          "weight": weight,
          "height": height,
          "activity_factor": activity_factor,
          "non_insulin": non_insulin.toString(),
          "multiple_daily_injections": multiple_daily_injections.toString(),
          "insulin_pen_dose_increments": insulin_pen_dose_increments.toString(),
          "insulin_pump": insulin_pump.toString(),
          "insulin_name": insulin_name.toString(),
          "rapid_short_acting_insulin": rapid_short_acting_insulin.toString(),
          "medi_name": medi_name.toString(),
          "dose": dose.toString(),
          "qty": qty.toString(),
          "medi_name_2": medi_name_2.toString(),
          "dose_2": dose_2.toString(),
          "qty_2": qty_2.toString(),
          "intermediate_long": intermediate_long.toString(),
          "hyperglycemia": hypogly_cemia.toString(),
          "glucose_targets": glucose_traget.toString(),
          "glucose_high": glucose_hi.toString(),
          "glucose_low": glucose.toString(),
          "hypoglycemia": hypoglycemia.toString(),
          "ratio": ratio.toString(),
          "ratio_2": ratio_2.toString(),
          "time": DateTime.now().toString(),
          "time_2": DateTime.now().toString(),
        });
        print("_______________________________________");
        // request.files.add(await http.MultipartFile.fromPath(
        //   "image",
        //   image.toString(),
        // ));
        print("++++++++++++++++++++++++++++++++++++++++++++");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("111111111111111111111111111");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          Utils().sendMassage('${jsonResponse['msg'].toString()}');
          if (jsonResponse['result'].toString() == "true".toString()) {
            print(jsonResponse.toString());
            isloading.value = false;
            //var shared_preferences = await SharedPreferences.getInstance();
            // var user_signup_id = shared_preferences.setString(
            //    "user_signup_id", jsonResponse["data"]["id"].toString());
            //var user_signup_status = shared_preferences.setString(
            //  "user_signup_status",
            //  jsonResponse["data"]["user_status"].toString());
            // user_signup.clear();
            // user_signup.add(jsonResponse.toString());
            // update();
            Get.to(() => Edit_profile_u());
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
  }
}
