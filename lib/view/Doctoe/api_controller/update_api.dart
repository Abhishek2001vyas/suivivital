import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../Profile_doc.dart';
import '../edit_profile/edit_profile_controller.dart';
import '../profile/profile.dart';
import '../profile/profile_controller.dart';

class Update_profile_doctor_api extends GetxController {
  RxBool isloading = false.obs;

  final signup1_con = Get.put(edit_profile_controller());
  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  updateprofile(
    name,
    email,
    mobile,
    qualifications,
    profess,
    experciencess,
    states,
    national_doctor,
    fee,
    image11,
    image21,
    image31,
    address,
    gender,
    about,
  ) async {
    print(national_doctor.toString());
    print(gender.toString());
    print(about.toString());
    List image_list = [
      image11,
      image21,
      image31,
    ];
    List par_name = [
      "profile_image",
      "certificate_image",
      "license_image",
    ];
    print("______________________________");
    print(image11);
    print(image21);
    print(image31);
    print("kldlfvmdszmol;vmdslcmvl");
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');

    if (image11 != "" && image21 != "" && image31 != "") {
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 3; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name[i],
            image_list[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto11();
            signup1_con.imageto21();
            signup1_con.imageto31();
            print(signup1_con.image11);
            print(signup1_con.image21);
            print(signup1_con.image31);
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image11 != "" && image21 != "") {
      print("12_____________________________");
      List image_list12 = [
        image11,
        image21,
      ];
      List par_name12 = [
        "profile_image",
        "certificate_image",
      ];
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 2; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name12[i],
            image_list12[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto11();
            signup1_con.imageto21();
            signup1_con.imageto31();
            print(signup1_con.image11);
            print(signup1_con.image21);
            print(signup1_con.image31);
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image11 != "" && image31 != "") {
      print("13____________");
      List image_list13 = [
        image11,
        image31,
      ];
      List par_name13 = [
        "profile_image",
        "license_image",
      ];
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 2; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name13[i],
            image_list13[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto11();
            signup1_con.imageto21();
            signup1_con.imageto31();
            print(signup1_con.image11);
            print(signup1_con.image21);
            print(signup1_con.image31);
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image21 != "" && image31 != "") {
      print("23________________________________");
      List image_list23 = [
        image21,
        image31,
      ];
      List par_name23 = [
        "certificate_image",
        "license_image",
      ];

      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 2; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name23[i],
            image_list23[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto11();
            signup1_con.imageto21();
            signup1_con.imageto31();
            print(signup1_con.image11);
            print(signup1_con.image21);
            print(signup1_con.image31);
            print("23________________________________");
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image11 != "") {
      List image_list1 = [
        image11,
      ];
      List par_name1 = [
        "profile_image",
      ];
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),

          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 1; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name1[i],
            image_list1[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto11();
            print("11__________________________");
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image21 != "") {
      List image_list2 = [
        image21,
      ];
      List par_name2 = [
        "certificate_image",
      ];
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 1; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name2[i],
            image_list2[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto21();
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else if (image31 != "") {
      List image_list3 = [
        image31,
      ];
      List par_name3 = [
        "license_image",
      ];

      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),
          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        for (int i = 0; i != 1; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            par_name3[i],
            image_list3[i],
          ));
        }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');
            signup1_con.imageto31();
            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
    else {
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse("${base_url}doctor_update_profile"));
        request.fields.addAll({
          "user_id": isLogedIn.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "mobile": mobile.toString(),
          "referral_code": national_doctor.toString(),
          "qualification": qualifications.toString(),
          "profession": profess.toString(),
          "experience": experciencess.toString(),
          "state": states.toString(),
          "address": address.toString(), // static he
          "fees_condition": fee.toString(),
          "gender": gender.toString(),
          "about": about.toString(),

          // "profile_image":image11.toString(),
          // "certificate_image":image21.toString(),
        });
        print("00000000000000000000000000000000000000000");

        // for (int i = 0; i != 3; i++) {
        //   request.files.add(await http.MultipartFile.fromPath(
        //     par_name[i],
        //     image_list[i],
        //   ));
        // }
        print("*???????????????????????????????????");
        http.StreamedResponse response1 = await request.send();
        if (response1.statusCode == 200) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          var responseString = await response1.stream.bytesToString();
          var jsonResponse = json.decode(responseString.toString());
          print("@@@@@@@@@@@@@@@@@@@@@@@");

          if (jsonResponse['result'].toString() == "true".toString()) {
            isloading.value = false;
            update();
            print(jsonResponse.toString());
            Utils().sendMassage('${jsonResponse['msg'].toString()}');

            Get.to(() => Nav_bar());
            signup1_con.view_change1(0);
          }
        } else {
          print(response1.reasonPhrase.toString());
        }
      } catch (e) {}
    }
  }
}
