//import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../../../utils/color.dart';
import '../Nav_bar_usser.dart';

class Log_entry extends StatefulWidget {
  const Log_entry({super.key});

  @override
  State<Log_entry> createState() => _Log_entryState();
}

class _Log_entryState extends State<Log_entry> {
  var mdb = 0;

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
              onPressed: () {},
              icon: Icon(
                Icons.note_alt_outlined,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.grid_view_outlined,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
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
        title: Text("Log Entry", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        mdb = 0;
                      });
                    },
                    child: Text(
                      "Main",
                      style: TextStyle(
                          color: mdb == 0 ? colors.primary : Colors.grey),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        mdb = 1;
                      });
                    },
                    child: Text(
                      "Additional",
                      style: TextStyle(
                          color: mdb == 1 ? colors.primary : Colors.grey),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        mdb = 2;
                      });
                    },
                    child: Text(
                      "laboratory ",
                      style: TextStyle(
                          color: mdb == 2 ? colors.primary : Colors.grey),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 2,
                    width: w / 03,
                    color: mdb == 0 ? colors.primary : Colors.grey),
                Container(
                  height: 2,
                  width: w / 03,
                  color: mdb == 1 ? colors.primary : Colors.grey,
                ),
                Container(
                    height: 2,
                    width: w / 03,
                    color: mdb == 2 ? colors.primary : Colors.grey),
              ],
            ),
            mdb == 0
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 15, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                datepicker();
                              },
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Date'),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                                onTap: () {
                                  datepicker();
                                },
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey, width: 2))),
                                    child: Text(
                                      datespick.toString().substring(0, 10),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                datepicker();
                              },
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Time'),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                                onTap: () {
                                  timepicker();
                                },
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey, width: 2))),
                                    child: Text(
                                      time.toString(),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.category_outlined,
                              color: colors.geryq1,
                              size: 25,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                color: Color(0xffececec),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                // Initial Value
                                value: cate,
                                hint: Text('Category'),
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
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Glucose'),
                                    Icon(Icons.add),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: w / 9,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      keyboardType: TextInputType.number,
                                    )),
                                Text("  mmol/l")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.apple,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('carb'),
                                    Icon(Icons.add),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: w / 9,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      keyboardType: TextInputType.number,
                                    )),
                                Text("  grams")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.medication_sharp,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('None'),
                                    Icon(Icons.add),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: w / 9,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration:
                                          InputDecoration(hintText: "00"),
                                    )),
                                Text("  u")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.medication_rounded,
                              color: Colors.grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: h / 20,
                                width: w / 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(5),
                                  //border: Border.all(color: colors.logosec)
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Basal rate'),
                                    Icon(Icons.add),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: w / 9,
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      keyboardType: TextInputType.number,
                                    )),
                                Text("  U/hour")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.medication_rounded,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: w / 1.23,
                                height: h / 15,
                                padding: EdgeInsets.only(
                                    top: 8, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Color(0xffececec),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Medications"),
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.notification_add,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                color: Color(0xffececec),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                // Initial Value
                                value: rem,
                                hint: Text('reminder'),
                                isExpanded: true,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),

                                // Array list of items
                                items: rema.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text("reminder :- " + items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    rem = newValue ?? '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: w / 80,
                            ),
                            Text("Add Photo")
                          ],
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.note_add_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: w / 80,
                            ),
                            Text("Notes")
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Container(
                          width: w,
                          child: TextFormField(
                              maxLines: 9,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)))),
                        )
                      ],
                    ),
                  )
                : mdb == 1
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 15, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    datepicker();
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 2,
                                    child: Container(
                                      height: h / 20,
                                      width: w / 3.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius: BorderRadius.circular(5),
                                        //border: Border.all(color: colors.logosec)
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('Date'),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      datepicker();
                                    },
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2))),
                                        child: Text(
                                          datespick.toString().substring(0, 10),
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.clock,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    datepicker();
                                  },
                                  child: Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: h / 20,
                                      width: w / 3.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius: BorderRadius.circular(5),
                                        //border: Border.all(color: colors.logosec)
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('Time'),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      timepicker();
                                    },
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2))),
                                        child: Text(
                                          time.toString(),
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.monitor_weight_outlined,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Material(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 2,
                                    child: Container(
                                      height: h / 20,
                                      width: w / 3.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius: BorderRadius.circular(5),
                                        //border: Border.all(color: colors.logosec)
                                      ),
                                      child: Center(child: Text('weight')),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 40,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: w / 9,
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4)
                                          ],
                                          keyboardType: TextInputType.number,
                                        )),
                                    Text("  kg")
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.medication_rounded,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: h / 20,
                                      width: w / 3.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius: BorderRadius.circular(5),
                                        //border: Border.all(color: colors.logosec)
                                      ),
                                      child: Center(child: Text('ketones')),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 40,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: w / 9,
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4)
                                          ],
                                          keyboardType: TextInputType.number,
                                        )),
                                    Text("  mmol/l")
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 190.0),
                                  child: Icon(
                                    Icons.monitor_heart_rounded,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(width: w / 80),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: w / 1.3,
                                    height: h / 04,
                                    child: Row(
                                      children: [
                                        SizedBox(width: w / 50),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Blood pressure"),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Systolic')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmhg")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Diastolic')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmhg")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Pulse')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  bpm")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ]),
                                        ),
                                      ],
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
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 190.0),
                                  child: Icon(
                                    Icons.sports_gymnastics,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(width: w / 80),
                                Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: w / 1.3,
                                    height: h / 04,
                                    child: Row(
                                      children: [
                                        SizedBox(width: w / 50),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Physical activity"),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: h / 20,
                                                      width: w / 3.5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffececec),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        //border: Border.all(color: colors.logosec)
                                                      ),
                                                      child: Center(
                                                          child:
                                                              Text('Exericse')),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: w / 2.6,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: DropdownButton(
                                                            underline:
                                                                const SizedBox(),
                                                            // Initial Value
                                                            value: act,
                                                            hint:
                                                                Text('select'),
                                                            isExpanded: true,
                                                            // Down Arrow Icon
                                                            icon: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color: Colors
                                                                    .black),

                                                            // Array list of items
                                                            items: acti.map(
                                                                (String items) {
                                                              return DropdownMenuItem(
                                                                value: items,
                                                                child:
                                                                    Text(items),
                                                              );
                                                            }).toList(),

                                                            onChanged: (String?
                                                                newValue) {
                                                              setState(() {
                                                                act =
                                                                    newValue ??
                                                                        '';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: h / 20,
                                                        width: w / 3.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffececec),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          //border: Border.all(color: colors.logosec)
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                                'comment')),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 3,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: h / 20,
                                                        width: w / 3.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffececec),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          //border: Border.all(color: colors.logosec)
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                                'Duration')),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mm")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 15, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    datepicker();
                                  },
                                  child: Container(
                                    height: h / 20,
                                    width: w / 3.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xffececec),
                                      borderRadius: BorderRadius.circular(5),
                                      //border: Border.all(color: colors.logosec)
                                    ),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Date'),
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      datepicker();
                                    },
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2))),
                                        child: Text(
                                          datespick.toString().substring(0, 10),
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.clock,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    datepicker();
                                  },
                                  child: Container(
                                    height: h / 20,
                                    width: w / 3.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xffececec),
                                      borderRadius: BorderRadius.circular(5),
                                      //border: Border.all(color: colors.logosec)
                                    ),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Time'),
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      timepicker();
                                    },
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2))),
                                        child: Text(
                                          time.toString(),
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      carbo_unit = 0;
                                    });
                                  },
                                  child: Container(
                                    height: h / 20,
                                    width: w / 15,
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
                                    setState(() {
                                      carbo_unit = 0;
                                    });
                                  },
                                  child: Container(
                                    width: w / 2.9,
                                    height: h / 15,
                                    decoration: BoxDecoration(
                                      color: carbo_unit == 0
                                          ? colors.logosec
                                          : Color(0xffececec),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("SI Unit")),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      carbo_unit = 1;
                                    });
                                  },
                                  child: Container(
                                    height: h / 20,
                                    width: w / 15,
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
                                    setState(() {
                                      carbo_unit = 1;
                                    });
                                  },
                                  child: Container(
                                    width: w / 2.9,
                                    height: h / 15,
                                    decoration: BoxDecoration(
                                      color: carbo_unit == 1
                                          ? colors.logosec
                                          : Color(0xffececec),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("US Unit")),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.water_drop,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: h / 20,
                                    width: w / 3.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xffececec),
                                      borderRadius: BorderRadius.circular(5),
                                      //border: Border.all(color: colors.logosec)
                                    ),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('HBA1C'),
                                      ],
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 40,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: w / 9,
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4)
                                          ],
                                          keyboardType: TextInputType.number,
                                        )),
                                    Text("  %")
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 240.0),
                                  child: Icon(
                                    Icons.sports_gymnastics,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(width: w / 80),
                                Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xffececec),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: w / 1.3,
                                    height: h / 03,
                                    child: Row(
                                      children: [
                                        SizedBox(width: w / 50),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Lipid Panel"),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Total Chol.')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmol/l")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child:
                                                                  Text('LDl')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmol/l")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child:
                                                                  Text('HDL')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmol/l")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: h / 150,
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: h / 20,
                                                          width: w / 3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffececec),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //border: Border.all(color: colors.logosec)
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Triglycerides')),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: w / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: w / 9,
                                                            child:
                                                                TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    4)
                                                              ],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )),
                                                        Text("  mmol/l")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
          ],
        ),
      ),
    );
  }

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

  var carbo_unit = 0;
  var carbss = 0;
  var gluocse = 0;
  var none = 0;
  List<String> catea = [
    'night',
    'dinner',
    'lunch',
    'lunch',
    'snack',
  ];
  String? cate;

  String? rem;
  String? act;
  List<String> rema = [
    '15 min',
    '30 min',
    '1 hour',
    '1 1/2 hours',
    '2 hours',
  ];
  List<String> acti = [
    'other',
    'circket',
    'football',
    'running',
    'baseball',
  ];
  bool? value1 = false;
  bool? value2 = false;
}
