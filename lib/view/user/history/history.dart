import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/Doctor_review.dart';
import '../../../custom_widget/drawer.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../Doctoe/api_controller/getmedicinebydoctor.dart';
import '../api_controller_user/history_past_api.dart';
import 'history_user_controller.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // var his = 0;
  final pressController = Get.put(History_user());
  final pastcontroller = Get.put(past_user());
  final Getmedicinebydoctor_Controller = Get.put(Getmedicinebydoctor());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white //Color(0xfff7f7fc)
      ,
      drawer: const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // automaticallyImplyLeading: false,
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.appointmentHistory,
          style:const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics:const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        pressController.In(0);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.primary, width: 2),
                              color: pressController.his == 0
                                  ? colors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 2.5,
                          height: h / 15,
                          child: Center(
                              child: Text(
                            AppLocalizations.of(context)!.upcoming,
                            style: TextStyle(
                                color: pressController.his == 0
                                    ? Colors.white
                                    : colors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        pressController.In(1);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.primary, width: 2),
                              color: pressController.his == 1
                                  ? colors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 2.5,
                          height: h / 15,
                          child: Center(
                              child: Text(
                            AppLocalizations.of(context)!.past,
                            style: TextStyle(
                                color: pressController.his == 1
                                    ? Colors.white
                                    : colors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ))
                ],
              ),
              // SizedBox(
              //   height: h / 20,
              // ),
              // Obx(() => pressController.his == 0
              //     ? Text(
              //         AppLocalizations.of(context)!.today +
              //             " :- " +
              //             DateTime.now().toString().substring(0, 10),
              //         style: TextStyle(color: Colors.black54),
              //       )
              //     : Text(
              //         "yesterday :- " +
              //             DateTime.now()
              //                 .subtract(Duration(days: 1))
              //                 .toString()
              //                 .substring(0, 10),
              //         style: TextStyle(color: Colors.black54),
              //       )),

              SizedBox(
                height: h / 30,
              ),

              Obx(
                () => pressController.his == 0
                    ? SizedBox(
                        height: h / 1.15,
                        width: w,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 130.0),
                            child: RefreshIndicator(
                                displacement: 250,
                                backgroundColor: Colors.yellow,
                                color: Colors.red,
                                strokeWidth: 3,
                                onRefresh: () => reload(),
                                child: FutureBuilder(
                                  future:
                                      pastcontroller.doctor_upcoming_history(),
                                  builder: (context, snapshot) {
                                    return pastcontroller.isloading == true
                                        ?const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : upcoming.isEmpty
                                            ? const Text("No history")
                                            : ListView.builder(
                                                //physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                //scrollDirection: Axis.horizontal,
                                                itemCount: upcoming
                                                    .elementAt(0)
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            right: 10.0,
                                                            bottom: 10),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        var shared_preferences =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        var isLogedIn =
                                                            shared_preferences
                                                                .getString(
                                                                    'user1_id');
                                                        print("doiuhfisdhifkh");
                                                        await Getmedicinebydoctor_Controller
                                                            .Getmedicinebydoctorlistforpdf(
                                                                isLogedIn,
                                                                upcoming.elementAt(0)[index]["doctor_id"],
                                                                upcoming.elementAt(0)[index]["booking_date"]);
                                                        // await pressController
                                                        //     .createpdf();
                                                        Get.to(Doctor_review(
                                                          paabout: upcoming .elementAt( 0)[index]["appointment_about"],
                                                          paname: upcoming.elementAt(  0)[index]["first_name"],
                                                          date: upcoming.elementAt(0)[index]["booking_date"],
                                                          iindex: index,
                                                          doctor_id: upcoming.elementAt(0)[index]["doctor_id"],
                                                          booktime: upcoming.elementAt(0)[index]["booking_time"],
                                                        ));
                                                      },
                                                      child: Material(
                                                        elevation: 2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: SizedBox(
                                                          height: h / 4.8,
                                                          width: w / 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10.0,
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 10),
                                                            child: Column(
                                                              children: [
                                                                Row(children: [
                                                                  SizedBox(
                                                                    width:
                                                                        w / 30,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        h / 10,
                                                                    width:
                                                                        w / 4.5,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                      const  BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      child: Image.network(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          "${doctor_image_url.toString()}${upcoming.elementAt(0)[index]["doctor_image"]}"),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: w /
                                                                          40),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            w / 2,
                                                                        child:
                                                                            Text(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          // maxLines: 2,
                                                                          "Dr.${upcoming.elementAt(0)[index]["doctor_name"]}",
                                                                          style:const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${upcoming.elementAt(0)[index]["booking_date"]}",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Color(0xff777f8a)),

                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            h / 30,
                                                                        width:
                                                                            w / 2,
                                                                        child: Text(
                                                                            upcoming.elementAt(0)[index][
                                                                                "about"],
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:const TextStyle(fontSize: 13, color: Colors.grey)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ]),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                        height: h /
                                                                            13,
                                                                        width: w /
                                                                            13,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: colors.primary.withOpacity(.1)),
                                                                        child:const Icon(
                                                                            Icons
                                                                                .call,
                                                                            color: Colors
                                                                                .black26,
                                                                            size:
                                                                                15)),
                                                                    Text(
                                                                        " ${AppLocalizations.of(context)!
                                                                                .voiceCall} :-  ",
                                                                        style:const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black87)),
                                                                    Text(
                                                                      upcoming.elementAt(
                                                                              0)[index]
                                                                          [
                                                                          "appointment_status"],
                                                                      style:const TextStyle(
                                                                          color: Colors
                                                                              .green,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                  },
                                ))),
                      )
                    : SizedBox(
                        height: h / 1.15,
                        width: w,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 130.0),
                            child: RefreshIndicator(
                                displacement: 250,
                                // backgroundColor: Colors.yellow,
                                color: Colors.blue,
                                strokeWidth: 3,
                                onRefresh: () => reload(),
                                child: FutureBuilder(
                                  future: pastcontroller.user_past_history(),
                                  builder: (context, snapshot) {
                                    return pastcontroller.isloading == true
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : past.isEmpty
                                            ? const Text("No history")
                                            : ListView.builder(
                                                //physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                //scrollDirection: Axis.horizontal,
                                                itemCount:
                                                    past.elementAt(0).length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            right: 10.0,
                                                            bottom: 10),
                                                    child: GestureDetector(
                                                      onTap: () async{
                                                        print("doiuhfisdhifkh");
                                                        var shared_preferences =
                                                            await SharedPreferences
                                                            .getInstance();
                                                        var isLogedIn =
                                                        shared_preferences
                                                            .getString(
                                                            'user1_id');
                                                        print("doiuhfisdhifkh");
                                                        await Getmedicinebydoctor_Controller
                                                            .Getmedicinebydoctorlistforpdf(
                                                            isLogedIn,
                                                            past.elementAt(0)[index]["doctor_id"],
                                                            past.elementAt(0)[index]["booking_date"]);
                                                        Get.to(Doctor_review(
                                                          paabout: past.elementAt(0)[index]["appointment_about"],
                                                          paname: past.elementAt(0)[index]["first_name"],
                                                          date: past.elementAt(0)[index]["booking_date"],
                                                          iindex: index,
                                                          booktime: past.elementAt(0)[index]["booking_time"],
                                                          doctor_id:past.elementAt(0)[index]["doctor_id"],
                                                        ));
                                                      },
                                                      child: Material(
                                                        elevation: 2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: SizedBox(
                                                          height: h / 4.8,
                                                          width: w / 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10.0,
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 10),
                                                            child: Column(
                                                              children: [
                                                                Row(children: [
                                                                  SizedBox(
                                                                    width:
                                                                        w / 30,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            0.0),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          h / 7,
                                                                      width:
                                                                          w / 4,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                        const BorderRadius.all(Radius.circular(10)),
                                                                        child: Image.network(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            "${doctor_image_url.toString()}${past.elementAt(0)[index]["doctor_image"]}"),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  //past.elementAt(0)[index]["doctor_image"]
                                                                  SizedBox(
                                                                      width: w /
                                                                          40),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Text(
                                                                          "Dr.${past.elementAt(0)[index]["doctor_name"]}",
                                                                          style:const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold)),
                                                                      Text(
                                                                        "${past.elementAt(0)[index]["booking_date"]}",
                                                                        style:const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            h / 20,
                                                                        width:
                                                                            w / 2,
                                                                        child: Text(
                                                                            past.elementAt(0)[index][
                                                                                "about"],
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:const TextStyle(fontSize: 13, color: Colors.grey)),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Container(
                                                                              height: h / 14,
                                                                              width: w / 14,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, color: colors.primary.withOpacity(.1)),
                                                                              child:const Icon(Icons.call, color: Colors.green, size: 15)),
                                                                          Text(
                                                                            " ${AppLocalizations.of(context)!.voiceCall} :-  ",
                                                                            style:const TextStyle(
                                                                                color: Colors.black87,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 13),
                                                                          ),
                                                                          Text(
                                                                            past.elementAt(0)[index]["appointment_status"],
                                                                            style:const
                                                                                TextStyle(fontSize: 13, color: Colors.green),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                  },
                                ))),
                      ),
              )
              // Container(
              //   //color: Colors.white,
              //   height: h/1.1,width: w,
              //   child: ListView.builder(physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 20.0),
              //           child: Center(
              //             child: Material(borderRadius:  BorderRadius.circular(10),
              //               elevation: 2,
              //               shadowColor: Colors.white,
              //               child: Container(
              //                 padding: EdgeInsets.only(top: 10,bottom: 5),
              //                 child:
              //                 Row(children: [
              //                   SizedBox(width: w / 20,),
              //                   Padding(
              //                     padding: const EdgeInsets.only(bottom: 40),
              //                     child: CircleAvatar(backgroundImage:AssetImage("assets/images/beautiful-young-female-doctor-looking-camera-office_1301-7807-removebg-preview.png"),radius: 40),
              //                   ),
              //                   SizedBox(width: w/40),
              //                   Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Text("Mr.amir khan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              //                       Text("Gerenal doctor",style: TextStyle(color: Colors.grey)),
              //                       Text(DateTime.now().toString().substring(0,16)),
              //                       Row(
              //                         children: [
              //                           Container(
              //                               child: Icon(Icons.call,color: Colors.green,size: 15),
              //                               height: h/15,width: w/15,
              //                               decoration: BoxDecoration(shape: BoxShape.circle,color: colors.primary)),
              //                           Text(" Voice Call :-  "),
              //                           Text("Accept",style: TextStyle(color: Colors.green),)
              //                         ],
              //                       )
              //
              //                     ],
              //                   ),
              //                 ]),
              //
              //                 width: w / 1.2,
              //                 height: h / 6,
              //                 decoration: BoxDecoration(
              //
              //                     color:  Colors.white,
              //                     borderRadius: BorderRadius.circular(7)),
              //
              //               ),
              //             ),
              //           ),
              //         );
              //     },),
              // )
            ],
          ),
        ),
      ),
    );
  }

  reload() async {
    await Future.delayed(Duration(seconds: 2));
    pastcontroller.doctor_upcoming_history();
    pastcontroller.user_past_history();
  }
}
