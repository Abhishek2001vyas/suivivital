import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../prescription.dart';
import 'appoint_api.dart';

class add_prescription_api extends GetxController {
  RxBool isloading = false.obs;
  final appoint_api_Controller = Get.put(Appointment_api());

  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  add_prescription(medicines_name, medicines_dose, medicines_brand, days,
      eating, week_day, eating_time, medicines_days, comment) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    Map body = {
      "doctor_id": isLogedIn.toString(),
      'user_id': appoint_api_Controller.useridfrpe.value.toString(),
      "medicines_name": medicines_name.toString(),
      "medicines_dose": medicines_dose.toString(),
      "medicines_brand": medicines_name.toString(),
      "days": days.toString(),
      "eating": eating.toString(),
      "week_day": week_day.toString(),
      "eating_time": eating_time.toString(),
      "medicines_days": medicines_days.toString(),
      "comment": comment.toString(),
      "medicines_date": appoint_api_Controller.datefrpe.value.toString()
    };

    try {
      var res =
          await http.post(Uri.parse("${base_url}add_medicines"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()} ');
        update();
        Get.off(const Prescription());
        isloading.value = false;
      } else {
        Utils().alertbox('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
