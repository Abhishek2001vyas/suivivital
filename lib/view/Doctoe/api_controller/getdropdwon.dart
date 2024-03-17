import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List<String> qualification = [];
List<String> profession = [];

class Getdrop extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getprofession();
    getqualification();

    super.onInit();
  }

  getprofession() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_profession"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        profession.clear();
        for (int i = 0; i <= 12; i++) {
          profession.add(resData["data"][i]["name"].toString());
          update();
        } ;
      } else {
      }
    } catch (e) {}
  }

  getqualification() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_qualification"),
      );
      var resData1 = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData1["result"].toString() == "true".toString()) {
        qualification.clear();
        for (int i = 0; i <= 10; i++) {
          qualification.add(resData1["data"][i]["name"].toString());
          update();
        }
        ;

      } else {
      }
    } catch (e) {}
  }
}
