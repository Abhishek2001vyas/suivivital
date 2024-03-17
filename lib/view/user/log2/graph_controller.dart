import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Graph_controller extends GetxController {
  var gra = 0.obs;

  void change_graph(int val) {
    print(val);
    gra.value = val;
  }
}
