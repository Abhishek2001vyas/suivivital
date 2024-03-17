import 'package:get/get.dart';

class Add_prescription_controller extends GetxController {
  var mae = 3.obs;
  var mae2 = "".obs;
  var eating = 3.obs;
  var eating2 = "3".obs;
  var shift = 8.obs;
  var shift2 = "".obs;
  var blad = 4.obs;
  var blad2 = "".obs;

  void mae1(int val, ss) {
    mae.value = val;
    mae2.value = ss;
  }

  void eating1(int val, ss) {
    eating.value = val;
    eating2.value = ss;
  }

  void shift1(int val, ss) {
    shift.value = val;
    shift2.value = ss;
  }

  void blad1(int val, ss) {
    blad.value = val;
    blad2.value = ss;
  }


}
