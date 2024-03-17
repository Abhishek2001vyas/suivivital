import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List<String> insulinpumpss = [];
List<String> rapidshortactinginsulin_data = [];
List<String> intermediatelong_actinginsulin_data = [];

class Dropdown_user_me_list extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getinsulinpump();
    rapidshortactinginsulin();
    intermediatelongactinginsulin();
    super.onInit();
  }

  void getinsulinpump() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_insulin_pump"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        insulinpumpss.clear();
        for (int i = 0; i != 12; i++) {
          insulinpumpss.add(resData["data"][i]["insulin_pump_name"].toString());
          update();
        }
        ;
        print(insulinpumpss.length);
        print(insulinpumpss);
      } else {
       //Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }

  void rapidshortactinginsulin() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_rapid_short_acting_insulin"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        rapidshortactinginsulin_data.clear();
        for (int i = 0; i != 10; i++) {
          rapidshortactinginsulin_data
              .add(resData["data"][i]["rapid_short_name"].toString());
          update();
        }
        ;
        print(rapidshortactinginsulin_data.length);
        print(rapidshortactinginsulin);
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }

  void intermediatelongactinginsulin() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_intermediate_long_acting_insulin"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        intermediatelong_actinginsulin_data.clear();
        for (int i = 0; i != 10; i++) {
          intermediatelong_actinginsulin_data
              .add(resData["data"][i]["name"].toString());
          update();
        }
        ;
        print(intermediatelong_actinginsulin_data.length);
        print(intermediatelong_actinginsulin_data);
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
