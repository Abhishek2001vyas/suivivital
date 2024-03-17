import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List news = [];

class Terms_api extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    News();
    super.onInit();
  }

  News() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}news_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        news.clear();
        news.add(resData["data"]);
      } else {
        Utils().sendMassage(resData['msg'].toString());
        //print(resData["msg"].toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print("error");
      }
    }
  }
}
