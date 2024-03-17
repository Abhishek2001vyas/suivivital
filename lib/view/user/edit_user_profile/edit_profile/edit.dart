import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/edit_user_profile/edit_profile/edit_profile_controller.dart';
import '../../../../custom_widget/text_filled.dart';
import '../../../../utils/color.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/utils.dart';
import '../../api_controller_user/get_dropdown_list.dart';
import '../../api_controller_user/signup_api.dart';
import '../../api_controller_user/update_api.dart';
import '../../edit_profile_u.dart';
import '../form_edit/glucose/glucoselevel_controller_edit.dart';
import '../form_edit/medicines/medicines_controller_edit.dart';
import '../form_edit/thearpy/therapy_controller.dart';
import '../form_edit/unit/uint_controller_edit.dart';

class Edit_profile_user extends StatefulWidget {
  const Edit_profile_user({super.key});

  @override
  State<Edit_profile_user> createState() => _Edit_profile_userState();
}

class _Edit_profile_userState extends State<Edit_profile_user> {
  final formKey = GlobalKey<FormState>();
  final edit_cont = Get.put(Edit_user_controller());
  final edit_api = Get.put(Update_profile_user());
  final therapy_contoller = Get.put(Therapy_edit_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        leading: IconButton(
            onPressed: () {
              edit_api.view == 0?
              Get.to(Edit_profile_u()):
              edit_api.view == 1?
              edit_api.view_change(0):
              edit_api.view == 2?
              edit_api.view_change(1):
              edit_api.view == 3?
              edit_api.view_change(2):
              edit_api.view == 4?
              edit_api.view_change(3):Text("");

             // Get.to(Edit_profile_u());
            },
            icon: Icon(
              Icons.arrow_back,
              color:Colors.white,
            )),
        title: Text("Edit Profile"),titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),

      ),
      body: Obx(
        () {
          return edit_api.view == 0
              ? SingleChildScrollView(
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
                                      border: Border.all(
                                          color: colors.geryq1, width: 2),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            edit_cont.bottomshet();

                                            print("nmmml");
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: colors.geryq1,
                                          )))),
                              GetBuilder<Edit_user_controller>(
                                  builder: (controller) {
                                return edit_cont.image_type.value == "FileImage"
                                    ? Center(
                                        child: CircleAvatar(
                                            radius: 60,
                                            backgroundImage: FileImage(File(
                                                edit_cont.image.toString()))),
                                      )
                                    : Center(
                                        child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/users/${user_deatils2.elementAt(0).data!.image.toString()}"),
                                        backgroundColor: Colors.white,
                                        radius: 60,
                                      ));
                              }),
                              Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colors.geryq1, width: 2),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            edit_cont.image_null();
                                          },
                                          icon: Icon(
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter email";
                              }
                              return null;
                            },
                            keyType: TextInputType.name,
                            hindtext: 'Entre email',
                            labeltext: 'email',
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          TextFilled(
                            controller: mobile,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter Mobile no";
                              }
                              return null;
                            },
                            keyType: TextInputType.name,
                            hindtext: 'Entre Mobile no',
                            labeltext: 'Mobile no',
                          ),
                          SizedBox(
                            height: h / 70,
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
                                padding: EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colors.geryq1, width: 1)),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  // Initial Value
                                  value: dropdownvalue1,
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
                                      dropdownvalue1 = newValue ?? '';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Container(
                          //         child: Icon(
                          //       CupertinoIcons.link,
                          //       color: colors.geryq1,
                          //       size: 24,
                          //     )),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: Container(
                          //         width: w / 1.23,
                          //         height: h / 15,
                          //         padding: EdgeInsets.only(
                          //             top: 15, left: 10, right: 10, bottom: 5),
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(10),
                          //             border: Border.all(color: colors.geryq1, width: 1)),
                          //         child: Text("Link Nipro 4sure Account"),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: h / 70,
                          // ),

                          SizedBox(
                            height: h / 70,
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
                                  edit_cont.gender_change(0);
                                },
                                child: Obx(
                                  () => Container(
                                    width: w / 2.8,
                                    height: h / 15,
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        left: 10,
                                        right: 10,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                        color: edit_cont.gender == 0
                                            ? colors.logosec
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: colors.geryq1, width: 1)),
                                    child: Text("Female"),
                                  ),
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
                                  edit_cont.gender_change(1);
                                },
                                child: Obx(
                                  () => Container(
                                    width: w / 2.8,
                                    height: h / 15,
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        left: 10,
                                        right: 10,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                        color: edit_cont.gender == 1
                                            ? colors.logosec
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: colors.geryq1, width: 1)),
                                    child: Text("Male"),
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
                              Container(
                                  child: Icon(
                                Icons.calendar_month_outlined,
                                color: colors.geryq1,
                                size: 24,
                              )),
                              GestureDetector(
                                onTap: () {
                                  datepicker();
                                },
                                child: Container(
                                  width: w / 1.23,
                                  height: h / 15,
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Birthday date :-" + datespick),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Container(
                          //         child: Icon(
                          //       Icons.water_drop,
                          //       color: colors.geryq1,
                          //       size: 24,
                          //     )),
                          //     Container(
                          //       width: w / 1.23,
                          //       padding:
                          //           EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           border: Border.all(color: colors.geryq1, width: 1)),
                          //       child: DropdownButton(
                          //         underline: const SizedBox(),
                          //         // Initial Value
                          //         value: diabetetype,
                          //         hint: Text('select'),
                          //         isExpanded: true,
                          //         // Down Arrow Icon
                          //         icon: const Icon(Icons.keyboard_arrow_down,
                          //             color: colors.primary),
                          //
                          //         // Array list of items
                          //         items: diabetetypelist.map((String items) {
                          //           return DropdownMenuItem(
                          //             value: items,
                          //             child: Text("diabete type :- " + items),
                          //           );
                          //         }).toList(),
                          //
                          //         onChanged: (String? newValue) {
                          //           setState(() {
                          //             diabetetype = newValue ?? '';
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: h / 70,
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       child: SvgPicture.asset(
                          //         "assets/images/pet.svg",
                          //         height: 32,
                          //         width: 32,
                          //         color: Colors.black54,
                          //       ),
                          //     ),
                          //     SizedBox(width: w / 30),
                          //     GestureDetector(
                          //       onDoubleTap: () {
                          //         setState(() {
                          //           pet_account = 0;
                          //         });
                          //       },
                          //       onTap: () {
                          //         setState(() {
                          //           pet_account = 1;
                          //         });
                          //       },
                          //       child: Container(
                          //         width: w / 1.23,
                          //         height: h / 15,
                          //         padding: EdgeInsets.only(
                          //             top: 15, left: 10, right: 10, bottom: 5),
                          //         decoration: BoxDecoration(
                          //             color: pet_account == 1 ? colors.logosec : Colors.white,
                          //             borderRadius: BorderRadius.circular(10),
                          //             border: Border.all(color: colors.geryq1, width: 1)),
                          //         child: Text("This is a Pet Account"),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: h / 70,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  child: Icon(
                                Icons.email_rounded,
                                color: colors.geryq1,
                                size: 24,
                              )),
                              GestureDetector(
                                onDoubleTap: () {
                                  edit_cont.email_notify(0);
                                },
                                onTap: () {
                                  edit_cont.email_notify(1);
                                },
                                child: Obx(
                                  () => Container(
                                    width: w / 1.23,
                                    height: h / 15,
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        left: 10,
                                        right: 10,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                        color: edit_cont.emailnotifiy == 1
                                            ? colors.logosec
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: colors.geryq1, width: 1)),
                                    child: Text("Receive email notification"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          Obx(
                            () => edit_api.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: w / 1,
                                    height: h / 15,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff4c5df4))),
                                        onPressed: () async {
                                          edit_api.view_change(1);
                                          // Form1_edit(
                                          //   username.text.toString(),
                                          //         firstname.text.toString(),
                                          //         lastname.text.toString(),
                                          //         email.text.toString(),
                                          //         mobile.text.toString(),
                                          //         dropdownvalue.toString(),
                                          //         edit_cont.gender_name.toString(),
                                          //         datespick.toString(),
                                          //         edit_cont.emailnotifiy.toString(),
                                          //         edit_cont.image.toString()
                                          // );
                                          // edit_api.loader();
                                          // if (formKey.currentState!.validate()) {
                                          //   await edit_api.signup_api(
                                          //       username.text.toString(),
                                          //       firstname.text.toString(),
                                          //       lastname.text.toString(),
                                          //       email.text.toString(),
                                          //       mobile.text.toString(),
                                          //       dropdownvalue.toString(),
                                          //       edit_cont.gender_name.toString(),
                                          //       datespick.toString(),
                                          //       edit_cont.emailnotifiy.toString(),
                                          //       edit_cont.image.toString());
                                          //   //Get.to(Form1());
                                          // }
                                          // edit_api.loader_fa();
                                        },
                                        child: Text(
                                          "Next",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                          ),

                          SizedBox(
                            height: h / 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : edit_api.view == 1
                  ? SingleChildScrollView(
                      child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 15, bottom: 20),
                      child: Form(
                        key: formKey1,
                        child: Column(
                          children: [
                            SizedBox(
                              height: h / 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    child: Icon(
                                  CupertinoIcons.person_add,
                                  color: colors.geryq1,
                                  size: 24,
                                )),
                                Container(
                                  width: w / 1.23,
                                  height: h / 15,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    controller: doctor_code,
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "please enter Username";
                                    //   }
                                    //   return null;
                                    // },
                                    // keyboardType: keyType,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: colors.geryq1,
                                                width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: colors.geryq1)),
                                        hintText:
                                            "Add your doctor account code",
                                        labelText:
                                            "Add your doctor account code",
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                                // GestureDetector(
                                //   onTap: () {},
                                //   child: Container(
                                //     width: w / 1.23,
                                //     height: h / 15,
                                //     padding: EdgeInsets.only(
                                //         top: 15, left: 10, right: 10, bottom: 5),
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(10),
                                //         border: Border.all(color: colors.geryq1, width: 1)),
                                //     child: Text("Add your doctor Account Code"),
                                //   ),
                                // )
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.water_drop,
                                  color: colors.geryq1,
                                  size: 24,
                                )),
                                Container(
                                  width: w / 1.23,
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Obx(
                                    () {
                                      return DropdownButton(
                                        underline: const SizedBox(),
                                        // Initial Value
                                        value:
                                            unit_controller.diabetetype.value,
                                        hint: Text('select'),
                                        isExpanded: true,
                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: colors.primary),

                                        // Array list of items
                                        items:
                                            diabetetypelist.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                                "diabete type :- " + items),
                                          );
                                        }).toList(),

                                        onChanged: (String? newValue) {
                                          unit_controller.drop(newValue!);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: w / 2.6,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3)
                                      ],
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: colors.geryq1,
                                                  width: 1)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colors.geryq1)),
                                          hintText: 'Entre weight',
                                          labelText: 'weight',
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Text("Kg"),
                                  SizedBox(
                                    width: w / 35,
                                  ),
                                  Container(
                                    width: w / 2.6,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3)
                                      ],
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: colors.geryq1,
                                                  width: 1)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colors.geryq1)),
                                          hintText: 'Entre Height',
                                          labelText: 'Height',
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Text("Cm"),
                                ]),
                            SizedBox(
                              height: h / 50,
                            ),
                            Text("Activity factor",
                                style: TextStyle(color: colors.primary)),
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
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
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
                                    items: items1.map((String items) {
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
                              height: h / 50,
                            ),
                            Center(
                              child: Text("specify the unit of measurement",
                                  style: TextStyle(color: colors.primary)),
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: h / 20,
                                  width: w / 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: colors.logosec, width: 2)),
                                  child: Icon(
                                    Icons.done,
                                    color: colors.logosec,
                                  ),
                                ),
                                SizedBox(
                                  width: w / 40,
                                ),
                                Container(
                                  width: w / 1.24,
                                  height: h / 15,
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: colors.logosec,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Metric (kg,gram,ml,cm)"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: h / 20,
                            ),
                            Obx(() => edit_Form1_edit_user_api.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: w / 1,
                                    height: h / 15,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff4c5df4))),
                                        onPressed: () async {
                                          edit_Form1_edit_user_api
                                              .view_change(2);

                                          //signup_api.view_change(2);

                                          // edit_Form1_edit_user_api.loader();
                                          // if (formKey.currentState!.validate()) {
                                          //   await edit_Form1_edit_user_api.signup_user_Form1_edit(
                                          //       doctor_code.text.toString(),
                                          //       unit_controller.diabetetype.value.toString(),
                                          //       weight.text.toString(),
                                          //       height.text.toString(),
                                          //       dropdownvalue.toString());
                                          //   //Get.to(Form1_edit());
                                          // }
                                          // edit_Form1_edit_user_api.loader_fa();
                                          //Get.to(Form3());
                                        },
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                  )),
                          ],
                        ),
                      ),
                    ))
                  : edit_api.view == 2
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 15, bottom: 20),
                            child: Column(children: [
                              SizedBox(
                                height: h / 70,
                              ),
                              Center(
                                child: Text("what is your therapy",
                                    style: TextStyle(color: colors.primary)),
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(0);
                                    },
                                    child: Obx(() => Container(
                                          height: h / 20,
                                          width: w / 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: therapy_contoller
                                                              .noninsulin
                                                              .value ==
                                                          0
                                                      ? colors.logosec
                                                      : colors.geryq1,
                                                  width: 2)),
                                          child: therapy_contoller
                                                      .noninsulin.value ==
                                                  0
                                              ? Icon(
                                                  Icons.done,
                                                  color: colors.logosec,
                                                )
                                              : null,
                                        )),
                                  ),
                                  SizedBox(
                                    width: w / 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(0);
                                    },
                                    child: Obx(
                                      () => Container(
                                        width: w / 1.24,
                                        height: h / 15,
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            left: 10,
                                            right: 10,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color:
                                                therapy_contoller.noninsulin ==
                                                        0
                                                    ? colors.logosec
                                                    : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: colors.geryq1,
                                                width: 1)),
                                        child: Text("non-insulin"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(1);
                                    },
                                    child: Obx(
                                      () => Container(
                                        height: h / 20,
                                        width: w / 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: therapy_contoller
                                                            .noninsulin ==
                                                        1
                                                    ? colors.logosec
                                                    : colors.geryq1,
                                                width: 2)),
                                        child: therapy_contoller.noninsulin == 1
                                            ? Icon(
                                                Icons.done,
                                                color: colors.logosec,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(1);
                                    },
                                    child: Obx(
                                      () => Container(
                                        width: w / 1.24,
                                        height: h / 15,
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            left: 10,
                                            right: 10,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color:
                                                therapy_contoller.noninsulin ==
                                                        1
                                                    ? colors.logosec
                                                    : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: colors.geryq1,
                                                width: 1)),
                                        child: Text("multiple daily injection"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              Obx(() => therapy_contoller.noninsulin == 1
                                  ? Column(
                                      children: [
                                        Center(
                                          child: Text(
                                              "insulin pen dose increment",
                                              style: TextStyle(
                                                  color: colors.primary,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(0);
                                                  },
                                                  child: Container(
                                                    height: h / 20,
                                                    width: w / 15,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: therapy_contoller
                                                                        .multiplday ==
                                                                    0
                                                                ? colors.logosec
                                                                : colors.geryq1,
                                                            width: 2)),
                                                    child: therapy_contoller
                                                                .multiplday ==
                                                            0
                                                        ? Icon(
                                                            Icons.done,
                                                            color:
                                                                colors.logosec,
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 40,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(0);
                                                  },
                                                  child: Container(
                                                    width: w / 5,
                                                    height: h / 15,
                                                    padding: EdgeInsets.only(
                                                        top: 15,
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: therapy_contoller
                                                                    .multiplday ==
                                                                0
                                                            ? colors.logosec
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                colors.geryq1,
                                                            width: 1)),
                                                    child: Text("0.5"),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(1);
                                                  },
                                                  child: Container(
                                                    height: h / 20,
                                                    width: w / 15,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: therapy_contoller
                                                                        .multiplday ==
                                                                    1
                                                                ? colors.logosec
                                                                : colors.geryq1,
                                                            width: 2)),
                                                    child: therapy_contoller
                                                                .multiplday ==
                                                            1
                                                        ? Icon(
                                                            Icons.done,
                                                            color:
                                                                colors.logosec,
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 40,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(1);
                                                  },
                                                  child: Container(
                                                    width: w / 5,
                                                    height: h / 15,
                                                    padding: EdgeInsets.only(
                                                        top: 15,
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: therapy_contoller
                                                                    .multiplday ==
                                                                1
                                                            ? colors.logosec
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                colors.geryq1,
                                                            width: 1)),
                                                    child: Text("1.0"),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(2);
                                                  },
                                                  child: Container(
                                                    height: h / 20,
                                                    width: w / 15,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: therapy_contoller
                                                                        .multiplday ==
                                                                    2
                                                                ? colors.logosec
                                                                : colors.geryq1,
                                                            width: 2)),
                                                    child: therapy_contoller
                                                                .multiplday ==
                                                            2
                                                        ? Icon(
                                                            Icons.done,
                                                            color:
                                                                colors.logosec,
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 40,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    therapy_contoller.dose(2);
                                                  },
                                                  child: Container(
                                                    width: w / 5,
                                                    height: h / 15,
                                                    padding: EdgeInsets.only(
                                                        top: 15,
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: therapy_contoller
                                                                    .multiplday ==
                                                                2
                                                            ? colors.logosec
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                colors.geryq1,
                                                            width: 1)),
                                                    child: Text("non-insulin"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : Text("")),
                              Obx(() => therapy_contoller.noninsulin == 1
                                  ? SizedBox(
                                      height: h / 50,
                                    )
                                  : Text("")),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(2);
                                    },
                                    child: Obx(
                                      () => Container(
                                        height: h / 20,
                                        width: w / 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: therapy_contoller
                                                            .noninsulin ==
                                                        2
                                                    ? colors.logosec
                                                    : colors.geryq1,
                                                width: 2)),
                                        child: therapy_contoller.noninsulin == 2
                                            ? Icon(
                                                Icons.done,
                                                color: colors.logosec,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      therapy_contoller.insluin(2);
                                    },
                                    child: Obx(
                                      () => Container(
                                        width: w / 1.24,
                                        height: h / 15,
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            left: 10,
                                            right: 10,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color:
                                                therapy_contoller.noninsulin ==
                                                        2
                                                    ? colors.logosec
                                                    : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: colors.geryq1,
                                                width: 1)),
                                        child: Text("inulin pump"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h / 60,
                              ),
                              Obx(() => therapy_contoller.noninsulin == 2
                                  ? Row(
                                      children: [
                                        Container(
                                            child: Icon(
                                          Icons.add,
                                          color: colors.primary,
                                          size: 35,
                                        )),
                                        Container(
                                          width: w / 1.23,
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              left: 10,
                                              right: 10,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: colors.geryq1,
                                                  width: 1)),
                                          child: Obx(
                                            () => DropdownButton(
                                              underline: const SizedBox(),
                                              // Initial Value
                                              value: therapy_contoller
                                                  .insulinpumpother.value,
                                              hint: Text('select'),
                                              isExpanded: true,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: colors.primary),

                                              // Array list of items
                                              items: insulinpumpss
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                therapy_contoller
                                                    .dropd(newValue!);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text("")),
                              SizedBox(
                                height: h / 20,
                              ),
                              Obx(
                                () => signup_user_Form3_edit_api.isloading ==
                                        true
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container(
                                        width: w / 1,
                                        height: h / 15,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(0xff4c5df4))),
                                            onPressed: () async {
                                              signup_user_Form3_edit_api
                                                  .view_change(3);
                                              // signup_user_Form3_edit_api.loader();
                                              // therapy_contoller.noninsulin == 0
                                              //     ? await signup_user_Form3_edit_api
                                              //         .signup_user_Form3_edit_0(
                                              //             "multiple bdaily injections".toString(),
                                              //             therapy_contoller.dose_name.toString(),
                                              //             "insulin_pump".toString(),
                                              //             therapy_contoller.insulinpumpother.value
                                              //                 .toString(),
                                              //             "non insulin".toString())
                                              //     : therapy_contoller.noninsulin == 1
                                              //         ? await signup_user_Form3_edit_api
                                              //             .signup_user_Form3_edit_1(
                                              //                 "multiple bdaily injections"
                                              //                     .toString(),
                                              //                 therapy_contoller.dose_name
                                              //                     .toString(),
                                              //                 "insulin_pump".toString(),
                                              //                 therapy_contoller
                                              //                     .insulinpumpother.value
                                              //                     .toString(),
                                              //                 "non insulin".toString())
                                              //         : await signup_user_Form3_edit_api
                                              //             .signup_user_Form3_edit_2(
                                              //                 "multiple bdaily injections"
                                              //                     .toString(),
                                              //                 therapy_contoller.dose_name
                                              //                     .toString(),
                                              //                 "insulin_pump".toString(),
                                              //                 therapy_contoller
                                              //                     .insulinpumpother.value
                                              //                     .toString(),
                                              //                 "non insulin".toString());
                                              // //Get.to(Form1());
                                              //
                                              // signup_user_Form3_edit_api.loader_fa();
                                              // // signup_api.view_change(3);
                                              // Get.to(Form4(
                                              //   noninsulin: therapy_contoller.noninsulin,
                                              // ));
                                            },
                                            child: Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )),
                                      ),
                              ),
                            ]),
                          ),
                        )
                      : edit_api.view == 3
                          ? SingleChildScrollView(
                              child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 15, bottom: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                  Text("what medication do you ue?",
                                      style: TextStyle(color: colors.primary)),
                                  therapy_contoller.noninsulin == 1 ||
                                          therapy_contoller.noninsulin == 2
                                      ? SizedBox(
                                          height: h / 70,
                                        )
                                      : Text(""),
                                  therapy_contoller.noninsulin == 1 ||
                                          therapy_contoller.noninsulin == 2
                                      ? Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                  "Rapid/short acting insulin",
                                                  style: TextStyle(
                                                      color: colors.primary,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: h / 70,
                                            ),
                                            Container(
                                              width: w / 1,
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: colors.geryq1,
                                                      width: 1)),
                                              child: DropdownButton(
                                                underline: const SizedBox(),
                                                // Initial Value
                                                value: short,
                                                hint: Text('other'),
                                                isExpanded: true,
                                                // Down Arrow Icon
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: colors.primary),

                                                // Array list of items
                                                items:
                                                    rapidshortactinginsulin_data
                                                        .map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items),
                                                  );
                                                }).toList(),

                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    short = newValue ?? '';
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(""),
                                  therapy_contoller.noninsulin == 1 ||
                                          therapy_contoller.noninsulin == 2
                                      ? SizedBox(
                                          height: h / 70,
                                        )
                                      : Text(""),
                                  therapy_contoller.noninsulin == 1
                                      ? Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                  "intermediate/long acting insulin",
                                                  style: TextStyle(
                                                      color: colors.primary,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: h / 70,
                                            ),
                                            Container(
                                              width: w / 1,
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: colors.geryq1,
                                                      width: 1)),
                                              child: DropdownButton(
                                                underline: const SizedBox(),
                                                // Initial Value
                                                value: intermedia,
                                                hint: Text('other'),
                                                isExpanded: true,
                                                // Down Arrow Icon
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: colors.primary),

                                                // Array list of items
                                                items:
                                                    intermediatelong_actinginsulin_data
                                                        .map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items),
                                                  );
                                                }).toList(),

                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    intermedia = newValue ?? '';
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Text(""),
                                  therapy_contoller.noninsulin == 2
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                child: Icon(
                                              Icons.add,
                                              color: colors.geryq1,
                                              size: 24,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => Container(
                                                    height: h / 3,
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          "Add Basal"),
                                                      content: Container(
                                                        height: h / 3,
                                                        child: Column(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "medicine Name"),
                                                                Container(
                                                                  height:
                                                                      h / 20,
                                                                  width: w / 1,
                                                                  child: TextFormField(
                                                                      controller: medi_name_2,
                                                                      decoration: InputDecoration(
                                                                          // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                                          contentPadding: EdgeInsets.all(5),
                                                                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)))),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: h / 50),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "medicine dose"),
                                                                Container(
                                                                  height:
                                                                      h / 20,
                                                                  width: w / 1,
                                                                  child: TextFormField(
                                                                      controller:
                                                                          dose_2,
                                                                      decoration: InputDecoration(
                                                                          contentPadding: EdgeInsets.all(
                                                                              5),
                                                                          border:
                                                                              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)))),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: h / 50),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "medicine qty"),
                                                                Container(
                                                                  height:
                                                                      h / 20,
                                                                  width: w / 1,
                                                                  child: TextFormField(
                                                                      controller:
                                                                          qty_2,
                                                                      decoration: InputDecoration(
                                                                          contentPadding: EdgeInsets.all(
                                                                              5),
                                                                          border:
                                                                              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)))),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            medicines_con
                                                                .val11(1);
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Submit"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Obx(
                                                () => medicines_con
                                                            .val1.value ==
                                                        0
                                                    ? Container(
                                                        width: w / 1.23,
                                                        height: h / 13,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: colors
                                                                    .geryq1,
                                                                width: 1)),
                                                        child: Text("Basal"),
                                                      )
                                                    : Stack(
                                                        children: [
                                                          Container(
                                                            width: w / 1.23,
                                                            height: h / 10,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 5),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: colors
                                                                        .geryq1,
                                                                    width: 1)),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "medicine Name = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(medi_name_2
                                                                        .text
                                                                        .toString()),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "medicine dose   = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(dose_2
                                                                        .text
                                                                        .toString()),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "medicine qty      ="),
                                                                    SizedBox(
                                                                      width: w /
                                                                          40,
                                                                    ),
                                                                    Text(qty_2
                                                                        .text
                                                                        .toString()),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -1,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  medicines_con
                                                                      .val11(0);
                                                                },
                                                                icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Text(""),
                                  therapy_contoller.noninsulin == 1 ||
                                          therapy_contoller.noninsulin == 2
                                      ? SizedBox(
                                          height: h / 70,
                                        )
                                      : Text(""),
                                  Center(
                                    child: Text("medications",
                                        style: TextStyle(
                                            color: colors.primary,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // add medication
                                  SizedBox(
                                    height: h / 60,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: Icon(
                                        Icons.add,
                                        color: colors.geryq1,
                                        size: 24,
                                      )),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => Container(
                                              height: h / 3,
                                              child: AlertDialog(
                                                title: const Text(
                                                    "Add medication"),
                                                content: Container(
                                                  height: h / 3,
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("medicine Name"),
                                                          Container(
                                                            height: h / 20,
                                                            width: w / 1,
                                                            child: TextFormField(
                                                                controller:
                                                                    medi_name,
                                                                decoration: InputDecoration(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                5),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.black)))),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: h / 50),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("medicine dose"),
                                                          Container(
                                                            height: h / 20,
                                                            width: w / 1,
                                                            child: TextFormField(
                                                                controller:
                                                                    dose,
                                                                decoration: InputDecoration(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                5),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.black)))),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: h / 50),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("medicine qty"),
                                                          Container(
                                                            height: h / 20,
                                                            width: w / 1,
                                                            child: TextFormField(
                                                                controller: qty,
                                                                decoration: InputDecoration(
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                5),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.black)))),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      medicines_con.val22(1);
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text("Submit"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Obx(
                                          () => medicines_con.val2.value == 0
                                              ? Container(
                                                  width: w / 1.23,
                                                  height: h / 13,
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: colors.geryq1,
                                                          width: 1)),
                                                  child:
                                                      Text("Add medications"),
                                                )
                                              : Stack(
                                                  children: [
                                                    Container(
                                                      width: w / 1.23,
                                                      height: h / 10,
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color:
                                                                  colors.geryq1,
                                                              width: 1)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "medicine Name = "),
                                                              SizedBox(
                                                                width: w / 50,
                                                              ),
                                                              Text(medi_name
                                                                  .text
                                                                  .toString()),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "medicine dose   = "),
                                                              SizedBox(
                                                                width: w / 50,
                                                              ),
                                                              Text(dose.text
                                                                  .toString()),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "medicine qty      ="),
                                                              SizedBox(
                                                                width: w / 40,
                                                              ),
                                                              Text(qty.text
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -1,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            medicines_con
                                                                .val22(0);
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h / 20,
                                  ),
                                  Obx(() => signup_Form4_edit_user_api
                                              .isloading ==
                                          true
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Container(
                                          width: w / 1,
                                          height: h / 15,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xff4c5df4))),
                                              onPressed: () async {
                                                signup_Form4_edit_user_api
                                                    .view_change(4);
                                                // signup_Form4_edit_user_api.loader();
                                                // if(formKey.currentState!.validate()) {
                                                // await signup_Form4_edit_user_api.signup_user_Form4_edit(
                                                //     short.toString(),
                                                //     dose_2.text.toString(),
                                                //     qty_2.text.toString(),
                                                //     medi_name.text.toString(),
                                                //     dose.text.toString(),
                                                //     qty.text.toString(),
                                                //     medi_name_2.text.toString(),
                                                //     intermedia.toString());
                                                //   //Get.to(Form1());
                                                // }
                                                // signup_Form4_edit_user_api.loader_fa();
                                                //signup_api.view_change(4);
                                                //Get.to(Form5());
                                              },
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              )),
                                        )),
                                ],
                              ),
                            ))
                          : edit_api.view == 4
                              ? SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20,
                                        top: 15,
                                        bottom: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: h / 70,
                                        ),
                                        Center(
                                          child: Text(
                                              "Glucose level target range(mmol/l)",
                                              style: TextStyle(
                                                  color: colors.primary,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: h / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text("Hyperglycemia",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: h / 80),
                                                Container(
                                                  width: w / 3.5,
                                                  child: TextFormField(
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          4)
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1)),
                                                    ),
                                                    controller: hypogly_cemia,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: w / 80),
                                            Column(
                                              children: [
                                                Text("Glucose target",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: h / 80),
                                                Container(
                                                  width: w / 3.5,
                                                  child: TextFormField(
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          4)
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1)),
                                                    ),
                                                    controller: glucose_traget,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: w / 80),
                                            Column(
                                              children: [
                                                Text("Glucose hi",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: h / 80),
                                                Container(
                                                  width: w / 3.5,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          4)
                                                    ],
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1)),
                                                    ),
                                                    controller: glucose_hi,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text("glucose low",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: h / 80),
                                                Container(
                                                  width: w / 3.5,
                                                  child: TextFormField(
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          4)
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1)),
                                                    ),
                                                    controller: glucose,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("hypoglycemia",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: h / 80),
                                                Container(
                                                  width: w / 3.5,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          4)
                                                    ],
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: colors
                                                                      .geryq1)),
                                                    ),
                                                    controller: hypoglycemia,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                child: Icon(
                                              Icons.add,
                                              color: colors.geryq1,
                                              size: 24,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => Container(
                                                    height: h / 5,
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          "insulin senstivity(hourly)"),
                                                      content: Container(
                                                        height: h / 5,
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text("Time = "),
                                                                SizedBox(
                                                                    width:
                                                                        w / 50),
                                                                Text(DateTime
                                                                        .now()
                                                                    .toString()
                                                                    .substring(
                                                                        11,
                                                                        18)),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: h / 50),
                                                            Container(
                                                              height: h / 20,
                                                              width: w / 1,
                                                              child: TextFormField(
                                                                  inputFormatters: [
                                                                    LengthLimitingTextInputFormatter(
                                                                        10)
                                                                  ],
                                                                  controller:
                                                                      ratio,
                                                                  decoration: InputDecoration(
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      border: OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: Colors.black)))),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            glucose_con
                                                                .val11(1);
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Submit"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Obx(
                                                () => glucose_con.val1.value ==
                                                        0
                                                    ? Container(
                                                        width: w / 1.23,
                                                        height: h / 13,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: colors
                                                                    .geryq1,
                                                                width: 1)),
                                                        child: Text(
                                                            "insulin senstivity(hourly)"),
                                                      )
                                                    : Stack(
                                                        children: [
                                                          Container(
                                                            width: w / 1.23,
                                                            height: h / 10,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 5),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: colors
                                                                        .geryq1,
                                                                    width: 1)),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Time  = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(DateTime
                                                                            .now()
                                                                        .toString()
                                                                        .substring(
                                                                            11,
                                                                            18)),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "ratio   = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(ratio
                                                                        .text
                                                                        .toString()),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -1,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  glucose_con
                                                                      .val11(0);
                                                                },
                                                                icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                child: Icon(
                                              Icons.add,
                                              color: colors.geryq1,
                                              size: 24,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => Container(
                                                    height: h / 5,
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          "Carbohydrates ratio(hourly)"),
                                                      content: Container(
                                                        height: h / 5,
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(DateTime
                                                                        .now()
                                                                    .toString()
                                                                    .substring(
                                                                        11,
                                                                        18)),
                                                                Container(
                                                                  height:
                                                                      h / 20,
                                                                  width: w / 5,
                                                                  child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter(
                                                                            10)
                                                                      ],
                                                                      controller:
                                                                          ratio_2,
                                                                      decoration: InputDecoration(
                                                                          contentPadding: EdgeInsets.all(
                                                                              5),
                                                                          border:
                                                                              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)))),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            glucose_con
                                                                .val22(1);
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Submit"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Obx(
                                                () => glucose_con.val2.value ==
                                                        0
                                                    ? Container(
                                                        width: w / 1.23,
                                                        height: h / 13,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: colors
                                                                    .geryq1,
                                                                width: 1)),
                                                        child: Text(
                                                            "Carbohydrates ratio(hourly)"),
                                                      )
                                                    : Stack(
                                                        children: [
                                                          Container(
                                                            width: w / 1.23,
                                                            height: h / 10,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 5),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: colors
                                                                        .geryq1,
                                                                    width: 1)),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Time  = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(DateTime
                                                                            .now()
                                                                        .toString()
                                                                        .substring(
                                                                            11,
                                                                            18)),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "ratio   = "),
                                                                    SizedBox(
                                                                      width: w /
                                                                          50,
                                                                    ),
                                                                    Text(ratio_2
                                                                        .text
                                                                        .toString()),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -1,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  glucose_con
                                                                      .val22(0);
                                                                },
                                                                icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 20,
                                        ),
                                        Obx(
                                          () => edit_api.isloading == true
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : Container(
                                                  width: w / 1,
                                                  height: h / 15,
                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Color(
                                                                      0xff4c5df4))),
                                                      onPressed: () async {
                                                        edit_api.loader();
                                                        await edit_api
                                                            .update_profile(
                                                                username.text
                                                                    .toString(),
                                                                //1
                                                                firstname.text
                                                                    .toString(),
                                                                lastname.text
                                                                    .toString(),
                                                                email.text
                                                                    .toString(),
                                                                mobile.text
                                                                    .toString(),
                                                                dropdownvalue1
                                                                    .toString(),
                                                                edit_cont.gender_name
                                                                    .toString(),
                                                                datespick
                                                                    .toString(),
                                                                edit_cont
                                                                    .emailnotifiy
                                                                    .toString(),
                                                                edit_cont.image
                                                                    .toString(),
                                                                doctor_code.text
                                                                    .toString(),
                                                                //2
                                                                unit_controller
                                                                    .diabetetype
                                                                    .value
                                                                    .toString(),
                                                                weight.text
                                                                    .toString(),
                                                                height.text
                                                                    .toString(),
                                                                dropdownvalue
                                                                    .toString(),
                                                                "multiple bdaily injections"
                                                                    .toString(),
                                                                //3
                                                                therapy_contoller
                                                                    .dose_name
                                                                    .toString(),
                                                                "insulin_pump"
                                                                    .toString(),
                                                                therapy_contoller
                                                                    .insulinpumpother
                                                                    .value
                                                                    .toString(),
                                                                "non insulin"
                                                                    .toString(),
                                                                short
                                                                    .toString(),
                                                                //4
                                                                dose_2.text
                                                                    .toString(),
                                                                qty_2.text
                                                                    .toString(),
                                                                medi_name.text
                                                                    .toString(),
                                                                dose.text
                                                                    .toString(),
                                                                qty.text
                                                                    .toString(),
                                                                medi_name_2.text
                                                                    .toString(),
                                                                intermedia
                                                                    .toString(),
                                                                hypogly_cemia
                                                                    .text
                                                                    .toString(),
                                                                //5
                                                                glucose_traget.text
                                                                    .toString(),
                                                                glucose_hi.text
                                                                    .toString(),
                                                                glucose.text
                                                                    .toString(),
                                                                hypoglycemia.text
                                                                    .toString(),
                                                                ratio.text
                                                                    .toString(),
                                                                ratio_2.text
                                                                    .toString(),
                                                                time.text
                                                                    .toString(),
                                                                time2.text
                                                                    .toString());
                                                        glucose_con.val11(0);
                                                        glucose_con.val22(0);
                                                        medicines_con.val11(0);
                                                        //Utils().alertbox('Please upload all field & all photo');
                                                        edit_api.view_change(0);
                                                        edit_api.loader_fa();
                                                        edit_api.view_change(0);
                                                      },
                                                      child: Text(
                                                        "Next",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Text("");
        },
      ),
    );
  }

  String? intermedia;
  String? short;
  //final signup_api = Get.put(Signup_user());
  final signup_Form4_edit_user_api = Get.put(Update_profile_user());
  final medicines_con = Get.put(Medicined__edit_controller());
  final glucose_con = Get.put(gulcoselevel_edit_controller());
  final formKey1 = GlobalKey<FormState>();
  final unit_controller = Get.put(Unit_edit_con());
  final edit_Form1_edit_user_api = Get.put(Update_profile_user());
  final dropdown_user_me_list = Get.put(Dropdown_user_me_list());
  final signup_user_Form3_edit_api = Get.put(Update_profile_user());
  String dropdownvalue =
      user_deatils2.elementAt(0).data!.activityFactor.toString();
  String dropdownvalue1 = user_deatils2.elementAt(0).data!.address.toString();
  String diabetetype =
      user_deatils2.elementAt(0).data!.diabetesTypes.toString();
  var datespick = user_deatils2.elementAt(0).data!.dob.toString();

  bool? value1 = false;

  TextEditingController mobile = TextEditingController(
      text: user_deatils2.elementAt(0).data!.mobile.toString());
  TextEditingController username = TextEditingController(
      text: user_deatils2.elementAt(0).data!.userName.toString());
  TextEditingController firstname = TextEditingController(
      text: user_deatils2.elementAt(0).data!.firstName.toString());
  TextEditingController lastname = TextEditingController(
      text: user_deatils2.elementAt(0).data!.lastName.toString());
  TextEditingController email = TextEditingController(
      text: user_deatils2.elementAt(0).data!.email.toString());
  TextEditingController weight = TextEditingController(
      text: user_deatils2.elementAt(0).data!.weight.toString());
  TextEditingController height = TextEditingController(
      text: user_deatils2.elementAt(0).data!.height.toString());
  TextEditingController doctor_code = TextEditingController(
      text: user_deatils2.elementAt(0).data!.referralCode.toString());
  TextEditingController hypogly_cemia = TextEditingController(
      text: user_deatils2.elementAt(0).data!.hyperglycemia.toString());
  TextEditingController glucose_traget = TextEditingController(
      text: user_deatils2.elementAt(0).data!.glucoseTargets.toString()
  );
  TextEditingController glucose_hi = TextEditingController(  text: user_deatils2.elementAt(0).data!.glucoseHigh.toString());
  TextEditingController glucose = TextEditingController(  text: user_deatils2.elementAt(0).data!.glucoseLow.toString());
  TextEditingController hypoglycemia = TextEditingController(  text: user_deatils2.elementAt(0).data!.hyperglycemia.toString());
  TextEditingController ratio = TextEditingController(  text: user_deatils2.elementAt(0).data!.ratio.toString());
  TextEditingController ratio_2 = TextEditingController(  text: user_deatils2.elementAt(0).data!.ratio2.toString());
  TextEditingController time = TextEditingController(  text: user_deatils2.elementAt(0).data!.time.toString());
  TextEditingController time2 = TextEditingController(  text: user_deatils2.elementAt(0).data!.time2.toString());
  TextEditingController dose = TextEditingController(  text: user_deatils2.elementAt(0).data!.dose.toString());
  TextEditingController qty = TextEditingController(  text: user_deatils2.elementAt(0).data!.qty.toString());
  TextEditingController medi_name = TextEditingController(  text: user_deatils2.elementAt(0).data!.mediName.toString());
  TextEditingController dose_2 = TextEditingController(  text: user_deatils2.elementAt(0).data!.dose2.toString());
  TextEditingController qty_2 = TextEditingController(  text: user_deatils2.elementAt(0).data!.qty2.toString());
  TextEditingController medi_name_2 = TextEditingController(  text: user_deatils2.elementAt(0).data!.mediName2.toString());
  List<String> items1 = [
    'Little or no exercise',
    'sport 1-3 days/week',
    'sport 3-5 days/week',
    'sport 6-7 days/week',
    'Sport and physical job',
  ];

  void datepicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2500, 1, 1), onChanged: (date) {
      setState(() {
        datespick = date.toString().substring(0, 10);
      });
      print(datespick);
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        datespick = date.toString().substring(0, 10);
      });
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
    // var date = DatePickerDialog(
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime(2500));
  }
}
