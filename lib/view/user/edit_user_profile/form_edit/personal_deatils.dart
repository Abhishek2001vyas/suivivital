import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suivivital/view/user/form/thearpy/therapy.dart';

import '../../../../custom_widget/text_filled.dart';
import '../../../../utils/color.dart';

class Form2 extends StatefulWidget {
  const Form2({super.key});

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        centerTitle: true,
        title: Text("SuiviVital"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: h / 70,
              ),
              Center(
                child: Text("Personal Deatils",
                    style: TextStyle(color: colors.primary)),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.female_outlined,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 0;
                      });
                    },
                    child: Container(
                      width: w / 2.8,
                      height: h / 15,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: gender == 0 ? colors.logosec : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: Text("Female"),
                    ),
                  ),
                  SizedBox(
                    width: w / 100,
                  ),
                  Container(
                      child: Icon(
                    Icons.male,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 1;
                      });
                    },
                    child: Container(
                      width: w / 2.8,
                      height: h / 15,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: gender == 1 ? colors.logosec : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: Text("Male"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
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
                                _showBottomSheet(context);
                              },
                              icon: Icon(
                                size: 24,
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
                                  image = null;
                                });
                              },
                              icon: Icon(
                                size: 24,
                                Icons.clear,
                                color: colors.geryq1,
                              )))),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              TextFilled(
                controller: firstname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter First name";
                  }
                  return null;
                },
                keyType: TextInputType.name,
                hindtext: 'Entre full name',
                labeltext: 'First name',
              ),
              SizedBox(
                height: h / 70,
              ),
              TextFilled(
                controller: lastname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter Last name";
                  }
                  return null;
                },
                keyType: TextInputType.name,
                hindtext: 'Entre full name',
                labeltext: 'Last name',
              ),
              SizedBox(
                height: h / 70,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: w / 2.6,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    controller: weight,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter weight";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: colors.geryq1, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.geryq1)),
                        hintText: 'Entre weight',
                        labelText: 'weight',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Text("Kg"),
                SizedBox(
                  width: w / 35,
                ),
                Container(
                  width: w / 2.6,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    controller: height,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter height";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: colors.geryq1, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.geryq1)),
                        hintText: 'Entre Height',
                        labelText: 'Height',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Text("Cm"),
              ]),
              SizedBox(
                height: h / 50,
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //         child: Icon(
              //       Icons.calendar_month_outlined,
              //       color: colors.geryq1,
              //       size: 24,
              //     )),
              //     GestureDetector(
              //       onTap: () {
              //         datepicker();
              //       },
              //       child: Container(
              //         width: w / 1.23,
              //         height: h / 15,
              //         padding: EdgeInsets.only(
              //             top: 15, left: 10, right: 10, bottom: 5),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             border: Border.all(color: colors.geryq1, width: 1)),
              //         child: Text("Birthday date :-" + datespick),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: h / 70,
              ),
              Text("Activity factor", style: TextStyle(color: colors.primary)),
              SizedBox(
                height: h / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.sports_gymnastics,
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
                      value: dropdownvalue,
                      hint: Text('select'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: colors.primary),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue ?? '';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 20,
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
                      Get.to(Form3());
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var gender = 0;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  File? image;
  String? dropdownvalue;
  List<String> items = [
    'Little or no exercise',
    'sport 1-3 days/week',
    'sport 3-5 days/week',
    'sport 6-7 days/week',
    'Sport and physical job',
  ];

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

  void _showBottomSheet(BuildContext context) {
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

  var datespick = "";

  void datepicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2500, 1, 1), onChanged: (date) {
      setState(() {
        datespick = date.toString();
      });
      print(datespick);
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        datespick = date.toString();
      });
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
