import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suivivital/utils/color.dart';
import 'package:suivivital/view/user/history/history.dart';

import '../../custom_widget/text_filled.dart';
import 'api_controller_user/booking_time.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'home/home1.dart';

class Patients_details extends StatefulWidget {
  final doctorid;
  final cons_fee;
  final dates;
  final booktime;

  const Patients_details(
      {super.key, this.cons_fee, this.dates, this.booktime, this.doctorid});

  @override
  State<Patients_details> createState() => _Patients_detailsState();
}

class _Patients_detailsState extends State<Patients_details> {
  final add_prescription_api = Get.put(Book_time_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          title: Text(
            "Patient Details",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              TextFilled(
                controller: firstname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter First name";
                  }
                  return null;
                },
                limitno: 50,
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
                limitno: 50,
                keyType: TextInputType.name,
                hindtext: 'Entre full name',
                labeltext: 'Last name',
              ),
              SizedBox(
                height: h / 70,
              ),
              TextFilled(
                limitno: 10,
                controller: mobile,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter Mobile no";
                  }
                  return null;
                },
                keyType: TextInputType.number,
                hindtext: 'Entre full mobile',
                labeltext: 'Mobile no',
              ),
              SizedBox(
                height: h / 70,
              ),
              TextFilled(
                limitno: 50,
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter email";
                  }
                  return null;
                },
                keyType: TextInputType.emailAddress,
                hindtext: 'Entre email',
                labeltext: 'email',
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      width: w / 2.4,
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1),
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // Initial Value
                        value: age,
                        hint: Text('age'),
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),

                        // Array list of items
                        items: agel.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            age = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      width: w / 2.4,
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1),
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // Initial Value
                        value: cate,
                        hint: Text('gender'),
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),

                        // Array list of items
                        items: catea.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            cate = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Container(
                width: w / 1,
                child: TextFormField(
                  controller: problem,
                  decoration: InputDecoration(
                      hintText: "write your problem",
                      labelText: "write your problem",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.geryq1, width: 1))),
                  maxLines: 5,
                ),
              ),
              SizedBox(
                height: h / 6,
              ),
              Obx(
                () => add_prescription_api.isloading.value == true
                    ? const Center(
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
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff4c5df4))),
                            onPressed: () async {
                              var format = DateFormat('dd-MM-yyyy');
                              var dateString = format.format(widget.dates);
                              add_prescription_api.loader();
                              await add_prescription_api.bookappointment(
                                  widget.doctorid,
                                  firstname.text.toString(),
                                  lastname.text.toString(),
                                  mobile.text.toString(),
                                  email.text.toString(),
                                  age.toString(),
                                  cate.toString(),
                                  problem.text.toString(),
                                  widget.cons_fee,
                                  dateString.toString());
                              congr();
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController problem = TextEditingController();
  List<String> catea = ['male', 'female', "other"];
  List<String> agel = [
    '1-5 year',
    '5-10 year',
    '10-20 year',
    '20-50 year',
    '50+ year',
  ];
  String? cate;
  String? age;

  void congr() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            content: SizedBox(
                height: 300,
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child:
                            Image.asset("assets/images/qwer12.png", scale: 4)),
                    SizedBox(height: 15),
                    Text(
                        "your appointment booking completed Dr.${details.elementAt(0)[0]["name"]} will contact you soon",
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, size: 18, color: Colors.grey),
                            SizedBox(
                                width: 100,
                                child: Text(
                                    " ${bookappoint_details.elementAt(0)["first_name"]}"))
                          ],
                        ),
                        // SizedBox(
                        //   width: 65,
                        // ),
                        Row(
                          children: [
                            Icon(Icons.account_balance_wallet,
                                size: 18, color: Colors.grey),
                            Text(
                                "CFA ${bookappoint_details.elementAt(0)["consultation_fees"]}")
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                size: 18, color: Colors.grey),
                            SizedBox(
                                width: 100,
                                child: Text(
                                    "${bookappoint_details.elementAt(0)["date"]}"))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.clock,
                                size: 18, color: Colors.grey),
                            Text(
                                " ${bookappoint_details.elementAt(0)["booking_time"]}")
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.to(History());
                },
                child: Text('See appointment'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.to(Home1());
                },
                child: Text('Home'),
              ),
            ],
          ),
        );
      },
    );
  }
}
