import 'dart:convert';

import 'package:get/get.dart';
//import 'package:suivivital/view/api_controller/api_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/common/option_choose.dart';

import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/profile.dart';
import '../api_controller/api_controller.dart';

List postList = [];

class Profile_controller extends GetxController {
  final api_con = Get.put(Api_controller());
  var tureorfalse=true.obs;
//   @override
//   void onInit() {
//     // TODO: implement onInit
// api_con.prof();
//     super.onInit();
//   }

  var length1 = 8.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    prof();
    length();
    super.onInit();

  }


  void length() async {
    var shared_preferences = await SharedPreferences.getInstance();
    length1.value = shared_preferences.getString('postlength') as int;

  }

  onli(){
    postList.elementAt(0).data!.statusOnOf=="1"?
    tureorfalse.value=true
        :
    tureorfalse.value=false;
update();


  }
  RxBool isloading = false.obs;
  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  prof() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    loader();
    try {
      var res =
          await http.post(Uri.parse("${base_url}doctor_get_profile"), body: {
        "user_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {

        var profile_data = Profile.fromJson(resData);
// if(postList.length!=1){
//   postList.clear();
// }
        postList.clear();
        postList.add(profile_data);
        var last_len1 = shared_preferences.setString(
            "postlength", "${postList.length - 1.toInt()}");

        var last_len = postList.length - 1;
        onli();
        loader_fa();
        return postList;
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}55');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }

  void delete_account() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');

    try {
      var res =
          await http.post(Uri.parse("${base_url}delete_account_doctor"), body: {
        "user_id": isLogedIn.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {


        //var profile_data= Profile.fromJson(resData);
// if(postList.length!=1){
//   postList.clear();
// }
        //postList.add(profile_data);
        // var last_len1=shared_preferences.setString("postlength","${postList.length - 1.toInt()}");
        //var last_len=postList.length - 1 ;

        // return postList;
        var isLogedIn = shared_preferences.remove('user_id');
        Utils().sendMassage('${resData['msg'].toString()}');
        Get.to(Choose_option());
      } else {
        //Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }
}
