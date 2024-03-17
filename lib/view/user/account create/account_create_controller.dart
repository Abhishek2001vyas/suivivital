import 'package:get/get.dart';
import 'package:suivivital/view/user/loginu.dart';

class Account_splash_user extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    navigtohome();
    super.onInit();
  }


  navigtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Get.offAll(() => Loginu());
  }
}
