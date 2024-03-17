import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List listdocotorrefer=[];
class Addclini extends GetxController{
  RxBool isloading = false.obs;
  RxBool isloading2 = false.obs;
  void loader() {
    isloading.value = true;
    update();
  }
  void loader2() {
    isloading2.value = true;
    update();
  }

Addcclin_api(refercode) async {
  loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
      'reference_code':refercode.toString(),
    };
    try {
      var res = await http.post(Uri.parse("${base_url}add_cilinic"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  show_refernce_doctor() async {
    loader2();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {
      'user_id': isLogedIn.toString(),
      //'reference_code':refercode.toString(),
    };
    try {
      var res = await http.post(Uri.parse("${base_url}show_clinic_details"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        listdocotorrefer.clear();
        listdocotorrefer.add(resData["data"]);
        print("hgjgjkb"+listdocotorrefer.toString());
        // Utils().sendMassage('${resData['msg'].toString()}');
        isloading2.value = false;
      } else {
       // Utils().sendMassage('${resData['msg'].toString()}');
        isloading2.value = false;
      }
    } catch (e) {}
    return listdocotorrefer;
  }

}