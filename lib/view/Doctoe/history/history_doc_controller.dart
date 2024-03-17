import 'package:get/get.dart';

class History_doc extends GetxController {
  var his = 0.obs;

  void In(int val) {
    his.value = val;
  }
}
