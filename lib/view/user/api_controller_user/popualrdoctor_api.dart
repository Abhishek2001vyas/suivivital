import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/populardoctor.dart';
import '../edit_profile_u.dart';

List popualr_doctor = [];
List popualr_doctor1 = [];
class popular_doctor_list extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    popular_doc();
    super.onInit();
  }
 popular_doc()async{
    try {
      var res = await http.get(
        Uri.parse("${base_url}popular_doctor"),
      );

      var resData = json.decode(res.body);
      popualr_doctor.clear();
      popualr_doctor1.clear();
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print(resData.toString());
        popualr_doctor1.add( resData["data"]);
        var profile_data1 = Populardoctor.fromJson(resData);
        popualr_doctor.add(profile_data1);
        print(popualr_doctor);
        var last_len = popualr_doctor.length - 1;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }

}