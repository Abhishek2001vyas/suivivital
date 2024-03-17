import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/color.dart';
//import '../../api_controller/api_controller.dart';

class edit_profile_controller extends GetxController {
  RxString image11 = "".obs;
  RxString image_type1 = "AssetImage".obs;
  var view1 = 0.obs;
  RxString image21 = "".obs;
  RxString image_type21 = "AssetImage".obs;
  RxString image31 = "".obs;
  RxString image_type31 = "AssetImage".obs;
  //final signup1_con = Get.put(edit_profile_controller());
  var gender = 0.obs;
  var gender_name = "female".obs;
// var current_data=[].obs;
  //
  // @override
  //  void onInit() {
  //    // TODO: implement onInit
  //   current_update();
  //    super.onInit();
  //  }

  // void current_update(){
  //   current_data.value=postList;
  // }
  void gender_change(int val) {
    gender.value = val;
    if (gender == 0) {
      gender_name.value = "female";
    } else {
      gender_name.value = "male";
    }
  }

  void view_change1(value) {
    view1.value = value;
  }

  void imageto11() {
    image11.value = "";
    image_type1.value = "AssetImage";
  }

  void imageto21() {
    image21.value = "";
    image_type21.value = "AssetImage";
  }

  void imageto31() {
    image31.value = "";
    image_type31.value = "AssetImage";
  }
  // void imageto11(  ){
  //   image11.value= "";
  // }

  void bottomshet1() {
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

  void image_null1() {
    image_type1.value = "AssetImage";
    print(
        image_type1.value.toString() + "_____________________________________");
    update();
  }

  void image_null21() {
    image_type1.value = "AssetImage";
    print(
        image_type1.value.toString() + "_____________________________________");
    update();
  }

  void image_null31() {
    image_type1.value = "AssetImage";
    print(
        image_type1.value.toString() + "_____________________________________");
    update();
  }

  Future cam() async {
    var image111 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image111 != null) {
      image11.value = image111.path.toString();
      image_type1 = "FileImage".obs;
      print(image11.value.toString() + "_____________________________________");
      update();
    }
  }

  Future gall() async {
    var image111 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image111 != null) {
      image11.value = image111.path.toString();
      image_type1 = "FileImage".obs;
      print(
          image11.value + "-------------------------------------------------");
      update();
    }
  }

  Future cam31() async {
    var image51 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image51 == null) return;
    image21.value = image51.path.toString();
    print("++++++++++++++++++++++${image21.value}+++++++");
    image_type21 = "FileImage".obs;
    update();
  }

  Future gall31() async {
    var image51 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image51 == null) return;
    image21.value = image51.path.toString();
    print("++++++++++++++++++++++${image21.value}+++++++");
    image_type21 = "FileImage".obs;
    update();
  }

  void showBottomSheet11() {
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
                  cam31();
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
                  gall31();
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

  Future cam21() async {
    var image41 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image41 == null) return;
    image31.value = image41.path.toString();
    image_type31 = "FileImage".obs;
    update();
  }

  Future gall21() async {
    var image41 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image41 == null) return;
    image31.value = image41.path.toString();
    image_type31 = "FileImage".obs;
    update();
  }

  void showBottomSheet21() {
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
                  cam21();
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
                  gall21();
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
