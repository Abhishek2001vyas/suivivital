import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../log2/graph_01.dart';
import 'package:intl/intl.dart';

import 'HbA1c_api.dart';

class Blood_sugar_api extends GetxController {

  TextEditingController blood_sugar = TextEditingController();
  TextEditingController date = TextEditingController(text: dateFormat.format(DateTime.now()));
  TextEditingController hour = TextEditingController(text: TimeOfDay.now().toString().substring(10,15));
  TextEditingController remarks = TextEditingController();

  RxBool isloading = false.obs;


  void loader() {
    isloading.value = true;
    update();
  }

  bloodsugar_api(measure) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      "user_id": isLogedIn.toString(),
      "concentration": blood_sugar.text.toString(),
      "date": date.text.toString(),
      "hour": hour.text.toString(),
      "remark": remarks.text.toString(),
      "measure": measure.toString(),
    };

    try {
      var res = await http.post(Uri.parse("${base_url}blood_sugar_levels"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        isloading.value = false;
        Get.to(Graph_page());
      } else {
        isloading.value = false;
      }
    } catch (e) {}
  }
}
