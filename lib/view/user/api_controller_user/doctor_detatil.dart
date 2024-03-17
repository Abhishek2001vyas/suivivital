import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../Doctoe/verify_otp/Verify_otp_doc.dart';
import '../doctor_deatil.dart';

List details = [];
List details1 = [];
List details_review = [];
class doctor_Details extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  detail_doctor_api(doctor_id) async {
    var shared_preferences = await SharedPreferences.getInstance();
    Map body = {
      'doctor_id': doctor_id,
    };
    try {
      var res =
          await http.post(Uri.parse("${base_url}Doctor_details"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        details.clear();
        details.add(resData["data"]);
        // Get.to(Doctor_deatils());
        isloading.value = false;
      } else {
       // Utils().alertbox('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  detail_doctor_api1(doctor_id) async {
    var shared_preferences = await SharedPreferences.getInstance();
    Map body = {
      'doctor_id': doctor_id,
    };
    try {
      var res =
      await http.post(Uri.parse("${base_url}Doctor_single_details"), body: body);
      var resData = json.decode(res.body);


      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        details1.clear();
        details1.add(resData["data"]);
        // Get.to(Doctor_deatils());
        detail_doctor_api(doctor_id);
        isloading.value = false;
      } else {
       //   Utils().alertbox('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

}

class Review_detail extends GetxController {
  RxBool isloading = false.obs;
  void loader() {
    isloading.value = true;
    update();
  }

  detail_doctor_api_1(doctor_id) async {
    var shared_preferences = await SharedPreferences.getInstance();
    Map body = {
      'doctor_id': doctor_id,
    };

    try {
      var res =
      await http.post(Uri.parse("${base_url}Doctor_details"), body: body);

      var resData = json.decode(res.body);


      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print(resData["data"]);
        details_review.clear();
        details_review.add(resData["data"]);
        //Get.to(Doctor_deatils());
        isloading.value = false;
      } else {
        Utils().alertbox('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }



}
