import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/edit_user_profile/form_edit/thearpy/therapy_controller.dart';

import '../../../../../utils/color.dart';
import '../../../api_controller_user/get_dropdown_list.dart';
import '../../../api_controller_user/signup_api.dart';
import '../../../api_controller_user/update_api.dart';

class Form3_edit extends StatefulWidget {
  const Form3_edit(String username, firstname, lastname, email, mobile,
      dropdownvalue, gender_name, datespick, emailnotifiy, image,
      {super.key});

  @override
  State<Form3_edit> createState() => _Form3_editState();
}

class _Form3_editState extends State<Form3_edit> {
  final therapy_contoller = Get.put(Therapy_edit_controller());
  final dropdown_user_me_list = Get.put(Dropdown_user_me_list());
  final signup_api = Get.put(Signup_user());
  final signup_user_Form3_edit_api = Get.put(Update_profile_user());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
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
                              color: therapy_contoller.noninsulin.value == 0
                                  ? colors.logosec
                                  : colors.geryq1,
                              width: 2)),
                      child: therapy_contoller.noninsulin.value == 0
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
                  // setState(() {
                  //   noninsulin = 0;
                  // });
                },
                child: Obx(
                  () => Container(
                    width: w / 1.24,
                    height: h / 15,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: therapy_contoller.noninsulin == 0
                            ? colors.logosec
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
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
                            color: therapy_contoller.noninsulin == 1
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
                  // setState(() {
                  //   noninsulin = 1;
                  // });
                },
                child: Obx(
                  () => Container(
                    width: w / 1.24,
                    height: h / 15,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: therapy_contoller.noninsulin == 1
                            ? colors.logosec
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
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
                      child: Text("insulin pen dose increment",
                          style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                therapy_contoller.dose(0);
                                // setState(() {
                                //   multiplday = 0;
                                // });
                              },
                              child: Container(
                                height: h / 20,
                                width: w / 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: therapy_contoller.multiplday == 0
                                            ? colors.logosec
                                            : colors.geryq1,
                                        width: 2)),
                                child: therapy_contoller.multiplday == 0
                                    ? Icon(
                                        Icons.done,
                                        color: colors.logosec,
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
                                    top: 15, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    color: therapy_contoller.multiplday == 0
                                        ? colors.logosec
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colors.geryq1, width: 1)),
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
                                        color: therapy_contoller.multiplday == 1
                                            ? colors.logosec
                                            : colors.geryq1,
                                        width: 2)),
                                child: therapy_contoller.multiplday == 1
                                    ? Icon(
                                        Icons.done,
                                        color: colors.logosec,
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
                                    top: 15, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    color: therapy_contoller.multiplday == 1
                                        ? colors.logosec
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colors.geryq1, width: 1)),
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
                                        color: therapy_contoller.multiplday == 2
                                            ? colors.logosec
                                            : colors.geryq1,
                                        width: 2)),
                                child: therapy_contoller.multiplday == 2
                                    ? Icon(
                                        Icons.done,
                                        color: colors.logosec,
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
                                    top: 15, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    color: therapy_contoller.multiplday == 2
                                        ? colors.logosec
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colors.geryq1, width: 1)),
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
                            color: therapy_contoller.noninsulin == 2
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
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: therapy_contoller.noninsulin == 2
                            ? colors.logosec
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
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
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: Obx(
                        () => DropdownButton(
                          underline: const SizedBox(),
                          // Initial Value
                          value: therapy_contoller.insulinpumpother.value,
                          hint: Text('select'),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: colors.primary),

                          // Array list of items
                          items: insulinpumpss.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            therapy_contoller.dropd(newValue!);
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
            () => signup_user_Form3_edit_api.isloading == true
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
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff4c5df4))),
                        onPressed: () async {
                          signup_user_Form3_edit_api.view_change(3);
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
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                  ),
          ),
        ]),
      ),
    );
  }

// var noninsulin = 0;
// var multiplday = 0;
// var insulinpump = 0;
// String? insulinpumpother;
// List<String> itemsm = [
//   'other',
//   'medtronic',
//   'sooil',
//   'v-go',
//   'insulet',
// ];
}
