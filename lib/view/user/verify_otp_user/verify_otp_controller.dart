import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify_otp_user extends GetxController {
  var otpagain = "000".obs;
  var res = "".obs;
  //
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   resent1();
  //   resent();
  //   super.onInit();
  // }

  resent1() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn1 = shared_preferences.getString('otp');
    otpagain.value = isLogedIn1!;
    update();
  }

  resent() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('otp');
    otpagain.value = isLogedIn!;
    await Future.delayed(Duration(seconds: 60), () {});
    res.value = "Res";
  }

   resentagain() async {
    res.value = "Resent";
    resent();

  }

  resentagainagin() {
    otpagain.value = "000";

    update();
  }
}
