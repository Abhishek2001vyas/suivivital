import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';


List about1 = [];
class Aboutus_api extends GetxController {
  RxBool isloading1 = false.obs;

  void loader() {
    isloading1.value = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    aboutus();
    super.onInit();
  }

  aboutus() async {
    loader();
    try {
      var res = await http.get(
        Uri.parse("${base_url}get_about_us"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //Utils().sendMassage('${resData['msg'].toString()}');
        about1.clear();
        about1.add(resData["data"]["about_us"].toString());
        isloading1.value = false;
      } else {
        isloading1.value = false;
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }
}
