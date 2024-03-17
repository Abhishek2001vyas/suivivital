import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../custom_widget/text_filled.dart';
import '../../utils/color.dart';
import 'account_create_spalsh/account_create_doctor.dart';
import 'login.dart';

class Signup2 extends StatefulWidget {
  const Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            "Sign Up",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: colors.hinttext),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.location_on_outlined,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      // Initial Value
                      value: states,
                      hint: Text('select state'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: colors.primary),

                      // Array list of items
                      items: state.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          states = newValue ?? '';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.location_on_outlined,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                      width: w / 1.23,
                      height: h / 13,
                      padding: EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: Text("selct address")),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              TextFilled(
                controller: fee,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please fees";
                  }
                  return null;
                },
                keyType: TextInputType.name,
                hindtext: 'Entre consulting',
                labeltext: 'consulting fees',
              ),
              SizedBox(
                height: h / 35,
              ),
              Text(
                " Select cerficate image",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.geryq1, width: 2),
                          shape: BoxShape.circle),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                _showBottomSheet1(context);
                              },
                              icon: Icon(
                                Icons.edit,
                                color: colors.geryq1,
                              )))),
                  image != null
                      ? Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(image!),
                            // radius: 80,
                            // AssetImage('assets/images/profile.jpg'),
                            // backgroundImage:
                            // child: Image.file(image!,
                            //     alignment: Alignment.center),
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/th-_1_.jpg",
                          ),
                          //
                          radius: 60,
                          // child: Image.asset(
                          //     "assets/images/th-_1_.jpg"),
                        )),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.geryq1, width: 2),
                          shape: BoxShape.circle),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  image = null;
                                });
                              },
                              icon: Icon(
                                Icons.clear,
                                color: colors.geryq1,
                              )))),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Text(
                " Select licence image",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.geryq1, width: 2),
                          shape: BoxShape.circle),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                _showBottomSheet2(context);
                                print("nmmml");
                              },
                              icon: Icon(
                                Icons.edit,
                                color: colors.geryq1,
                              )))),
                  image2 != null
                      ? Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(image2!),
                            // radius: 80,
                            // AssetImage('assets/images/profile.jpg'),
                            // backgroundImage:
                            // child: Image.file(image!,
                            //     alignment: Alignment.center),
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/th-_1_.jpg",
                          ),
                          backgroundColor: Colors.white,
                          radius: 60,
                        )),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.geryq1, width: 2),
                          shape: BoxShape.circle),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  image2 = null;
                                });
                              },
                              icon: Icon(
                                Icons.clear,
                                color: colors.geryq1,
                              )))),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Container(
                width: w / 1,
                height: h / 15,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff4c5df4))),
                    onPressed: () {
                      Get.to(Account_cr_doc());
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.geryq1,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    child: Text('sign in',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Get.to(Logind());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController fee = TextEditingController();
  List<String> state = [
    'M.P',
    'Gujrat',
    'Delhi',
    'Maharashtra',
    'U.p',
  ];
  String? states;

  File? image;
  File? image2;

  Future cam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future gall() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  void _showBottomSheet1(BuildContext context) {
    print("jkbbjk");
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      context: context,
      builder: (BuildContext context) {
        return Container(
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
                  // pickImage(ImageSource!.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel_outlined, color: colors.primary),
                title: Text('Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  // Implement share functionality
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future cam2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image2 = imageTemporary;
    });
  }

  Future gall2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image2 = imageTemporary;
    });
  }

  void _showBottomSheet2(BuildContext context) {
    print("jkbbjk");
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      context: context,
      builder: (BuildContext context) {
        return Container(
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
                  // pickImage(ImageSource!.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel_outlined, color: colors.primary),
                title: Text('Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  // Implement share functionality
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
