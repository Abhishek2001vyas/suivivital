import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/Doctoe/Profile_doc.dart';
import 'package:suivivital/view/Doctoe/doc_time/doc_time_controller.dart';
import '../../../custom_widget/timeformed.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../api_controller/doc_time_api.dart';
import '../navgation_bar.dart';

class Doc_time extends StatefulWidget {
  const Doc_time({super.key});

  @override
  State<Doc_time> createState() => _Doc_timeState();
}

class _Doc_timeState extends State<Doc_time> {
  final showtminbydoc = Get.put(Doc_time_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.to(Nav_bar());
        }, icon: Icon(Icons.arrow_back)),
        title: Text("" + "Time Table", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white)),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.add,
                color: Colors.grey,
                size: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(Add_day());
                  },
                  child: Text(
                    "Add days",
                    style: TextStyle(color: colors.logosec),
                  ))
            ]),
              FutureBuilder(
              future: showtminbydoc.gettiming(),
              builder: (context, snapshot) =>
                  Obx(() =>  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: showtminbydoc.timings.length,
                    itemBuilder: (context, index) {
                      return
                        Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child:
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child:
                      Container(
                            height: h / 7.2,
                            width: w / 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 15, right: 15, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    // crossAxisAlignment:
                                    // CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: w / 1.5 ,
                                            child: Text(
                                              showtminbydoc.timings
                                                  .elementAt(index)["day"]
                                                  .toString()
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            )),
                                        // SizedBox(
                                        //   width: w / 2.3,
                                        // ),
                                        IconButton(
                                            onPressed: () async{
                                              await showtminbydoc.doctor_time_delete(showtminbydoc.timings
                                                  .elementAt(index)["id"]
                                                  .toString(),

                                              );
                                              showtminbydoc.gettiming();


                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 18,
                                            ))
                                      ]),
                                  SizedBox(
                                      height: h / 15,
                                      child: Text(
                                        showtminbydoc.timedoctor.elementAt(index).toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize:12 ),
                                        maxLines: 4,
                                      ))
                                ],
                              ),
                            ),

                          ) ),
                      );
                    },
                  ),
            )
              ),
            SizedBox(height: h / 5),
            Container(
              width: w / 1,
              height: h / 20,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff4c5df4))),
                  onPressed: () {
                    Get.to(Profile_doctor());
                  },
                  child: Text(
                    "ok",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}

class Add_day extends StatefulWidget {
  const Add_day({super.key});

  @override
  State<Add_day> createState() => _Add_dayState();
}

class _Add_dayState extends State<Add_day> {
  final add_day_cont = Get.put(Doc_time_controller());
  final doc_time_api = Get.put(Doc_time_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Get.to(Doc_time());
          }, icon: Icon(Icons.arrow_back)),
          title: Text("Add Days", style: TextStyle(color: Colors.white))),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h / 70),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.mae1(0);
            //       },
            //       child: Material(
            //         borderRadius: BorderRadius.circular(10),
            //         elevation: 2,
            //         child: Obx(
            //           () => Container(
            //             decoration: BoxDecoration(
            //               color: add_day_cont.mae == 0
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             height: h / 15,
            //             width: w / 3.5,
            //             child: Center(
            //               child: Text("Morning",
            //                   style: TextStyle(
            //                     color: add_day_cont.mae == 0
            //                         ? Colors.white
            //                         : Colors.grey,
            //                   )),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.mae1(1);
            //       },
            //       child: Material(
            //         borderRadius: BorderRadius.circular(10),
            //         elevation: 2,
            //         child: Obx(
            //           () => Container(
            //             decoration: BoxDecoration(
            //               color: add_day_cont.mae == 1
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             height: h / 15,
            //             width: w / 3.5,
            //             child: Center(
            //               child: Text("Aftermoon",
            //                   style: TextStyle(
            //                     color: add_day_cont.mae == 1
            //                         ? Colors.white
            //                         : Colors.grey,
            //                   )),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.mae1(2);
            //       },
            //       child: Material(
            //         borderRadius: BorderRadius.circular(10),
            //         elevation: 2,
            //         child: Obx(
            //           () => Container(
            //             decoration: BoxDecoration(
            //               color: add_day_cont.mae == 2
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             height: h / 15,
            //             width: w / 3.5,
            //             child: Center(
            //               child: Text("evening",
            //                   style: TextStyle(
            //                     color: add_day_cont.mae == 2
            //                         ? Colors.white
            //                         : Colors.grey,
            //                   )),
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              width: w / 1,
              child: Text("Select days onpress & unselect days long press",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 11, color: Colors.grey)),
            ),
            SizedBox(height: h / 50),
            Obx(() =>
            doc_time_api.isloading==true?
                Center(child: CircularProgressIndicator(),)
            :
                GridView.builder(
              shrinkWrap: true,
              itemCount: daylist.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (35 / 20),
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemBuilder: (BuildContext context, int index) {
                return days_time_add(
                  text: daylist.elementAt(index),
                  hi: 19,
                  wi: 5,
                  ontap: () {
                    add_day_cont.shift1(no[index]);
                  },
                  changeno: no[index],
                );
              },
            ),),

            SizedBox(height: h / 50),
            GridView.builder(
              shrinkWrap: true,
              itemCount: timelist1.elementAt(0).length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (35 / 20),
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemBuilder: (BuildContext context, int index) {
                return timelistwidget(
                  text: timelist1.elementAt(0)[index]["time"].toString(),
                  // ontap: () {
                  //   add_day_cont.shift1(no[index]);
                  // },
                  // changeno: no[index], longpress: () {  },
                  enterindex: timelist1.elementAt(0)[index]["id"].toString(),
                  removeindex: timelist1.elementAt(0)[index]["id"].toString(),
                  changeno: timelist1.elementAt(0)[index]["id"].toString(),
                );
              },
            ),





            // SizedBox(height: h / 50),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     days_time_add (text: "Sun",hi: 19, wi: 5, ontap: () { add_day_cont.shift1(0); }, changeno: 0,),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(1);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 1
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //               child: Text("mon",
            //                   style: TextStyle(
            //                       fontSize: 13,
            //                       color: add_day_cont.shift == 1
            //                           ? Colors.white
            //                           : Colors.black)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(2);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 2
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //               child: Text("tue",
            //                   style: TextStyle(
            //                       fontSize: 13,
            //                       color: add_day_cont.shift == 2
            //                           ? Colors.white
            //                           : Colors.black)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(3);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 3
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //                 child: Text("wed",
            //                     style: TextStyle(
            //                         fontSize: 13,
            //                         color: add_day_cont.shift == 3
            //                             ? Colors.white
            //                             : Colors.black))),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: h / 70),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(4);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 4
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //                 child: Text("thu",
            //                     style: TextStyle(
            //                         fontSize: 13,
            //                         color: add_day_cont.shift == 4
            //                             ? Colors.white
            //                             : Colors.black))),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(5);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 5
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //                 child: Text("fri",
            //                     style: TextStyle(
            //                         fontSize: 13,
            //                         color: add_day_cont.shift == 5
            //                             ? Colors.white
            //                             : Colors.black))),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(6);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 6
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //               child: Text("sat",
            //                   style: TextStyle(
            //                       fontSize: 13,
            //                       color: add_day_cont.shift == 6
            //                           ? Colors.white
            //                           : Colors.black)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         add_day_cont.shift1(7);
            //       },
            //       child: Obx(
            //         () => Material(
            //           borderRadius: BorderRadius.circular(10),
            //           elevation: 2,
            //           child: Container(
            //             height: h / 19,
            //             width: w / 5,
            //             decoration: BoxDecoration(
            //               color: add_day_cont.shift == 07
            //                   ? Color(0xff6e7bf6)
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Center(
            //                 child: Text("all",
            //                     style: TextStyle(
            //                         fontSize: 13,
            //                         color: add_day_cont.shift == 7
            //                             ? Colors.white
            //                             : Colors.black))),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: h / 30),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Icon(
            //     Icons.add,
            //     color: Colors.grey,
            //     size: 20,
            //   ),
            //   TextButton(
            //       onPressed: () {
            //         Get.to(Add_day());
            //       },
            //       child: Text(
            //         "Add days",
            //         style: TextStyle(color: colors.logosec),
            //       ))
            // ]),
            // Obx(() => add_day_cont.shift== 8 || add_day_cont.mae== 3
            //     ? Text(""): Material(
            //   elevation: 2,
            //   borderRadius: BorderRadius.circular(10),
            //   child: Container(
            //     decoration:
            //     BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //     height: h / 3,
            //     width: w / 1,
            //     child: Padding(
            //       padding:
            //       const EdgeInsets.only(top: 015.0, left: 10, right: 10),
            //       child: Column(children: [
            //         Row(
            //           children: [
            //             Text("Start time : "),
            //             TextButton(
            //                 onPressed: () {
            //                   timepicker();
            //                 },
            //                 child: time != null
            //                     ? Text(time.toString().substring(10, 15))
            //                     : Text("Select time")),
            //             Text("end time : "),
            //             TextButton(
            //                 onPressed: () {
            //                   timepicker2();
            //                 },
            //                 child: time4 != null
            //                     ? Text(time4.toString().substring(10, 15))
            //                     : Text("Select time")),
            //           ],
            //         ),
            //         // SizedBox(
            //         //   height: h / 100,
            //         // ),
            //         // Obx(() => doc_time_api.isloading1.value == true
            //         //     ? Center(
            //         //   child: CircularProgressIndicator(),
            //         // )
            //         //     :     Container(
            //         //   width: w / 3,
            //         //   height: h / 20,
            //         //   child: ElevatedButton(
            //         //       style: ButtonStyle(
            //         //           shape: MaterialStateProperty.all(
            //         //               RoundedRectangleBorder(
            //         //                   borderRadius: BorderRadius.circular(10))),
            //         //           backgroundColor:
            //         //           MaterialStateProperty.all(Color(0xff4c5df4))),
            //         //       onPressed: () async{
            //         //         var shared_preferences =
            //         //         await SharedPreferences.getInstance();
            //         //         var isLogedIn = shared_preferences.getString('user_id');
            //         //
            //         //         Map body={
            //         //           "doctor_id":isLogedIn.toString(),
            //         //           "start_time":time.toString().substring(10,15),
            //         //           "end_time":time4.toString().substring(10,15),
            //         //         };
            //         //         doc_time_api.loader1();
            //         //         await doc_time_api.add_time(body);
            //         //         await doc_time_api.time_list();
            //         //       },
            //         //       child: Text(
            //         //         "Add Time",
            //         //         style: TextStyle(color: Colors.white),
            //         //       )),
            //         // ),
            //         // ),
            //         //
            //         // SizedBox(
            //         //   height: h / 80,
            //         // ),
            //         // Container(height: h/10,
            //         //   child: FutureBuilder(future: doc_time_api.time_list(), builder: (context, snapshot) {
            //         //     return    ListView.builder(
            //         //       itemCount: doc_time_api.gettime_list.length,
            //         //       itemBuilder: (context, index) {
            //         //         return    Material(
            //         //             elevation: 2,
            //         //             borderRadius: BorderRadius.circular(10),
            //         //             child: Container(
            //         //               height: h / 20,
            //         //               decoration: BoxDecoration(
            //         //                   borderRadius: BorderRadius.circular(10)),
            //         //               width: w / 1,
            //         //               child: Padding(
            //         //                 padding: const EdgeInsets.only(right: 8.0, left: 8),
            //         //                 child: Row(children: [
            //         //                   Icon(
            //         //                     CupertinoIcons.clock,size: 18,
            //         //                     color: Colors.grey,
            //         //                   ),
            //         //                   SizedBox(
            //         //                     width: w / 60,
            //         //                   ),
            //         //                   Text(
            //         //                       maxLines:2,
            //         //                       "${doc_time_api.gettime_list.elementAt(index)}"
            //         //                       " - ${doc_time_api.gettimeto_list.elementAt(index)}"
            //         //                   ),
            //         //                   SizedBox(
            //         //                     width: w / 2.5,
            //         //                   ),
            //         //                   IconButton(onPressed: (){}, icon: Icon(
            //         //                     CupertinoIcons.delete,
            //         //                     color: Colors.red,
            //         //                     size: 18,
            //         //                   ))
            //         //
            //         //                 ]),
            //         //               ),
            //         //             ));
            //         //       },);
            //         //   },),
            //         // ),
            //         //
            //
            //
            //         // SizedBox(
            //         //   height: h / 100,
            //         // ),
            //         // Material(
            //         //     elevation: 2,
            //         //     borderRadius: BorderRadius.circular(10),
            //         //     child: Container(
            //         //       height: h / 20,
            //         //       decoration: BoxDecoration(
            //         //           borderRadius: BorderRadius.circular(10)),
            //         //       width: w / 1,
            //         //       child: Padding(
            //         //         padding: const EdgeInsets.only(right: 8.0, left: 8),
            //         //         child: Row(children: [
            //         //           Icon(
            //         //             CupertinoIcons.clock,
            //         //             color: Colors.grey,
            //         //           ),
            //         //           SizedBox(
            //         //             width: w / 60,
            //         //           ),
            //         //           Text("07:00 Pm - 08:00 Pm"),
            //         //           SizedBox(
            //         //             width: w / 3,
            //         //           ),
            //         //           Icon(
            //         //             CupertinoIcons.delete,
            //         //             color: Colors.red,
            //         //             size: 18,
            //         //           )
            //         //         ]),
            //         //       ),
            //         //     )),
            //         SizedBox(
            //           height: h / 80,
            //         ),
            //         Container(
            //           width: w / 3,
            //           height: h / 20,
            //           child: ElevatedButton(
            //               style: ButtonStyle(
            //                   shape: MaterialStateProperty.all(
            //                       RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(10))),
            //                   backgroundColor:
            //                   MaterialStateProperty.all(Color(0xff4c5df4))),
            //               onPressed: () {},
            //               child: Text(
            //                 "Done",
            //                 style: TextStyle(color: Colors.white),
            //               )),
            //         ),
            //       ]),
            //     ),
            //   ),
            // ),),
            SizedBox(height: h / 5),

            Container(
              width: w / 1,
              height: h / 20,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff4c5df4))),
                  onPressed: () async {
                    var day_id = add_day_cont.shift.value + 1;
                    await doc_time_api.Submit(day_id);
                    add_day_cont.multiple_select.clear();
                    add_day_cont.shift1(8);

                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      )),
    );
  }

  TimeOfDay? time;

  TimeOfDay? time4;

  timepicker() async {
    TimeOfDay? time2 =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time = time2!;
    });
  }

  timepicker2() async {
    TimeOfDay? time3 =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time4 = time3!;
    });
  }


}
