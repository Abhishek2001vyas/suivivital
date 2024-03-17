import 'package:get/get.dart';

class Unit_con extends GetxController {
  var diabetetype = "non-diabetes".obs;

  void drop(String val) {
    diabetetype.value = val;
    update();
  }
}
