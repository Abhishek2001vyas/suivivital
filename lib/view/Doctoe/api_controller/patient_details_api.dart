import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../patient_deatils.dart';
import 'appoint_api.dart';



class patientdetails extends GetxController {
  final appoint_api_Controller = Get.put(Appointment_api());
  RxBool isloading = false.obs;
  List  Getpatientdetails= [].obs;
  void loader() {
    isloading.value = true;
    update();
  }

  Getpatientdetailslist(user_id,appoint_id,index1) async {
    loader();
    try {
      var res = await http
          .post(Uri.parse("${base_url}patient_details"), body: {
        "user_id": user_id.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Getpatientdetails.clear();
        Getpatientdetails.add(resData["data"]);
        isloading.value = false;
        print(Getpatientdetails.elementAt(0)["about"]);
        Get.to(Patient_deatails(
          appoint_id:appoint_id ,
          index1: index1,
        ));
        update();
      } else {
        isloading.value = false;
        update();
      }
    } catch (e) {}
  }

}