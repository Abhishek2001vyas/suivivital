import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/home/home1.dart';
import 'package:suivivital/view/user/patients_details.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../api_controller_user/booking_time.dart';
import '../api_controller_user/doctor_detatil.dart';
import 'book_appointment_controller.dart';
import 'package:intl/intl.dart';

class Book_appointment extends StatefulWidget {
  const Book_appointment({super.key,});

  @override
  State<Book_appointment> createState() => _Book_appointmentState();
}

class _Book_appointmentState extends State<Book_appointment> {
  final add_prescription_controller = Get.put(Book_appointmment_controller());
  final add_prescription_api = Get.put(Book_time_api());
  int? mae;
  int? shift;
  DateTime? _selectedValue;
  int? tim;
  var format = DateFormat('dd-MM-yyyy');
  var dateString ;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Home1());
              },
              icon: const Icon(
                Icons.arrow_back,
                // color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.bookappointment,
            style: const TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(future: null,
                  builder:(context, snapshot) =>
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SizedBox(height: h/10,width: w/4.5,
                              child:ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                    fit: BoxFit.fill,
                                    "${doctor_image_url.toString()}${details1.elementAt(0)["profile_image"]}"),
                              ),

                            ),
                          ),


                          SizedBox(width: w / 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. ${details1.elementAt(0)["name"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: h / 200),
                              //Text("Gerenal Physcian",style: TextStyle(color: Color(0xff6e7bf6)),),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Color(0xfffeba0c),
                                  ),SizedBox(width: w/80),
                                  Text(
                                    "${details1.elementAt(0)["rating"]} ",
                                    style: TextStyle(color: Colors.black87,fontSize: 14,fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "(${details1.elementAt(0)["rating_count"]})",
                                    style: TextStyle(
                                        fontSize: 12,fontWeight: FontWeight.w400,
                                        color: Color(0xff777f8a)),
                                  )
                                ],
                              ),
                              SizedBox(height: h / 200),
                              Row(
                                children: [
                                  Icon(
                                    Icons.business_center_sharp,
                                    size: 15,
                                    color: Colors.black26,
                                  ),
                                  SizedBox(width: w/80),
                                  Text(
                                    "${details1.elementAt(0)["experience"]}",
                                    style: TextStyle(
                                        color: Colors.grey,fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.yearExp,
                                    style: TextStyle(color: Color(0xff777f8a)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                  ),
                SizedBox(height: h / 30),
                Text(
                  DateTime.now().toString().substring(0, 10),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: h / 60),
                SizedBox(
                  height: h / 7.9,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: const Color(0xff6e7bf6),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      add_prescription_api.changedayweek(date.weekday);
                      dateString = format.format(date);
                      add_prescription_api.booktiming(details1.elementAt(0)["id"],date.weekday,dateString.toString() );
                      add_prescription_api.loader();
                      setState(() {
                        tim = date.weekday;
                        _selectedValue = date;
                      });
                    },
                  ),
                ),
                SizedBox(height: h / 60),
                const Text(
                  "Available Time",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: h / 90),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           mae = 0;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: mae == 0 ? const Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           height: h / 15,
                //           width: w / 3.5,
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 15.0),
                //             child: Center(
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.sunny,
                //                     color:
                //                         mae == 0 ? Colors.white : Colors.grey,
                //                   ),
                //                   Text(AppLocalizations.of(context)!.morning,
                //                       style: TextStyle(
                //                         color: mae == 0
                //                             ? Colors.white
                //                             : Colors.grey,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           mae = 1;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: mae == 1 ? const Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           height: h / 15,
                //           width: w / 3.5,
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 15.0),
                //             child: Center(
                //               child: Row(
                //                 children: [
                //                   Image.asset(
                //                     "assets/images/daytime.png",
                //                     color:
                //                         mae == 1 ? Colors.white : Colors.grey,
                //                     height: 20,
                //                     width: 20,
                //                   ),
                //                   Text(AppLocalizations.of(context)!.afternoon,
                //                       style: TextStyle(
                //                         color: mae == 1
                //                             ? Colors.white
                //                             : Colors.grey,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           mae = 2;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: mae == 2 ? const Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           height: h / 15,
                //           width: w / 3.5,
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 15.0),
                //             child: Center(
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.sunny_snowing,
                //                     color:
                //                         mae == 2 ? Colors.white : Colors.grey,
                //                   ),
                //                   Text(AppLocalizations.of(context)!.evening,
                //                       style: TextStyle(
                //                         color: mae == 2
                //                             ? Colors.white
                //                             : Colors.grey,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(height: h / 60),
                //
                // GridView.builder(shrinkWrap: true,
                //   itemCount: booktime.length,
                //   physics: NeverScrollableScrollPhysics(),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       childAspectRatio: (35 / 20),
                //       crossAxisCount: 4,
                //       crossAxisSpacing: 8,
                //       mainAxisSpacing: 8),
                //   itemBuilder: (BuildContext context, int index) {
                //   return   GestureDetector(
                //     onTap: () {
                //       // setState(() {
                //       //   shift = 0;
                //       // });
                //     },
                //     child: Material(
                //       borderRadius: BorderRadius.circular(10),
                //       elevation: 2,
                //       child: Container(
                //         height: h / 19,
                //         width: w / 5,
                //         decoration: BoxDecoration(
                //           color:
                //           shift == 0 ? Color(0xff6e7bf6) : Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: Center(
                //             child: Text(booktime.elementAt(0)["time"],
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 0
                //                         ? Colors.white
                //                         : Colors.black))),
                //       ),
                //     ),
                //   );
                //   },
                //
                // ),
               // Container(child: Text(bookday.elementAt(add_prescription_api.trendIndex )["time1"])),

               //uiol

                Obx(() =>
                add_prescription_api.isloading == true
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    :
                bookday.isEmpty?
                    Text("No date available")
                    :
                FutureBuilder(future:null
                // add_prescription_api.booktiming(details.elementAt(0)[0]["id"],
                //     dateString.toString(),_selectedValue!.weekday)
                    ,
                    builder: (context, snapshot) =>
                add_prescription_api.trendIndex.value <= -1? Text("Not available",)
                    :
                GridView.builder(
                    shrinkWrap: true,
                    itemCount:bookday.elementAt( add_prescription_api.trendIndex.value)["time1"].length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (35 / 20),
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (BuildContext context, int index) {
                      return
                      Obx(() =>
                        GestureDetector(
                          onTap: () {
                            add_prescription_api.multiple_select.clear();
                            if(  bookday.elementAt(
                                add_prescription_api.trendIndex
                                    .value)["time1"][index]["booking_status"]=="1"){

                              Get.snackbar("Appointment not available", "slot already booked ",);

                            }
                            else {
                              add_prescription_api.mtime(
                                  bookday.elementAt(
                                      add_prescription_api.trendIndex
                                          .value)["time1"][index]["time"]
                                  , bookday.elementAt(
                                  add_prescription_api.trendIndex
                                      .value)["time1"][index]["id"],
                                  bookday.elementAt(
                                      add_prescription_api.trendIndex
                                          .value)["dayid"]

                              );
                            }
                         print("${add_prescription_api.multiple_select}");
                         print(_selectedValue);

                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                              height: h / 19,
                              width: w / 5,
                              decoration: BoxDecoration(
                                color:
                                bookday.elementAt(
                                    add_prescription_api.trendIndex
                                        .value)["time1"][index]["booking_status"]=="1"?Colors.grey:
                                add_prescription_api.multiple_select.contains("${bookday.elementAt(add_prescription_api.trendIndex.value)["time1"][index]["time"]}") ? Color(0xff6e7bf6) : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(bookday.elementAt( add_prescription_api.trendIndex.value)["time1"][index]["time"],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:  add_prescription_api.multiple_select.contains("${bookday.elementAt( add_prescription_api.trendIndex.value)["time1"][index]["time"]}")
                                              ? Colors.white
                                              : Colors.black))),
                            ),
                          ),
                        ));
                    }
                )),
                ),

                    //lkj



                     // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 0;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 0 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("09:00 Am",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 0
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 1;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 1 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //             child: Text("09:30 Am",
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 1
                //                         ? Colors.white
                //                         : Colors.black)),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 2;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 2 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //             child: Text("10:00 Am",
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 2
                //                         ? Colors.white
                //                         : Colors.black)),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 3;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 3 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("10:30 Am",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 3
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: h / 60),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 4;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 4 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("01:00 pm",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 4
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 5;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 5 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("01:30 pm",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 5
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 6;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 6 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //             child: Text("02:00 pm",
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 6
                //                         ? Colors.white
                //                         : Colors.black)),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 7;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 07 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("02:30 pm",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 7
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: h / 60),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 8;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 08 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text("07:00 pm",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 08
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 9;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 09 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           height: h / 19,
                //           width: w / 5,
                //           child: Center(
                //               child: Text("07:30 pm",
                //                   style: TextStyle(
                //                       fontSize: 13,
                //                       color: shift == 09
                //                           ? Colors.white
                //                           : Colors.black))),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 10;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 10 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           height: h / 19,
                //           width: w / 5,
                //           child: Center(
                //             child: Text("08:00 pm",
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 10
                //                         ? Colors.white
                //                         : Colors.black)),
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           shift = 11;
                //         });
                //       },
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10),
                //         elevation: 2,
                //         child: Container(
                //           height: h / 19,
                //           width: w / 5,
                //           decoration: BoxDecoration(
                //             color:
                //                 shift == 11 ? Color(0xff6e7bf6) : Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //             child: Text("08:30 pm",
                //                 style: TextStyle(
                //                     fontSize: 13,
                //                     color: shift == 11
                //                         ? Colors.white
                //                         : Colors.black)),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: h / 50),
                const Text(
                  "Check-Up Fees",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: h / 90),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  height: h / 13,
                  width: w / 1,
                  child: Row(children: [
                    SizedBox(width: w / 20),
                    Container(
                      height: h / 12,
                      width: w / 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.account_balance_wallet,
                          size: 18,
                          color: Colors.green),
                    ),
                    SizedBox(width: w / 80),
                    SizedBox(width: w/2.2,
                      child: Text(
                        AppLocalizations.of(context)!.consultationFees,
                        style: const TextStyle(
                          fontSize: 14,fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // SizedBox(width: w / 5),
                     Text(
                      "CFA ${details1.elementAt(0)["fees_condition"]}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ]),
                ),
                SizedBox(height: h / 10),
                // const Text(
                //   "Your Preferred Service",
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: h / 90),
                // Row(children: [
                //   Checkbox(
                //     side: const BorderSide(color: colors.geryq1, width: 2),
                //     // checkColor: colors.geryq1,
                //     // activeColor: Colors.white,
                //     value: value1,
                //     onChanged: (value) {
                //       setState(() {
                //         value1 = value;
                //       });
                //     },
                //   ),
                //    SizedBox(
                //     width: w/1.5,
                //     child: Text(
                //       "Home service(collect test sample)",
                //     ),
                //   )
                // ]
                // ),
                SizedBox(
                  width: w / 1,
                  height: h / 15,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff4c5df4))),
                      onPressed: () {
                        Get.to(() =>  Patients_details(
                          doctorid: details.elementAt(0)[0]["id"],
                          booktime: add_prescription_api.multiple_select,
                            cons_fee: details.elementAt(0)[0]["fees_condition"],dates: _selectedValue,));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: h / 50,
                ),
              ]),
        ),
      ),
    );
  }

  bool? value1 = false;
}
