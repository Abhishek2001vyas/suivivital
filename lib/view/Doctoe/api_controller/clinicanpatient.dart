import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List listpatientrefer=[];
class Clinicanpatient extends GetxController{
  RxBool isloading = false.obs;
  List listpatientrefer=[].obs;
  void loader() {
    isloading.value = true;
    update();
  }

  Addcclin_api() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    Map body = {
      'doctor_id': isLogedIn.toString(),

    };
    try {
      var res = await http.post(Uri.parse("${base_url}doctor_show_clinic_details"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        listpatientrefer.clear();
        listpatientrefer.add(resData["data"]);

        isloading.value = false;
      } else {
       // Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

}


