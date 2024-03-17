import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

List<String> dropstate = [];

class Signup_controller extends GetxController {
  RxString image = "".obs;
  RxString image_type = "AssetImage".obs;
  var view = 0.obs;
  RxString image2 = "".obs;
  RxString image_type2 = "AssetImage".obs;
  RxString image3 = "".obs;
  RxString image_type3 = "AssetImage".obs;
  var gender = 0.obs;
  var gender_name = "female".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getstate();
    super.onInit();
  }

  void gender_change(int val) {
    gender.value = val;
    if (gender == 0) {
      gender_name.value = "female";
    } else {
      gender_name.value = "male";
    }
  }

  void getstate() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}state_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        dropstate.clear();
        for (int i = 0; i != 44; i++) {
          dropstate.add(resData["data"][i]["name"].toString());
          update();
        }
        ;
        print(dropstate.length);
        print(dropstate.toString());
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }

   view_change(int value) {
    view.value = value;
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
    image.value = "";
    print(
        image_type.value.toString() + "_____________________________________");
    update();
  }

  void image_null2() {
    image_type2.value = "AssetImage";
    image2.value = "";
    print(
        image_type.value.toString() + "_____________________________________");
    update();
  }

  void image_null3() {
    image_type3.value = "AssetImage";
    image3.value = "";
    print(
        image_type.value.toString() + "_____________________________________");
    update();
  }

  Future cam() async {
    var image1 = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality:80 );
    if (image1 != null) {
      image.value = image1.path.toString();
      image_type = "FileImage".obs;
      print(image_type.value.toString() +
          "_____________________________________");
      update();
    }
  }

  Future gall() async {
    var image1 = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality:80);
    if (image1 != null) {
      image.value = image1.path.toString();
      image_type = "FileImage".obs;
      print(image.value + "-------------------------------------------------");
      update();
    }
  }

  Future cam3() async {
    var image5 = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality:80);
    if (image5 == null) return;
    image2.value = image5.path.toString();
    image_type2 = "FileImage".obs;
    update();
  }

  Future gall3() async {
    var image5 = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality:80);
    if (image5 == null) return;
    image2.value = image5.path.toString();
    image_type2 = "FileImage".obs;
    update();
  }

  void showBottomSheet1() {
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
                  cam3();
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
                  gall3();
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

  Future cam2() async {
    var image4 = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality:80);
    if (image4 == null) return;
    image3.value = image4.path.toString();
    image_type3 = "FileImage".obs;
    update();
  }

  Future gall2() async {
    var image4 = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality:80);
    if (image4 == null) return;
    image3.value = image4.path.toString();
    image_type3 = "FileImage".obs;
    update();
  }

  void showBottomSheet2() {
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
                  cam2();
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
                  gall2();
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

// void _showBottomSheet(BuildContext context) {
//
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(40), topLeft: Radius.circular(40))),
//     context: context,
//     builder: (BuildContext context) {
//
//
//     },
//   );
// }
}
