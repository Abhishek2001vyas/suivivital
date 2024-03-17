import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import 'package:http/http.dart' as http;

class Doctor_on_off extends GetxController {
  Doc_on_off(body1) async {
    print(body1);
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http.post(Uri.parse("${base_url}docetor_online_offline"),
          body: {
            'user_id': isLogedIn.toString(),
            "status_on_of": body1.toString()
          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }
}
