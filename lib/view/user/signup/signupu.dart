import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suivivital/view/user/signup/signup_controller.dart';
import '../../../custom_widget/text_filled.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../api_controller_user/signup_api.dart';
import '../form/thearpy/therapy_controller.dart';
import '../loginu.dart';

class Signupu extends StatefulWidget {
  const Signupu({super.key});

  @override
  State<Signupu> createState() => _SignupuState();
}

class _SignupuState extends State<Signupu> {
  final formKey = GlobalKey<FormState>();
  final signup_cont = Get.put(Signup_user_controller());
  final signup_api = Get.put(Signup_user());
  final therapy_contoller = Get.put(Therapy_controller());
  int ll = 8;
  var contrycode= "226";
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(Loginu());
              },
              icon: Icon(
                Icons.arrow_back,
              )),
          title: Text(
            "User Profile",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 15, bottom: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.geryq1, width: 2),
                              shape: BoxShape.circle),
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    signup_cont.bottomshet();
                                    print("nmmml");
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: colors.geryq1,
                                  )))),
                      GetBuilder<Signup_user_controller>(builder: (controller) {
                        return signup_cont.image_type.value == "FileImage"
                            ? Center(
                                child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(
                                        File(signup_cont.image.toString()))),
                              )
                            : Center(
                                child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/th-_1_.jpg",
                                ),
                                backgroundColor: Colors.white,
                                radius: 60,
                              ));
                      }),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.geryq1, width: 2),
                              shape: BoxShape.circle),
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    signup_cont.image_null();
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: colors.geryq1,
                                  )))),
                    ],
                  ),
                  SizedBox(
                    height: h / 15,
                  ),
                  TextFilled(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter Username";
                      }
                      return null;
                    },
                    keyType: TextInputType.name,
                    hindtext: 'Entre Username',
                    labeltext: 'Username',
                  ),
                  SizedBox(
                    height: h / 70,
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
                    hindtext: 'Entre First name',
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
                    hindtext: 'Entre Last name',
                    labeltext: 'Last name',
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  TextFilled(
                    controller: email,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "please enter email";
                    //   }
                    //   return null;
                    // },
                    keyType: TextInputType.name,
                    hindtext: 'Entre email',
                    labeltext: 'email',
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  SizedBox(
                    width: w / 1.15,
                    child: IntlPhoneField(
                      onCountryChanged: (value) {

                        setState(() {
                          ll = value.maxLength;
                          contrycode=value.dialCode;
                        });
                      },
                      controller: mobile,
                      validator: (value) {
                        if (value == null) {
                          return "please mobile";
                        }
                        return null;
                      },
                      flagsButtonPadding: const EdgeInsets.all(8),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'BF',
                    ),
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: colors.geryq1,
                        size: 24,
                      ),
                      Container(
                        width: w / 1.23,
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colors.geryq1, width: 1)),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          // Initial Value
                          value: dropdownvalue,
                          hint: const Text('select'),
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
                    height: h / 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.female_outlined,
                        color: colors.geryq1,
                        size: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          signup_cont.gender_change(0);
                        },
                        child: Obx(
                          () => Container(
                            width: w / 2.8,
                            height: h / 15,
                            padding: const EdgeInsets.only(
                                top: 15, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                                color: signup_cont.gender == 0
                                    ? colors.logosec
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: colors.geryq1, width: 1)),
                            child: Text(
                              "Female",
                              style: TextStyle(
                                  color: signup_cont.gender == 0
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w / 100,
                      ),
                      const Icon(
                        Icons.male,
                        color: colors.geryq1,
                        size: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          signup_cont.gender_change(1);
                        },
                        child: Obx(
                          () => Container(
                            width: w / 2.8,
                            height: h / 15,
                            padding: const EdgeInsets.only(
                                top: 15, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                                color: signup_cont.gender == 1
                                    ? colors.logosec
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: colors.geryq1, width: 1)),
                            child: Text(
                              "Male",
                              style: TextStyle(
                                  color: signup_cont.gender == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: colors.geryq1,
                        size: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          datepicker();
                        },
                        child: Container(
                          width: w / 1.23,
                          height: h / 15,
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: colors.geryq1, width: 1)),
                          child: Text("Birthday date :- $datespick"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.email_rounded,
                        color: colors.geryq1,
                        size: 24,
                      ),
                      GestureDetector(
                        onDoubleTap: () {
                          signup_cont.email_notify(0);
                        },
                        onTap: () {
                          signup_cont.email_notify(1);
                        },
                        child: Obx(
                          () => Container(
                            width: w / 1.23,
                            height: h / 15,
                            padding: const EdgeInsets.only(
                                top: 15, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                                color: signup_cont.emailnotifiy == 1
                                    ? colors.logosec
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: colors.geryq1, width: 1)),
                            child: const Text("Receive email notification"),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    Checkbox(
                      side: const BorderSide(color: colors.geryq1, width: 2),
                      value: value1,
                      onChanged: (value) {
                        setState(() {
                          value1 = value;
                        });
                      },
                    ),
                    const Text(
                      "I have read term & policy",
                    )
                  ]),
                  SizedBox(
                    height: h / 20,
                  ),
                  Obx(
                    () => signup_api.isloading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            width: w / 1,
                            height: h / 15,
                            child:
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff4c5df4))),
                                onPressed: () async {
                                  if (formKey.currentState!.validate() &&
                                      mobile.text.toString().length == ll) {
                                    await signup_api.signup_api(
                                        username.text.toString(),
                                        firstname.text.toString(),
                                        lastname.text.toString(),
                                        email.text.toString(),
                                        mobile.text.toString(),
                                        dropdownvalue.toString(),
                                        signup_cont.gender_name.toString(),
                                        datespick.toString(),
                                        signup_cont.emailnotifiy.toString(),
                                        signup_cont.image.toString(),
                                        contrycode.toString()
                                    );
                                  } else if (mobile.text.toString().length !=
                                      ll) {
                                    Utils().alertbox(
                                        ' Please entre mobile no up to $ll digit ');
                                  } else {
                                    Utils().alertbox(
                                        'Please fill all field & all photo');
                                  }
                                  signup_api.loader_fa();
                                },
                                child: const Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
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
                        child: const Text('Login',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.w600)),
                        onPressed: () {
                          Get.to(() => const Loginu());
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  bool? value1 = false;
  TextEditingController mobile = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();

  String dropdownvalue = "burkina faso";
  String diabetetype = "non-diabetes";
  var datespick = "";

  void datepicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2500, 1, 1), onChanged: (date) {
      setState(() {
        datespick = date.toString().substring(0, 10);
      });
    }, onConfirm: (date) {
      setState(() {
        datespick = date.toString().substring(0, 10);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
