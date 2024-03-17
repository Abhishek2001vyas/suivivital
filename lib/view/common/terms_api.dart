import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List<String> Termscond = [];

class Terms_api extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Termscondition();
    super.onInit();
  }

  Termscondition() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_terms_condition"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        Termscond.clear();
        Termscond.add(resData["data"]["description"].toString());

      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
