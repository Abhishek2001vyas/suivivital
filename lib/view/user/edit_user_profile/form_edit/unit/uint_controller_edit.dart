import 'package:get/get.dart';

import '../../../api_controller_user/update_api.dart';

class Unit_edit_con extends GetxController {
  var diabetetype =
      user_deatils2.elementAt(0).data!.diabetesTypes.toString().obs;

  void drop(String val) {
    diabetetype.value = val;
    update();
  }
}
