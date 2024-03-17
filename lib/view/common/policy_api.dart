import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List<String> ploicy = [];

class Policy_api extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    pri_policy();
    super.onInit();
  }

  pri_policy() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_privacy_policy"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        ploicy.clear();
        ploicy.add(resData["data"]["description"].toString());
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
