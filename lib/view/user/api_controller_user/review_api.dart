import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import '../history/history.dart';


List reviews = [];

class doctor_review extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  review_doctor_api(doctorid, rating, description) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user1_id');
    print(doctorid);
    Map body = {
      'userid': isLogedIn.toString(),
      'doctorid':doctorid.toString(),
      'rating': rating.toString(),
      'description': description.toString()
    };

    try {
      var res = await http.post(Uri.parse("${base_url}add_review_rating"),
          body: body);

      var resData = json.decode(res.body);
      print(resData);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        reviews.clear();
        reviews.add(resData["data"]);

        print(reviews);
        Get.to(History());

       // Utils().sendMassage('${resData['msg'].toString()}');

        isloading.value = false;
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
