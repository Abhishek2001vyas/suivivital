import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                add_reminder();
              },
              icon: Icon(
                Icons.alarm_add,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                more_alert();
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Reminder", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: h / 20,
                width: w / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.logosec,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "One - Time Reminder",
                      style: TextStyle(color: Colors.white),
                    ),
                    // Text(
                    //   style: TextStyle(color: Colors.white),
                    //   "  " + DateTime.now().weekday.toString(),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: h / 20,
                    width: w / 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.geryq1, width: 2)),
                    // child: carbo_unit == 3
                    //     ? Icon(
                    //         Icons.done,
                    //         color: colors.logosec,
                    //       )
                    //     : null,
                  ),
                ),
                SizedBox(
                  width: w / 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: w / 1.3,
                    height: h / 20,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lunch Reminder",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            TimeOfDay.now().hour.toString() +
                                ":" +
                                TimeOfDay.now().minute.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 50,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(width: w / 10),
                  Text(DateTime.now().toString().substring(0, 10),
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void add_reminder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Add reminder'),
            content: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.alarm_add, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              addition_reminder();
                            },
                            child: Text("Lunch reminder")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm_add, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              addition_reminder();
                            },
                            child: Text("diner reminder")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm_add, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              addition_reminder();
                            },
                            child: Text("one time reminder")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm_add, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              addition_reminder();
                            },
                            child: Text("recurrent reminder")),
                      ],
                    ),
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  void more_alert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('more'),
            content: SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.edit, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("edit reminder")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.delete, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("delete reminder")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.clear_all, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("delete all reminder")),
                      ],
                    ),
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  void addition_reminder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Add one- time reminder'),
            content: SizedBox(
                height: 300,
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Title :- "),
                        Container(width: 170, child: TextFormField())
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            datepicker();
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffececec),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(DateTime.now()
                                    .toString()
                                    .substring(0, 10))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            timepicker();
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffececec),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(TimeOfDay.now()
                                    .toString()
                                    .substring(10, 15))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              carbo_unit = 0;
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: carbo_unit == 0
                                        ? colors.logosec
                                        : colors.geryq1,
                                    width: 2)),
                            child: carbo_unit == 0
                                ? Icon(
                                    Icons.done,
                                    size: 18,
                                    color: colors.logosec,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              carbo_unit = 0;
                            });
                          },
                          child: Container(
                            width: 95,
                            height: 30,
                            decoration: BoxDecoration(
                              color: carbo_unit == 0
                                  ? colors.logosec
                                  : Color(0xffececec),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text("SI Unit")),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              carbo_unit = 1;
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: carbo_unit == 1
                                        ? colors.logosec
                                        : colors.geryq1,
                                    width: 2)),
                            child: carbo_unit == 1
                                ? Icon(
                                    Icons.done,
                                    size: 18,
                                    color: colors.logosec,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              carbo_unit = 1;
                            });
                          },
                          child: Container(
                            width: 95,
                            height: 30,
                            decoration: BoxDecoration(
                              color: carbo_unit == 1
                                  ? colors.logosec
                                  : Color(0xffececec),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text("US Unit")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 270,
                          padding: EdgeInsets.only(
                              top: 5, left: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xffececec),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            // Initial Value
                            value: CGM,
                            hint: Text('Aalarm - sound'),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black),

                            // Array list of items
                            items: Cgm.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),

                            onChanged: (String? newValue) {
                              setState(() {
                                CGM = newValue ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 270,
                          padding: EdgeInsets.only(
                              top: 5, left: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xffececec),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            // Initial Value
                            value: tim,
                            hint: Text('Ringtone - sound'),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black),

                            // Array list of items
                            items: Time.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),

                            onChanged: (String? newValue) {
                              setState(() {
                                tim = newValue ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  var carbo_unit = 0;
  List<String> Time = [
    'Before Exercise',
    'After Exercise',
  ];
  String? CGM;
  String? tim;
  List<String> Cgm = [
    'None',
    'Abbott',
    'Eversense',
    'dexcom g6@',
    'other',
  ];
  var datespick = DateTime.now().toString().substring(0, 10);
  TimeOfDay time = TimeOfDay.now();

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
    // var date = DatePickerDialog(
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime(2500));
  }

  timepicker() async {
    TimeOfDay? time2 =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time = time2!;
    });
  }
}
