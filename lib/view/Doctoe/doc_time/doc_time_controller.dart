import 'package:get/get.dart';

class Doc_time_controller extends GetxController {
  var mae = 3.obs;
  var shift = 8.obs;
  var shift2 = 12.obs;
  List multiple_select = [].obs ;

  void mtime(val) {
    multiple_select.add(val);
    multiple_select.sort();

  }

  void rtime(val) {
    multiple_select.remove(val);
    multiple_select.sort();
    update();
  }

  void mae1(int val) {
    mae.value = val;

  }

  void shift1(int val) {
    shift.value = val;
  }

  void shift3(int val) {
    shift2.value = val;
  }
}
