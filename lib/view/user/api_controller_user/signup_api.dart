import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../form/unit/units.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

List user_signup = [];

class Signup_user extends GetxController {
  RxBool isloading = false.obs;
  var view = 0.obs;
  var jsonResponse;
  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  void view_change(int value) {
    view.value = value;
  }

  signup_api(
    user_name,
    first_name,
    last_name,
    email,
    mobile,
    address,
    gender,
    dob,
    emial_rec,
    image,
      countrycode
  ) async {
    print("hhi");
    loader();

  List<int> imageBytes = await readAssetImage("assets/images/th-_1_.jpg");
  // List<String> listOfStrings = imageBytes.map((int number) => number.toString()).toList();
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${base_url}users_signup_first"));
      request.fields.addAll({
        "user_name": user_name.toString(),
        "first_name": first_name.toString(),
        "last_name": last_name.toString(),
        "email": email.toString(),
        "mobile": mobile.toString(),
        "address": address.toString(),
        "gender": gender.toString(),
        "dob": dob.toString(),
        "receive_email": emial_rec.toString(),
        "country_code":countrycode.toString()
      });
      print(imageBytes.toString());
      print(image);
      image==""?
      request.files.add(await http.MultipartFile.fromBytes(
        "image",
        imageBytes ,
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpeg'),
      )):
      request.files.add(await http.MultipartFile.fromPath(
        "image",
        image.toString(),
      ));
      print("hhi2");
      http.StreamedResponse response1 = await request.send();
      if (response1.statusCode == 200) {
        var responseString = await response1.stream.bytesToString();
         jsonResponse = json.decode(responseString.toString());
        Utils().alertbox(
            '${jsonResponse['msg'].toString()}\n Please fill all field & all photo');
        //Utils().sendMassage('${jsonResponse['msg'].toString()}');
        if (jsonResponse['result'].toString() == "true".toString()) {
          isloading.value = false;
          var shared_preferences = await SharedPreferences.getInstance();
          var user_signup_id = shared_preferences.setString(
              "user_signup_id", jsonResponse["data"]["id"].toString());
          var user_signup_status = shared_preferences.setString(
              "user_signup_status",
              jsonResponse["data"]["user_status"].toString());
          user_signup.clear();
          user_signup.add(jsonResponse.toString());
          print(user_signup.toString());
          print(jsonResponse["data"]["id"].toString());
          update();
         return Get.to(()=>const Form1());
        }
      } else {
        Utils().alertbox(
            '${jsonResponse['msg'].toString()} Please fill all field & all photo');
        print(response1.toString());
      }
    } catch (e) {}
  }
  Future<List<int>> readAssetImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();
    return bytes;
  }
}
