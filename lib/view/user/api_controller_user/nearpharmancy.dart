import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/populardoctor.dart';
import '../edit_profile_u.dart';

List pharmancylist = [];

class Nearpharmancy_list extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    pharmancy();
    super.onInit();
  }
  pharmancy()async{
    try {
      var res = await http.get(
        Uri.parse("${base_url}pharmacy_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        // print(resData.toString());
        pharmancylist.clear();
        pharmancylist.add(resData["data"]);
        print(pharmancylist.elementAt(0)[0][1]["id"]+"8888");

      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }

}