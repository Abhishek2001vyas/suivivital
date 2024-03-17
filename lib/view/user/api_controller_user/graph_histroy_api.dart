import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/common/modle/qwe.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/mnb.dart';
import '../../common/modle/poi.dart';
import '../../common/modle/rty.dart';

List bloodsu = [];
List hb1ac = [];
List bloodpre = [];
List bodywe = [];
List<double> bloodsuno = [];
List<double> bloodwe = [];
List<double> bloodhb1ac = [];
List<double> bloodpreno = [];
List<num> bloodsuno1 = [];

class Graph_histroy_api extends GetxController {
  var dropchange = "Blood Sugar Level".obs;
  RxBool isloading1 = false.obs;
  RxBool isloading2 = false.obs;
  RxBool isloading3 = false.obs;
  RxBool isloading4= false.obs;
  void loaderstr(String val) {
    dropchange.value = val;
    update();
  }



  void loader1() {
    isloading1.value = true;
    update();
  }
  void loader2() {
    isloading2.value = true;
    update();
  }
  void loader3() {
    isloading3.value = true;
    update();
  }
  void loader4() {
    isloading4.value = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    graphhistroy_bloodsugar_api();
    course_of_hba_1c_list_api();
    blood_pressure_list_api();
    body_weight_list_api();
    super.onInit();
  }

  graphhistroy_bloodsugar_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_sugar_levels_list"),
      body: {
        "user_id":isLogedIn.toString()

      }
      );

      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        bloodsu.clear();
        bloodsu.add(resData["date"]);
        print("yggg"+bloodsu[0][0]['date']);
        var ty = Qwe.fromJson(resData);
        bloodsuno.clear();
        bloodsuno1.clear();
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).concentration}");
          bloodsuno.add(ll);
        }

        for (int i = 0; i != ty.date!.length; i++) {
          var lll=int.parse("${ty.date!.elementAt(i).date}");
          bloodsuno1.add(lll);
        }
        isloading1.value = false;
        print(bloodsu);
        print(bloodsuno);
        print(bloodsuno1);
      } else {
        // Utils().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {}
  }

  course_of_hba_1c_list_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}course_of_hba_1c_list")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading2.value = false;
        hb1ac.clear();
        hb1ac.add(resData["date"]);
        bloodhb1ac.clear();
        // bloodsuno1.clear();
        var ty = Poi.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).hba1c}");
          bloodhb1ac.add(ll);
        }
      } else {
        isloading2.value = false;
      }
    } catch (e) {}
  }

  body_weight_list_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}body_weight_list")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading3.value = false;
        bodywe.clear();
        bodywe.add(resData["date"]);
        bloodwe.clear();
        var ty = Rty.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodwe.add(ll);
        }
      } else {
        isloading3.value = false;
      }
    } catch (e) {}
  }

  blood_pressure_list_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_pressure_list")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        isloading4.value = false;
        bloodpre.clear();
        bloodpre.add(resData["date"]);
        bloodpreno.clear();
        var ty = Mnb.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodpreno.add(ll);
        }
      } else {
        isloading4.value = false;
      }
    } catch (e) {}
  }


  graphhistroy_bloodsugarday_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_sugar_levels_list_days"),
          body: {
            "user_id":isLogedIn.toString()

          }
      );

      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        bloodsu.clear();
        bloodsu.add(resData["date"]);
        print("yggg"+bloodsu[0][0]['date']);
        var ty = Qwe.fromJson(resData);
        bloodsuno.clear();
        bloodsuno1.clear();
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).concentration}");
          bloodsuno.add(ll);
        }

        for (int i = 0; i != ty.date!.length; i++) {
          var lll=int.parse("${ty.date!.elementAt(i).date}");
          bloodsuno1.add(lll);
        }
        isloading1.value = false;
        print(bloodsu);
        print(bloodsuno);
        print(bloodsuno1);
      } else {
        // Utils().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {}
  }
  graphhistroy_bloodsugarweekly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_sugar_levels_list_weekly"),
          body: {
            "user_id":isLogedIn.toString()

          }
      );

      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        bloodsu.clear();
        bloodsu.add(resData["date"]);
        print("yggg"+bloodsu[0][0]['date']);
        var ty = Qwe.fromJson(resData);
        bloodsuno.clear();
        bloodsuno1.clear();
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).concentration}");
          bloodsuno.add(ll);
        }

        for (int i = 0; i != ty.date!.length; i++) {
          var lll=int.parse("${ty.date!.elementAt(i).date}");
          bloodsuno1.add(lll);
        }
        isloading1.value = false;
        print(bloodsu);
        print(bloodsuno);
        print(bloodsuno1);
      } else {
        // Utils().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {}
  }
  graphhistroy_bloodsugarmonthly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_sugar_levels_list_monthly"),
          body: {
            "user_id":isLogedIn.toString()

          }
      );

      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        bloodsu.clear();
        bloodsu.add(resData["date"]);
        print("yggg"+bloodsu[0][0]['date']);
        var ty = Qwe.fromJson(resData);
        bloodsuno.clear();
        bloodsuno1.clear();
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).concentration}");
          bloodsuno.add(ll);
        }

        for (int i = 0; i != ty.date!.length; i++) {
          var lll=int.parse("${ty.date!.elementAt(i).date}");
          bloodsuno1.add(lll);
        }
        isloading1.value = false;
        print(bloodsu);
        print(bloodsuno);
        print(bloodsuno1);
      } else {
        // Utils().sendMassage('${resData['msg'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {}
  }

  course_of_hba_1c_listday_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}course_of_hba_1c_list_days")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading2.value = false;
        hb1ac.clear();
        hb1ac.add(resData["date"]);
        bloodhb1ac.clear();
        // bloodsuno1.clear();
        var ty = Poi.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).hba1c}");
          bloodhb1ac.add(ll);
        }
      } else {
        isloading2.value = false;
      }
    } catch (e) {}
  }
  course_of_hba_1c_listweekly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}course_of_hba_1c_list_weekly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading2.value = false;
        hb1ac.clear();
        hb1ac.add(resData["date"]);
        bloodhb1ac.clear();
        // bloodsuno1.clear();
        var ty = Poi.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).hba1c}");
          bloodhb1ac.add(ll);
        }
      } else {
        isloading2.value = false;
      }
    } catch (e) {}
  }
  course_of_hba_1c_listmonthly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}course_of_hba_1c_list_monthly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading2.value = false;
        hb1ac.clear();
        hb1ac.add(resData["date"]);
        bloodhb1ac.clear();
        // bloodsuno1.clear();
        var ty = Poi.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).hba1c}");
          bloodhb1ac.add(ll);
        }
      } else {
        isloading2.value = false;
      }
    } catch (e) {}
  }


  body_weight_listday_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}body_weights_list_days")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading3.value = false;
        bodywe.clear();
        bodywe.add(resData["date"]);
        bloodwe.clear();
        var ty = Rty.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodwe.add(ll);
        }
      } else {
        isloading3.value = false;
      }
    } catch (e) {}
  }
  body_weight_listdayweekly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}body_weights_list_weekly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading3.value = false;
        bodywe.clear();
        bodywe.add(resData["date"]);
        bloodwe.clear();
        var ty = Rty.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodwe.add(ll);
        }
      } else {
        isloading3.value = false;
      }
    } catch (e) {}
  }
  body_weight_listdaymonthly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}body_weights_list_monthly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        update();
        isloading3.value = false;
        bodywe.clear();
        bodywe.add(resData["date"]);
        bloodwe.clear();
        var ty = Rty.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodwe.add(ll);
        }
      } else {
        isloading3.value = false;
      }
    } catch (e) {}
  }

  blood_pressure_listday_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_pressure_list_days")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        isloading4.value = false;
        bloodpre.clear();
        bloodpre.add(resData["date"]);
        bloodpreno.clear();
        var ty = Mnb.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodpreno.add(ll);
        }
      } else {
        isloading4.value = false;
      }
    } catch (e) {}
  }
  blood_pressure_listdayweekly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_pressure_list_weekly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        isloading4.value = false;
        bloodpre.clear();
        bloodpre.add(resData["date"]);
        bloodpreno.clear();
        var ty = Mnb.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodpreno.add(ll);
        }
      } else {
        isloading4.value = false;
      }
    } catch (e) {}
  }
  blood_pressure_listdaymonthly_api() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    try {
      var res = await http.post(Uri.parse("${base_url}blood_pressure_list_monthly")
          ,
          body: {
            "user_id":isLogedIn.toString()

          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
        update();
        isloading4.value = false;
        bloodpre.clear();
        bloodpre.add(resData["date"]);
        bloodpreno.clear();
        var ty = Mnb.fromJson(resData);
        for (int i = 0; i != ty.date!.length; i++) {
          var ll = double.parse("${ty.date!.elementAt(i).weight}");
          bloodpreno.add(ll);
        }
      } else {
        isloading4.value = false;
      }
    } catch (e) {}
  }







}
