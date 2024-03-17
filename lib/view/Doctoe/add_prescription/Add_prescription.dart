import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/Doctoe/prescription.dart';
import '../../../custom_widget/button.dart';
import '../../../custom_widget/text_filled.dart';
import '../../../custom_widget/timeformed.dart';
import '../../../utils/color.dart';
import '../api_controller/add_prescription_api.dart';
import 'add_prescription_controller.dart';

class Add_prescription extends StatefulWidget {
  const Add_prescription({super.key,});

  @override
  State<Add_prescription> createState() => _Add_prescriptionState();
}

class _Add_prescriptionState extends State<Add_prescription> {
  final add_prescription_controller = Get.put(Add_prescription_controller());
  final add_prescription_apic = Get.put(add_prescription_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: const Text(
          "Add medicines",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFilled(
                controller: medicines_name,
                hindtext: "medicines name",
                keyType: TextInputType.name,
                labeltext: "medicines name",
              ),
              SizedBox(height: h / 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  resizetextfilled(
                    wi: 2.3,
                    dose: dose,
                    hinttext: "medicines dose",
                    labeltext: "medicines dose",
                    keyType: TextInputType.number,
                  ),
                  resizetextfilled(
                    keyType: TextInputType.name,
                    wi: 2.3,
                    dose: brand_name,
                    hinttext: "medicines brand name",
                    labeltext: "medicines brand name",
                  ),
                ],
              ),
              SizedBox(height: h / 70),
              Text(
                "Consumption Rule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: h / 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  time_for_med(
                    tap: () {
                      add_prescription_controller.mae1(0, "Morning");
                    },
                    hi: 15,
                    wi: 3.5,
                    changeno: 0,
                    text: "Morning",
                  ),
                  time_for_med(
                    text: "Aftermoon",
                    changeno: 1,
                    hi: 15,
                    tap: () {
                      add_prescription_controller.mae1(1, "Aftermoon");
                    },
                    wi: 3.5,
                  ),
                  time_for_med(
                    text: "evening",
                    changeno: 2,
                    hi: 15,
                    tap: () {
                      add_prescription_controller.mae1(2, "evening");
                    },
                    wi: 3.5,
                  ),
                ],
              ),
              SizedBox(height: h / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.eating1(0, "Before eating");
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Obx(
                            () =>
                            Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.eating == 0
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("Before eating",
                                    style: TextStyle(
                                      color: add_prescription_controller
                                          .eating == 0
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.eating1(1, "After eating");
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Obx(
                            () =>
                            Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.eating == 1
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("After eating",
                                    style: TextStyle(
                                      color: add_prescription_controller
                                          .eating == 1
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(0, "Sun");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 0
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("Sun",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                          add_prescription_controller.shift == 0
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(1, "mon");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 1
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("mon",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                        add_prescription_controller.shift == 1
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(2, "tue");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 2
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("tue",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                        add_prescription_controller.shift == 2
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(3, "wed");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 3
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("wed",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                          add_prescription_controller.shift == 3
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(4, "thu");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 4
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("thu",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                          add_prescription_controller.shift == 4
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(5, "fri");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 5
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("fri",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                          add_prescription_controller.shift == 5
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(6, "sat");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 6
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("sat",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                        add_prescription_controller.shift == 6
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.shift1(7, "all");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color: add_prescription_controller.shift == 07
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("all",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                          add_prescription_controller.shift == 7
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.blad1(0, "Breakfast");
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Obx(
                            () =>
                            Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.blad == 0
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("Breakfast",
                                    style: TextStyle(
                                      color: add_prescription_controller.blad ==
                                          0
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.blad1(1, "lunch");
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Obx(
                            () =>
                            Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.blad == 1
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("lunch",
                                    style: TextStyle(
                                      color: add_prescription_controller.blad ==
                                          1
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.blad1(2, "Aftermoon");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.blad == 2
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("Aftermoon",
                                    style: TextStyle(
                                      color: add_prescription_controller.blad ==
                                          2
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      add_prescription_controller.blad1(3, "Dinner");
                    },
                    child: Obx(
                          () =>
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: add_prescription_controller.blad == 3
                                    ? Color(0xff6e7bf6)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: h / 15,
                              width: w / 2.3,
                              child: Center(
                                child: Text("Dinner",
                                    style: TextStyle(
                                      color: add_prescription_controller.blad ==
                                          3
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  resizetextfilled(
                      labeltext: "medicines day use",
                      keyType: TextInputType.number,
                      hinttext: "medicines day use",
                      dose: day_use,
                      wi: 2.3),
                  SizedBox(
                    width: 20,
                  ),
                  Text(" Days")
                ],
              ),
              SizedBox(height: h / 70),
              Container(
                width: w / 1,
                child: TextFormField(
                  maxLines: 2,
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  controller: Comment,
                  //validator: validator,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: colors.geryq1, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors.geryq1)),
                      hintText: "Comment",
                      labelText: "Comment",
                      labelStyle: TextStyle()),
                ),
              ),
              SizedBox(height: h / 30),
              Obx(() =>
              add_prescription_apic.isloading == true ?
              Center(child: CircularProgressIndicator(),) :
              Button_widget(
                buttontext: "Done",
                onpressed: () async {
                  await add_prescription_apic.add_prescription(
                      medicines_name.text.toString(),
                      dose.text.toString(),
                      brand_name.text.toString(),
                      add_prescription_controller.mae2.value.toString(),
                      add_prescription_controller.eating2.value.toString(),
                      add_prescription_controller.shift2.value.toString(),
                      add_prescription_controller.blad2.value.toString(),
                      day_use.text.toString(),
                      Comment.text.toString()
                  );
                  // Get.to(Prescription());
                },
                button_height: 15,
                button_width: 1,
              ),),


              SizedBox(height: h / 30),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController medicines_name = TextEditingController();
  TextEditingController dose = TextEditingController();
  TextEditingController brand_name = TextEditingController();
  TextEditingController day_use = TextEditingController();
  TextEditingController Comment = TextEditingController();
}
