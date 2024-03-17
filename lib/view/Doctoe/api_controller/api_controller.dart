import 'package:get/get.dart';

class Api_controller extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

// resend_otp()async{
//   var shared_preferences = await SharedPreferences.getInstance();
//   var isLogedIn = shared_preferences.getString('user_id');
//   Map body = {
//     'user_id': isLogedIn.toString(),
//   };
//
//   try {
//     var res = await http.post(
//         Uri.parse(
//             "${base_url}doctor_resend_otp"),
//         body: body);
//     var resData = json.decode(res.body);
//     if (res.statusCode == 200 &&
//         resData["result"].toString() == "true".toString()) {
//       Utils().sendMassage('${resData['msg'].toString()}');
//       update();
//       print(resData["data"].toString());
//       //print(resData["data"]["id"].toString());
//       var otp_set = shared_preferences.setString('otp',resData["data"]["otp"].toString());
//     }
//     else {
//       Utils().sendMassage('${resData['msg'].toString()}');
//       //print(resData["msg"].toString());
//     }
//   }catch(e){}
// }
}
