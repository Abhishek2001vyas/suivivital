import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../account_create_spalsh/account_create_doctor.dart';
import '../signup/signup_controller.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class Signup_doctor_api extends GetxController {
  RxBool isloading = false.obs;
  final signup_con = Get.put(Signup_controller());
  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  signup_api(
      name,
      email,
      mobile,
      qualifications,
      profess,
      experciencess,
      states,
      fee,
      image,
      image2,
      image3,
      address,
      gender,
      about,
      national_doctor,
      countrycode
      ) async {
    List<int> imageBytes = await readAssetImage("assets/images/th-_1_.jpg");
    List image_list = [
      image.toString(),
      image2.toString(),
      image3.toString(),
    ];
    List image1_list = [
      image2.toString(),
      image3.toString(),
    ];
    List par1_name = [
      "certificate_image",
      "license_image",
    ];
    List par_name = [
      "profile_image",
      "certificate_image",
      "license_image",
    ];
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse("${base_url}doctor_signup"));
      request.fields.addAll({
        "name": name.toString(),
        "email": email.toString(),
        "mobile": mobile.toString(),
        "qualification": qualifications.toString(),
        "profession": profess.toString(),
        "experience": experciencess.toString(),
        "state": states.toString(),
        "address": address.toString(), // static he
        "fees_condition": fee.toString(),
        "gender": gender.toString(),
        "about": about.toString(),
        "referral_code": national_doctor.toString(),
        "country_code":countrycode.toString()
      });

      if(image=="") {
        request.files.add(await http.MultipartFile.fromBytes(
          "profile_image",
          imageBytes ,
          filename: 'image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
        for (int i = 0; i < 2; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par1_name[i],
            image1_list[i],
          ));
        }
      }
      else {
        for (int i = 0; i < 3; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name[i],
            image_list[i],
          ));
        }
      }
      http.StreamedResponse response1 = await request.send();
      if (response1.statusCode == 200) {
        var responseString = await response1.stream.bytesToString();
        var jsonResponse = json.decode(responseString.toString());
        Utils().alertbox(
            '${jsonResponse['msg'].toString()} \n  Please upload all field & all photo');
        if (jsonResponse['result'].toString() == "true".toString()) {
          isloading.value = false;
          update();
          Get.to(Account_cr_doc());
        }
      } else {
        isloading.value = false;
        update();
        signup_con.view_change(0);
        print(response1.reasonPhrase.toString());
      }
    } catch (e) {}
  }
  Future<List<int>> readAssetImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();
    return bytes;
  }
}
