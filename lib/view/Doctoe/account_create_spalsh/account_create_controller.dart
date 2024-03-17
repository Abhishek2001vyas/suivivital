import 'package:get/get.dart';
import '../login.dart';

class Account_splash extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    navigtohome();
    super.onInit();
  }

  void navigtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Get.to(() => Logind());
  }
}
