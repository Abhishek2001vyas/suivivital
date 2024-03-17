import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../user/video_call.dart';
import '../video_call_doctor.dart';

List agoratoken = [];
class Get_token extends GetxController{
  RxBool isloading = false.obs;


  void loader() {
    isloading.value = true;
    update();
  }

  gettoken(userid,dateappoint) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http.post(Uri.parse("${base_url}token_generate"),
          body: {
            "doctor_id" :isLogedIn.toString(),
            "user_id":userid.toString(),
            "date":dateappoint.toString(),
          });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        agoratoken.clear();
        print("66");
        print(resData["data"]);
        agoratoken.add(resData["data"]);
print("222");
       // Utils().sendMassage('${resData['msg'].toString()}');
        update();
        print(agoratoken);
        print(agoratoken.elementAt(0)["int_uid"]);
        print(agoratoken.elementAt(0)["temp_channel_name"]);
       Get.off(()=>  Video_call_doctor(
         channelname: agoratoken.elementAt(0)["temp_channel_name"],
         token: agoratoken.elementAt(0)["int_uid"],
       ));
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }

}