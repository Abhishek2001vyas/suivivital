import 'package:get/get.dart';
import 'package:flutter/material.dart';

class gulcoselevel_controller extends GetxController {
  var val1 = 0.obs;
  var val2 = 0.obs;

  void val11(int val111) {
    val1.value = val111;
  }

  void val22(int val222) {
    val2.value = val222;
  }
}
