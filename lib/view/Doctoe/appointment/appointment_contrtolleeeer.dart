import 'package:get/get.dart';
import '../login.dart';


class Appointment_controller extends GetxController {
  var his = 0.obs;

  void In(int val) {
    his.value = val;
  }

}