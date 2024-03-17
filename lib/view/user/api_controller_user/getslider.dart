import 'dart:convert';
import 'package:get/get.dart';
//import 'package:suivivital/view/api_controller/api_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/common/option_choose.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/profile.dart';


List sliderimage = [];

class Slider_image extends GetxController {


  slider() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res =
      await http.get(Uri.parse("${base_url}get_slider"));
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        sliderimage.clear();
        sliderimage.add(resData["date"]);

      } else {
      }
    } catch (e) {}
  }

}
