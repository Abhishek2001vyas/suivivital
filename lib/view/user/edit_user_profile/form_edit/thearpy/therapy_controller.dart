import 'package:get/get.dart';

class Therapy_edit_controller extends GetxController {
  var noninsulin = 0.obs;
  var multiplday = 0.obs;
  var dose_name = "".obs;
  var insulinpump = 0.obs;
  var insulinpumpother = "Semglee".obs;

  void insluin(int val) {
    noninsulin.value = val;
    update();
  }

  void dose(int val) {
    multiplday.value = val;
    if (multiplday.value == 0) {
      dose_name.value = "0.5";
    } else if (multiplday.value == 1) {
      dose_name.value = "1.0";
    } else {
      dose_name.value = "non-insulin";
    }
    update();
  }

  void pump(int val) {
    insulinpump.value = val;
    update();
  }

  void dropd(String val) {
    insulinpumpother.value = val;
    update();
  }
}
