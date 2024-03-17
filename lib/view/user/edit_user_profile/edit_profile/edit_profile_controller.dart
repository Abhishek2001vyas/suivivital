import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/color.dart';

class Edit_user_controller extends GetxController {
  var emailnotifiy = 0.obs;
  var gender = 0.obs;
  var gender_name = "female".obs;
  RxString image = "".obs;
  RxString image_type = "AssetImage".obs;

  void email_notify(int val) {
    emailnotifiy.value = val;
  }

  void gender_change(int val) {
    gender.value = val;
    if (gender == 0) {
      gender_name.value = "female";
    } else {
      gender_name.value = "male";
    }
  }

  void bottomshet() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Take Image From',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.camera_alt, color: colors.primary),
                title: Text('Camera',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                onTap: () {
                  cam();
                  Get.back();
                  // pickImage(ImageSource!.camera,);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.image,
                  color: colors.primary,
                ),
                title: Text('Gallary',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  gall();
                  Get.back();
                  // pickImage(ImageSource!.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel_outlined, color: colors.primary),
                title: Text('Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ));
  }

  void image_null() {
    image_type.value = "AssetImage";
    print(
        image_type.value.toString() + "_____________________________________");
    update();
  }

  Future cam() async {
    final image1 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image1 != null) {
      image.value = image1.path.toString();
      image_type = "FileImage".obs;
      print(image_type.value.toString() +
          "_____________________________________");
      update();
    }
  }

  Future gall() async {
    final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image1 != null) {
      image.value = image1.path.toString();
      image_type = "FileImage".obs;
      update();
    }
  }
}
