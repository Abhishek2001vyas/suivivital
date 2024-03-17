import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import 'appoint_api.dart';

List Getmedicinebydoctorforplistqq = [];
List Getmedicinebydoctorforplistforpdf = [];

class Getmedicinebydoctor extends GetxController {
  final appoint_api_Controller = Get.put(Appointment_api());
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Getmedicinebydoctorlist() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    loader();
    try {
      var res =
      await http.post(Uri.parse("${base_url}get_medication_list"), body: {
        "user_id": appoint_api_Controller.useridfrpe.toString(),
        "doctor_id": isLogedIn.toString(),
        "medicines_date": appoint_api_Controller.datefrpe.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Getmedicinebydoctorforplistqq.clear();
        Getmedicinebydoctorforplistqq.add(resData["data"]);
        isloading.value = false;
        update();
      } else {
        isloading.value = false;
        update();
      }
    } catch (e) {}
  }

  Getmedicinebydoctorlistforpdf(user_id, doctor_id, medicines_date) async {
    loader();

    try {
      var res =
      await http.post(Uri.parse("${base_url}get_medication_list"), body: {
        "user_id": user_id.toString(),
        "doctor_id": doctor_id.toString(),
        "medicines_date": medicines_date.toString(),
      });
      print("saiopjwojmfdolj");
      var resData = json.decode(res.body);
      print("jkdfdshklf");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Getmedicinebydoctorforplistforpdf.clear();
        Getmedicinebydoctorforplistforpdf.add(resData["data"]);
        print("hhhfkihdf  "+Getmedicinebydoctorforplistforpdf[0].length.toString());
        isloading.value = false;
        update();
      } else {
        isloading.value = false;
        update();
      }
    } catch (e) {}
  }
}
