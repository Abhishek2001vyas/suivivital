import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suivivital/utils/constant.dart';
import 'package:suivivital/view/user/api_controller_user/doctor_detatil.dart';
import 'package:suivivital/view/user/book%20appointment/book_appoiment.dart';
import 'package:suivivital/view/user/video_call.dart';
import 'package:suivivital/view/user/voice_call.dart';
import '../../utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'api_controller_user/booking_time.dart';
import 'home/home1.dart';

class Doctor_deatils extends StatefulWidget {
  const Doctor_deatils({super.key});

  @override
  State<Doctor_deatils> createState() => _Doctor_deatilsState();
}

class _Doctor_deatilsState extends State<Doctor_deatils> {
  final doctor_Details_controller = Get.put(doctor_Details());
  final booking_time_api = Get.put(Book_time_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(Home1());
              },
              icon: Icon(
                Icons.arrow_back,

              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.doctorDetails,
            style:
                TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: h / 20),
              GestureDetector(
                onTap: () {
                  // Get.to(Videos_call());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: details1.elementAt(0)["status_on_of"]== "1"? Colors.green:Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  height: h / 13,
                  width: w / 1,
                  child: Row(children: [
                    SizedBox(width: w / 20),
                    Container(
                      height: h / 10,
                      width: w / 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.video_call, color:details1.elementAt(0)["status_on_of"] == "1"? Colors.green:Colors.grey),
                    ),
                    SizedBox(width: w / 25),
                    Text(
                      "Video call",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: h / 50),
              GestureDetector(
                onTap: () {
                 // Get.to(Voice_call());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: details1.elementAt(0)["status_on_of"]== "1"? Colors.green:Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  height: h / 13,
                  width: w / 1,
                  child: Row(children: [
                    SizedBox(width: w / 20),
                    Container(
                      height: h / 10,
                      width: w / 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.call, color: details1.elementAt(0)["status_on_of"]== "1"? Colors.green:Colors.grey),
                    ),
                    SizedBox(width: w / 25),
                    Text(
                      AppLocalizations.of(context)!.call,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: h / 30),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 20
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  Text(
                    AppLocalizations.of(context)!.doctorInformation,
                    style: TextStyle(
                        //color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: h / 80),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w / 12,
                      ),
                      Text(AppLocalizations.of(context)!.name,
                          style: TextStyle(color: Colors.black,
                          fontSize: 13
                          )),
                      SizedBox(
                        width: w / 13,
                      ),
                      Text(":", style: TextStyle(color: Colors.black)),
                      SizedBox(
                        width: w / 40,
                      ),
                      Text("${details1.elementAt(0)["name"]}",
                        style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  SizedBox(height: h / 100),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 12,
                      ),
                      Text("Address",
                          style: TextStyle(fontSize: 13,color: Colors.black)),
                      SizedBox(
                        width: w / 30,
                      ),
                      Text(":", style: TextStyle(color: Colors.black)),
                      SizedBox(
                        width: w / 40,
                      ),
                      SizedBox(
                          width: w/2,
                          child: Text("${details1.elementAt(0)["address"]}",overflow: TextOverflow.ellipsis,))
                    ],
                  ),
                  SizedBox(height: h / 100),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 12,
                      ),
                      Text(AppLocalizations.of(context)!.gender,
                          style: TextStyle(color: Colors.black,fontSize: 13)),
                      SizedBox(
                        width: w / 19,
                      ),
                      Text(":", style: TextStyle(color: Colors.black)),
                      SizedBox(
                        width: w / 40,
                      ),
                      Text("${details1.elementAt(0)["gender"]}",
                      style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  // SizedBox(height: h / 100),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: w / 12,
                  //     ),
                  //     Text(AppLocalizations.of(context)!.phone,
                  //         style: TextStyle(color: Colors.black)),
                  //     SizedBox(
                  //       width: w / 29,
                  //     ),
                  //     Text(":", style: TextStyle(color: Colors.black)),
                  //     SizedBox(
                  //       width: w / 40,
                  //     ),
                  //     Text("${details1.elementAt(0)["mobile"]}")
                  //   ],
                  // ),
                  SizedBox(height: h / 100),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Text(AppLocalizations.of(context)!.about,
                            style: TextStyle(color: Colors.black, fontSize: 13)),
                      ),
                      SizedBox(
                        width: w / 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Text(":", style: TextStyle(color: Colors.black,)),
                      ),
                      SizedBox(
                        width: w / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Container(
                          width: w / 1.8,
                          // height: h/50,
                          child: Text(
                            "${details1.elementAt(0)["about"]} ",style: TextStyle( fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: h / 70),
              // Row(
              //   children: [
              //     Icon(
              //       CupertinoIcons.clock,
              //       color: Colors.grey,
              //     ),
              //     SizedBox(
              //       width: w / 40,
              //     ),
              //     Text(
              //       AppLocalizations.of(context)!.visittime,
              //       style: TextStyle(
              //           //color: Colors.grey,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 17),
              //     )
              //   ],
              // ),
              // SizedBox(height: h / 80),
              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         SizedBox(
              //           width: w / 12,
              //         ),
              //         Text(AppLocalizations.of(context)!.morning,
              //             style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 12,
              //         ),
              //         Text(":", style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 40,
              //         ),
              //         Text("09:00 - 10:30 Am")
              //       ],
              //     ),
              //     SizedBox(height: h / 100),
              //     Row(
              //       children: [
              //         SizedBox(
              //           width: w / 12,
              //         ),
              //         Text(AppLocalizations.of(context)!.afternoon,
              //             style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 25,
              //         ),
              //         Text(":", style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 40,
              //         ),
              //         Text("01:00 - 02:30 Pm")
              //       ],
              //     ),
              //     SizedBox(height: h / 100),
              //     Row(
              //       children: [
              //         SizedBox(
              //           width: w / 12,
              //         ),
              //         Text(AppLocalizations.of(context)!.evening,
              //             style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 11.3,
              //         ),
              //         Text(":", style: TextStyle(color: Colors.black)),
              //         SizedBox(
              //           width: w / 40,
              //         ),
              //         Text("07:00 - 08:30 Pm")
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(height: h / 30),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.grey,size: 20,
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  Text(
                    AppLocalizations.of(context)!.consultationFees,
                    style: TextStyle(
                        //color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: h / 80),
              Column(
                children: [
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: w / 12,
                  //     ),
                  //     Text(AppLocalizations.of(context)!.paid,
                  //         style: TextStyle(color: Colors.black)),
                  //     SizedBox(
                  //       width: w / 22,
                  //     ),
                  //     Text(":", style: TextStyle(color: Colors.black)),
                  //     SizedBox(
                  //       width: w / 40,
                  //     ),
                  //     Text(
                  //       AppLocalizations.of(context)!.voiceCall,
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: h / 100),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 12,
                      ),
                      Text(AppLocalizations.of(context)!.fees,
                          style: TextStyle(color: Colors.black,fontSize: 13)),
                      SizedBox(
                        width: w / 25,
                      ),
                      Text(":", style: TextStyle(color: Colors.black)),
                      SizedBox(
                        width: w / 40,
                      ),
                      Text("CFA ${details1.elementAt(0)["fees_condition"]}"
                      ,style: TextStyle(fontSize: 13,color: Colors.green,fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: h / 25),
              SizedBox(
                width: w / 1,
                height: h / 15,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff4c5df4))),
                    onPressed: () async {
                     // details1.elementAt(0)[0]["about"];
                      var format = DateFormat('dd-MM-yyyy');
                      var dateString = format.format(DateTime.now());
                      await booking_time_api.booktiming(details1.elementAt(0)["id"],DateTime.now().weekday,dateString.toString());
                      // booking_time_api
                      //     .timedatachange();
                     Get.to(Book_appointment());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.bookappointment,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: h / 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
