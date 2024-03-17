import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../log2/graph_01.dart';
import 'HbA1c_api.dart';

class Bloodpressure_api extends GetxController {
  TextEditingController wei = TextEditingController();
  TextEditingController date = TextEditingController(text: dateFormat.format(DateTime.now()));
  TextEditingController hour = TextEditingController(text: TimeOfDay.now().toString().substring(10,15));
  TextEditingController wei2 = TextEditingController();

  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  bloodpres_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      "user_id": isLogedIn.toString(),
      "weight": wei.text.toString(),
      "date": date.text.toString(),
      "hour": hour.text.toString(),
      "weight_2": wei2.text.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}add_blood_pressure"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        Get.to(Graph_page());
        isloading.value = false;
      } else {
        isloading.value = false;
      }
    } catch (e) {}
  }
}
