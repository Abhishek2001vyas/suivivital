import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/Online_Doctor_list.dart';
import '../../common/modle/Profile_user.dart';
import '../edit_profile_u.dart';

List<OnlineDoctorList> online_doctor = [];

class Online_doctor_list extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    online_doc();
    super.onInit();
  }

  Future<List<OnlineDoctorList>?> online_doc() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}docetor_online_offline_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        var profile_data1 = OnlineDoctorList.fromJson(resData);
        online_doctor.clear();
        online_doctor.add(profile_data1);
        //var last_len1=shared_preferences.setString("user_deatils_length","${user_deatils.length - 1.toInt()}");
        var last_len = online_doctor.length - 1;

        return online_doctor;
      } else {
        return online_doctor;
      }
    } catch (e) {}
  }
}
