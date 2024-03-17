import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import 'package:suivivital/view/common/modle/doctor_timming.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/gettime.dart';
import '../../common/modle/gettimelist.dart';
import '../Profile_doc.dart';
import '../doc_time/doc_time table.dart';
import '../doc_time/doc_time_controller.dart';
import '../edit_profile/edit_profile_controller.dart';
import '../prescription.dart';
import '../profile/profile.dart';

class Appointment_api extends GetxController {
  List today_list = [].obs;
  List upcoming_list = [].obs;
  List past_list = [].obs;
  var useridfrpe = "".obs;
  var datefrpe = "".obs;
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  void useridforpe(val, val2,appointid,index,) async {
    useridfrpe.value = val;
    datefrpe.value = val2;
    Get.to(Prescription(appointid: appointid,indedx: index,userid: val,));
  }

  get_today() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var is_time = shared_preferences.getString('user_id');
    try {
      var res = await http
          .post(Uri.parse("${base_url}doctor_appointment_today"), body: {
        'doctor_id': is_time.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        today_list.clear();
        today_list.add(resData["data"]);
        print(today_list);

        loader_fa();
      } else {
        loader_fa();
      }
    } catch (e) {}
  }

  get_upcoming_list() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var is_time = shared_preferences.getString('user_id');
    try {
      var res = await http
          .post(Uri.parse("${base_url}doctor_appointment_tomorrow"), body: {
        'doctor_id': is_time.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        upcoming_list.clear();
        upcoming_list.add(resData["data"]);
      } else {}
    } catch (e) {}
  }

  get_past_list() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var is_time = shared_preferences.getString('user_id');
    try {
      var res = await http
          .post(Uri.parse("${base_url}doctor_appointment_past"), body: {
        'doctor_id': is_time.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        past_list.clear();
        past_list.add(resData["data"]);
        Utils().sendMassage('${resData['msg'].toString()}');
      } else {}
    } catch (e) {}
  }
}
