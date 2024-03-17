import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/waiting_pat.dart';

class Wating_appoint_api extends GetxController {
  RxList pat_list = [].obs;
  RxList pat2_list = [].obs;
  // List timedoctor = [].obs;
  RxBool isloading1 = false.obs;
  RxBool isloading2 = false.obs;
  var yesno = 0.obs;

  void loader() {
    isloading1.value = true;
    update();
  }

  void loader_fa() {
    isloading1.value = false;
    update();
  }

  void ww(val) {
    yesno.value = val;
    update();
  }
  void loader2() {
    isloading2.value = true;
    update();
  }

  void loader_f2() {
    isloading2.value = false;
    update();
  }
  get_pat_list() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    loader();
    try {
      var res = await http
          .post(Uri.parse("${base_url}booking_appointment_doctor"), body: {
        "doctor_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        pat_list.clear();
        pat2_list.clear();
        var patt=WaitingPat.fromJson(resData);
        for(int i=0;i!=patt.data!.length;i++){
        pat_list.add(resData["data"][i] );}

        for(int j=0;j!=patt.data!.length;j++){
          if(resData["data"][j]["status"] !="Accepted"){
          pat2_list.add(resData["data"][j] );}}
        // print(pat_list.elementAt(0));
        // print(pat_list.length);
        loader_fa();
      } else {
        loader_fa();
        //Utils().sendMassage('${resData['msg'].toString()}');
        // return qwer;
      }
    } catch (e) {}
  }

  accept( appointment_id,user_id,val) async {
    ww(val);
    loader2();
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http
          .post(Uri.parse("${base_url}booking_accepted"), body: {
        "doctor_id": isLogedIn.toString(),
        "appointment_id":appointment_id.toString(),
        "user_id":user_id.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        pat_list.clear();
        loader_f2();
        Utils().sendMassage('${resData['msg'].toString()}');
      } else {
        loader_f2();
        Utils().sendMassage('${resData['msg'].toString()}');
        // return qwer;
      }
    } catch (e) {}
  }

  reject(appointment_id,user_id,val) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http
          .post(Uri.parse("${base_url}booking_canceled"), body: {
        "doctor_id": isLogedIn.toString(),
        "appointment_id":appointment_id.toString(),
        "user_id":user_id.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        // print(resData);
        // print(resData.toString());
        // pat_list.clear();
        // var patt=WaitingPat.fromJson(resData);
        // for(int i=0;i!=patt.data!.length;i++){
        //   pat_list.add(resData["data"][i] );}
        // print(pat_list.elementAt(0));
        // print(pat_list.length);
        Utils().sendMassage('${resData['msg'].toString()}');
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        // return qwer;
      }
    } catch (e) {}
  }
}
