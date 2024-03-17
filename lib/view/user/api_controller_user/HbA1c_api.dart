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

DateFormat dateFormat = DateFormat('dd-MM-yyyy');
class hba_1c_api extends GetxController {

  TextEditingController Hba_1c = TextEditingController();
  TextEditingController date = TextEditingController(text: dateFormat.format(DateTime.now()));
  TextEditingController hour = TextEditingController(text: TimeOfDay.now().toString().substring(10,15));

  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  HBA_1C_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      "user_id": isLogedIn.toString(),
      "hba_1c": Hba_1c.text.toString(),
      "date": date.text.toString(),
      "hour": hour.text.toString(),
      // "remark":remarks.text.toString(),
      // "measure":measure.toString(),
    };

    try {
      var res =
          await http.post(Uri.parse("${base_url}course_of_hba_1c"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading.value = false;
        Get.to(Graph_page());
      } else {
       // Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
