import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/log/Log_entry.dart';

import '../../../utils/color.dart';

class Log_book extends StatefulWidget {
  const Log_book({super.key});

  @override
  State<Log_book> createState() => _Log_bookState();
}

class _Log_bookState extends State<Log_book> {
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
                Get.to(Log_entry());
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                filter_dropdown();
              },
              icon: Icon(
                Icons.filter_list_outlined,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 300,
                      child: AlertDialog(
                        title: Text('Log Entry'),
                        content: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 0, bottom: 0),
                          child: SizedBox(
                            height: 180,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Date")),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.medication_rounded,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Apply basal")),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.medication_rounded,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("clear bassl")),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        // actions: [
                        //   TextButton(
                        //     //textColor: Colors.black,
                        //     onPressed: () {
                        //       Get.back();
                        //     },
                        //     child: Text('CANCEL'),
                        //   ),
                        //   TextButton(
                        //     // textColor: Colors.black,
                        //     onPressed: () {
                        //       Get.back();
                        //     },
                        //     child: Text('ACCEPT'),
                        //   ),
                        // ],
                      ),
                    );
                  },
                );
                more_popbox();
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
        title: Text("Log Book", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
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
                      DateTime.now().toString().substring(0, 10),
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
                  onTap: () {
                    Get.to(Log_entry());
                  },
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
                  onTap: () {
                    Get.to(Log_entry());
                  },
                  child: Container(
                    width: w / 1.3,
                    height: h / 20,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        DateTime.now().toString().substring(0, 10) + "  other",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 50,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
              child: Row(
                children: [
                  SizedBox(width: w / 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h / 30,
                      width: w / 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      // child: carbo_unit == 3
                      //     ? Icon(
                      //         Icons.done,
                      //         color: colors.logosec,
                      //       )
                      //     : null,
                    ),
                  ),
                  Text("  Glucose :-", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: w / 50),
                  Text(" 5",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(width: w / 50),
                  Text("mmol/l", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(
              height: h / 25,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
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
                      DateTime.now()
                          .subtract(Duration(days: 1))
                          .toString()
                          .substring(0, 10),
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
                  onTap: () {
                    Get.to(Log_entry());
                  },
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
                  onTap: () {
                    Get.to(Log_entry());
                  },
                  child: Container(
                    width: w / 1.3,
                    height: h / 20,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        DateTime.now()
                                .subtract(Duration(days: 1))
                                .toString()
                                .substring(0, 10) +
                            "  other",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 50,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
              child: Row(
                children: [
                  SizedBox(width: w / 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(Log_entry());
                    },
                    child: Container(
                      height: h / 30,
                      width: w / 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      // child: carbo_unit == 3
                      //     ? Icon(
                      //         Icons.done,
                      //         color: colors.logosec,
                      //       )
                      //     : null,
                    ),
                  ),
                  Text("  Glucose :-", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: w / 50),
                  Text(" 5",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(width: w / 50),
                  Text("mmol/l", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(
              height: h / 25,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
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
                      DateTime.now()
                          .subtract(Duration(days: 2))
                          .toString()
                          .substring(0, 10),
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
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(Log_entry());
                    },
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
                    onTap: () {
                      Get.to(Log_entry());
                    },
                    child: Container(
                      width: w / 1.3,
                      height: h / 20,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffececec),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          DateTime.now()
                                  .subtract(Duration(days: 2))
                                  .toString()
                                  .substring(0, 10) +
                              "  other",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Log_entry());
              },
              child: Row(
                children: [
                  SizedBox(width: w / 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h / 30,
                      width: w / 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      // child: carbo_unit == 3
                      //     ? Icon(
                      //         Icons.done,
                      //         color: colors.logosec,
                      //       )
                      //     : null,
                    ),
                  ),
                  Text("  Glucose :-", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: w / 50),
                  Text(" 5",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(width: w / 50),
                  Text("mmol/l", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(
              height: h / 25,
            ),
          ]),
        ),
      ),
    );
  }

  var carbo_unit = 0;

  void filter_dropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Filter'),
            content: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: () {}, child: Text("lunch")),
                    TextButton(onPressed: () {}, child: Text("lunch")),
                    TextButton(onPressed: () {}, child: Text("lunch")),
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

  more_popbox() {
    // SizedBox(height: 100,child: showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Expanded(
    //       child: AlertDialog(
    //         title: Text('Log Entry'),
    //         content: Padding(
    //           padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10),
    //           child: Column(
    //             children: [
    //               Row(children: [
    //                 Icon(Icons.calendar_month_outlined,color: Colors.grey,size: 25,),
    //                 SizedBox(width:20,),
    //                 TextButton(onPressed: (){
    //                   Get.back();
    //                 }, child: Text("Date")),
    //               ],),
    //               SizedBox(
    //                 height: 15,
    //               ),
    //               Row(children: [
    //                 Icon(Icons.medication_rounded,color: Colors.grey,size: 25,),
    //                 SizedBox(width:20,),
    //                 TextButton(onPressed: (){
    //                   Get.back();
    //                 }, child: Text("Apply basal")),
    //               ],),SizedBox(
    //                 height: 15,
    //               ),
    //               Row(children: [
    //                 Icon(Icons.medication_rounded,color: Colors.grey,size: 25,),
    //                 SizedBox(width:20,),
    //                 TextButton(onPressed: (){
    //                   Get.back();
    //                 }, child: Text("clear bassl")),
    //               ],)
    //             ],
    //           ),
    //         ),
    //         // actions: [
    //         //   TextButton(
    //         //     //textColor: Colors.black,
    //         //     onPressed: () {
    //         //       Get.back();
    //         //     },
    //         //     child: Text('CANCEL'),
    //         //   ),
    //         //   TextButton(
    //         //     // textColor: Colors.black,
    //         //     onPressed: () {
    //         //       Get.back();
    //         //     },
    //         //     child: Text('ACCEPT'),
    //         //   ),
    //         // ],
    //       ),
    //     );
    //   },
    // ) ,);
  }
}
