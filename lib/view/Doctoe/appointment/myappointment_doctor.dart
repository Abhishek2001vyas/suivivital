import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../api_controller/appoint_api.dart';
import 'appointment_contrtolleeeer.dart';

class Appointment_doc extends StatefulWidget {
  const Appointment_doc({super.key});

  @override
  State<Appointment_doc> createState() => _Appointment_docState();
}

class _Appointment_docState extends State<Appointment_doc> {
  // var his = 0;
  final pressController = Get.put(Appointment_controller());
  final appoint_api_Controller = Get.put(Appointment_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: const Text(
          "  " + "Appointment",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pressController.In(0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colors.primary, width: 2),
                            color: pressController.his == 0
                                ? colors.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        width: w / 3.5,
                        height: h / 15,
                        child: Center(
                            child: Text(
                          "Today",
                          style: TextStyle(
                              color: pressController.his == 0
                                  ? Colors.white
                                  : colors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pressController.In(1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colors.primary, width: 2),
                            color: pressController.his == 1
                                ? colors.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        width: w / 3.5,
                        height: h / 15,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.upcoming,
                          style: TextStyle(
                              color: pressController.his == 1
                                  ? Colors.white
                                  : colors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pressController.In(2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colors.primary, width: 2),
                            color: pressController.his == 2
                                ? colors.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        width: w / 3.5,
                        height: h / 15,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.past,
                          style: TextStyle(
                              color: pressController.his == 2
                                  ? Colors.white
                                  : colors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h / 20,
              ),

              Obx(() => pressController.his == 0
                  ?RefreshIndicator(
                //triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  displacement: 250,
                  backgroundColor: Colors.yellow,
                  color: Colors.red,
                  strokeWidth: 3,
                  onRefresh:()=>qqq() ,
                  child: FutureBuilder(
                        future: appoint_api_Controller.get_today(),
                        builder: (context, snapshot) => appoint_api_Controller
                                .today_list.isEmpty
                            ? Text("No appointment for today")
                            : Container(
                                height: h / 1.2,
                                width: w,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 130.0),
                                  child: ListView.builder(
                                    //physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    //scrollDirection: Axis.horizontal,
                                    itemCount: appoint_api_Controller.today_list
                                        .elementAt(0)
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10.0, bottom: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            //Get.to(Patient_deatails());
                                          },
                                          child: Material(
                                            elevation: 2,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              height: h / 5.2,
                                              width: w / 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    Row(children: [
                                                      SizedBox(
                                                        width: w / 20,
                                                      ),
                                                      SizedBox(
                                                        width: w/5,height: h/8,
                                                        child:
                                                        ClipRRect(borderRadius: BorderRadius.circular(10),
                                                            child: Image.network("${user_image_url}${appoint_api_Controller.today_list.elementAt(0)[index]["user_image"]}",fit: BoxFit.fill)),
                                                      ),


                                                      SizedBox(width: w / 40),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        // mainAxisAlignment:
                                                        // MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Text(
                                                              appoint_api_Controller
                                                                      .today_list
                                                                      .elementAt(
                                                                          0)[index]
                                                                  ["user_name"],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(
                                                              height: h / 160),
                                                          SizedBox(
                                                            // height: h/25,
                                                            width: w / 2.3,
                                                            child: Text(
                                                                appoint_api_Controller
                                                                        .today_list
                                                                        .elementAt(
                                                                            0)[index]
                                                                    ["about"],
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style: TextStyle(fontSize: 13,
                                                                    color: Colors
                                                                        .grey)),
                                                          ),
                                                          SizedBox(
                                                              height: h / 150),
                                                          Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .grey),
                                                                  Text(
                                                                      " " +
                                                                          appoint_api_Controller.today_list.elementAt(0)[index]
                                                                              [
                                                                              "booking_date"],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10)
                                                                      // DateTime.now()
                                                                      //     .toString()
                                                                      //     .substring(0, 10)
                                                                      ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  width: w / 30),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      CupertinoIcons
                                                                          .clock,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .grey),
                                                                  Text(
                                                                      " " + appoint_api_Controller.today_list.elementAt(0)[index]["booking_time"] ??
                                                                          "null",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10)
                                                                      // DateTime.now()
                                                                      //     .toString()
                                                                      //     .substring(11, 16)
                                                                      ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                  child: Icon(
                                                                      Icons.call,
                                                                      color: Colors
                                                                          .green,
                                                                      size: 14),
                                                                  height: h / 20,
                                                                  width: w / 20,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: colors
                                                                          .primary
                                                                          .withOpacity(
                                                                              .1))),
                                                              Text(" " +
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .voiceCall +
                                                                  " :-  ", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400)),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .accept,
                                                                style: TextStyle(fontSize: 13,
                                                                    color: Colors
                                                                        .green),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )

                                          ;
                                    },
                                  ),
                                ),
                              ),
                      ),
                  )
                  : pressController.his == 1
                      ?
              RefreshIndicator(
                //triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  displacement: 250,
                  backgroundColor: Colors.yellow,
                  color: Colors.red,
                  strokeWidth: 3,
                  onRefresh:()=>qqq() ,
                  child:
              FutureBuilder(
                          future: appoint_api_Controller.get_upcoming_list(),
                          builder: (context, snapshot) =>
                              appoint_api_Controller.upcoming_list.isEmpty
                                  ? Text("No appointment for upcoming")
                                  : Container(
                                      height: h / 1.2,
                                      width: w,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 130.0),
                                        child: ListView.builder(
                                          //physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          //scrollDirection: Axis.horizontal,
                                          itemCount: appoint_api_Controller
                                              .upcoming_list
                                              .elementAt(0)
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  right: 10.0,
                                                  bottom: 10),
                                              child: GestureDetector(
                                                onTap: () async{
                                                  await appoint_api_Controller
                                                      .get_upcoming_list;
                                                  appoint_api_Controller
                                                      .useridforpe(
                                                      appoint_api_Controller
                                                          .upcoming_list
                                                          .elementAt(
                                                          0)[index]
                                                      ["userid"],
                                                      appoint_api_Controller
                                                      .upcoming_list
                                                      .elementAt(
                                                      0)[index]
                                                  ["booking_date"],
                                                  appoint_api_Controller
                                                      .upcoming_list
                                                      .elementAt(
                                                  0)[index]
                                                  ["appointment_id"], index, );
                                                },
                                                child: Material(
                                                  elevation: 2,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Container(
                                                    height: h /5,
                                                    width: w / 2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              left: 10,
                                                              right: 10,
                                                              bottom: 10),
                                                      child: Column(
                                                        children: [
                                                          Row(children: [
                                                            SizedBox(
                                                              width: w / 20,
                                                            ),
                                                            SizedBox(
                                                              width: w/5,height: h/8,
                                                              child:
                                                              ClipRRect(borderRadius: BorderRadius.circular(10),
                                                                  child: Image.network("${user_image_url}${appoint_api_Controller.upcoming_list.elementAt(0)[index]["user_image"]}",fit: BoxFit.fill,)),
                                                              ),

                                                            SizedBox(
                                                                width: w / 40),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              // mainAxisAlignment:
                                                              // MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                    appoint_api_Controller
                                                                            .upcoming_list
                                                                            .elementAt(0)[index]
                                                                        [
                                                                        "user_name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                SizedBox(
                                                                    height: h /
                                                                        160),
                                                                SizedBox(
                                                                  // height: h/25,
                                                                  width:
                                                                      w / 2.3,
                                                                  child: Text(
                                                                      appoint_api_Controller
                                                                              .upcoming_list
                                                                              .elementAt(0)[index]
                                                                          [
                                                                          "about"],
                                                                      overflow: TextOverflow.ellipsis,
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: TextStyle(fontSize: 13,
                                                                          color:
                                                                              Colors.grey)),
                                                                ),
                                                                SizedBox(
                                                                    height: h /
                                                                        100),
                                                                Row(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                            Icons
                                                                                .calendar_today,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.grey),
                                                                        Text(
                                                                            " " +
                                                                                appoint_api_Controller.upcoming_list.elementAt(0)[index]["booking_date"],
                                                                            style: TextStyle(fontSize: 10)

                                                                            ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        width: w /
                                                                            30),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                            CupertinoIcons
                                                                                .clock,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.grey),
                                                                        Text(
                                                                            " " + appoint_api_Controller.upcoming_list.elementAt(0)[index]["booking_time"] ??
                                                                                "null",
                                                                            style:
                                                                                TextStyle(fontSize: 10)

                                                                            ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                        child: Icon(
                                                                            Icons
                                                                                .call,
                                                                            color: Colors
                                                                                .green,
                                                                            size:
                                                                                14),
                                                                        height: h /
                                                                            20,
                                                                        width: w /
                                                                            20,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: colors.primary.withOpacity(.1))),
                                                                    Text(" " +
                                                                        AppLocalizations.of(context)!
                                                                            .voiceCall +
                                                                        " :-  ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13)),
                                                                    Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .accept,
                                                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,
                                                                          color:
                                                                              Colors.green),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )


                                                ;
                                          },
                                        ),
                                      ),
                                    ))
              )
                      :
              RefreshIndicator(
                //triggerMode: RefreshIndicatorTriggerMode.onEdge,
                displacement: 250,
                backgroundColor: Colors.yellow,
                color: Colors.red,
                strokeWidth: 3,
                onRefresh:()=>qqq() ,
                child: FutureBuilder(
                            future: appoint_api_Controller.get_past_list(),
                            builder: (context, snapshot) =>
                                appoint_api_Controller.past_list.isEmpty
                                    ? Text("No appointment for past")
                                    : Container(
                                        height: h / 1.2,
                                        width: w,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 130.0),
                                          child: ListView.builder(
                                            //physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            //scrollDirection: Axis.horizontal,
                                            itemCount: appoint_api_Controller
                                                .past_list
                                                .elementAt(0)
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    right: 10.0,
                                                    bottom: 10),
                                                child: GestureDetector(
                                                  onTap: () async{
                                                    await appoint_api_Controller
                                                        .get_past_list;
                                                    appoint_api_Controller
                                                        .useridforpe(
                                                        appoint_api_Controller
                                                            .past_list
                                                            .elementAt(
                                                            0)[index]
                                                        ["userid"],
                                                        appoint_api_Controller
                                                        .past_list
                                                        .elementAt(
                                                        0)[index]
                                                    ["booking_date"],
                                                    appoint_api_Controller
                                                        .past_list
                                                        .elementAt(
                                                    0)[index]
                                                    ["appointment_id"], index, );
                                                  },
                                                  child: Material(
                                                    elevation: 2,
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                    child: Container(
                                                      height: h / 5,
                                                      width: w / 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10.0,
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 10),
                                                        child: Column(
                                                          children: [
                                                            Row(children: [
                                                              SizedBox(
                                                                width: w / 20,
                                                              ),
                                                              SizedBox(
                                                                width: w/5,height: h/8,
                                                                child:
                                                                ClipRRect(borderRadius: BorderRadius.circular(10),
                                                                    child: Image.network("${user_image_url}${appoint_api_Controller.past_list.elementAt(0)[index]["user_image"]}",fit: BoxFit.fill)),
                                                              ),

                                                              SizedBox(
                                                                  width: w / 40),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                // mainAxisAlignment:
                                                                // MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                      appoint_api_Controller
                                                                              .past_list
                                                                              .elementAt(0)[index]
                                                                          [
                                                                          "user_name"],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                      height: h /
                                                                          160),
                                                                  SizedBox(
                                                                    width:
                                                                        w / 2.3,
                                                                    child: Text(
                                                                        appoint_api_Controller
                                                                                .past_list
                                                                                .elementAt(0)[index]
                                                                            [
                                                                            "about"],
                                                                        overflow: TextOverflow.ellipsis,
                                                                        maxLines: 2,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .justify,
                                                                        style: TextStyle(fontSize: 13,
                                                                            color:
                                                                                Colors.grey)),
                                                                  ),
                                                                  SizedBox(
                                                                      height: h /
                                                                          100),
                                                                  Row(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                              Icons
                                                                                  .calendar_today,
                                                                              size:
                                                                                  15,
                                                                              color:
                                                                                  Colors.grey),
                                                                          Text(
                                                                              " " +
                                                                                  appoint_api_Controller.past_list.elementAt(0)[index]["booking_date"],
                                                                              style: TextStyle(fontSize: 10)
                                                                              // DateTime.now()
                                                                              //     .toString()
                                                                              //     .substring(0, 10)
                                                                              ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          width: w /
                                                                              30),
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                              CupertinoIcons
                                                                                  .clock,
                                                                              size:
                                                                                  15,
                                                                              color:
                                                                                  Colors.grey),
                                                                          Text(
                                                                              " " + appoint_api_Controller.past_list.elementAt(0)[index]["booking_time"] ??
                                                                                  "null",
                                                                              style:
                                                                                  TextStyle(fontSize: 10)
                                                                              // DateTime.now()
                                                                              //     .toString()
                                                                              //     .substring(11, 16)
                                                                              ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                          child: Icon(
                                                                              Icons
                                                                                  .call,
                                                                              color: Colors
                                                                                  .green,
                                                                              size:
                                                                                  13),
                                                                          height: h /
                                                                              20,
                                                                          width: w /
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              shape:
                                                                                  BoxShape.circle,
                                                                              color: colors.primary.withOpacity(.1))),
                                                                      Text(" " +
                                                                          AppLocalizations.of(context)!
                                                                              .voiceCall +
                                                                          " :-  ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13)),
                                                                      Text(
                                                                        AppLocalizations.of(
                                                                                context)!
                                                                            .accept,
                                                                        style: TextStyle(fontSize: 13,
                                                                            color:
                                                                                Colors.green),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ]),
                                                          ],
                                                        ),
                                                       ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                                  //   Padding(
                                                  //   padding: const EdgeInsets.only(
                                                  //       top: 10, right: 10.0, bottom: 10),
                                                  //   child: GestureDetector(
                                                  //     onTap: () {
                                                  //       // Get.to(Doctor_review());
                                                  //     },
                                                  //     child: Material(
                                                  //       elevation: 2,
                                                  //       borderRadius: BorderRadius.circular(15),
                                                  //       child: Container(
                                                  //         height: h / 5.75,
                                                  //         width: w / 2,
                                                  //         child: Padding(
                                                  //           padding: const EdgeInsets.only(
                                                  //               top: 10.0,
                                                  //               left: 15,
                                                  //               right: 15,
                                                  //               bottom: 10),
                                                  //           child: Row(children: [
                                                  //             SizedBox(
                                                  //               width: w / 20,
                                                  //             ),
                                                  //             Padding(
                                                  //               padding: const EdgeInsets.only(
                                                  //                   bottom: 40),
                                                  //               child: CircleAvatar(
                                                  //                   backgroundImage: AssetImage(
                                                  //                       "assets/images/beautiful-young-female-doctor-looking-camera-office_1301-7807-removebg-preview.png"),
                                                  //                   radius: 40),
                                                  //             ),
                                                  //             SizedBox(width: w / 40),
                                                  //             Column(
                                                  //               crossAxisAlignment:
                                                  //               CrossAxisAlignment.start,
                                                  //               mainAxisAlignment:
                                                  //               MainAxisAlignment.spaceAround,
                                                  //               children: [
                                                  //                 Text("Dr.Yashvardhan.s.s",
                                                  //                     style: TextStyle(
                                                  //                         fontSize: 18,
                                                  //                         fontWeight:
                                                  //                         FontWeight.bold)),
                                                  //                 Text("Gerenal doctor",
                                                  //                     style: TextStyle(
                                                  //                         color: Colors.grey)),
                                                  //                 Text(DateTime.now()
                                                  //                     .subtract(Duration(days: 1))
                                                  //                     .toString()
                                                  //                     .substring(0, 16)),
                                                  //                 Row(
                                                  //                   children: [
                                                  //                     Container(
                                                  //                         child: Icon(Icons.call,
                                                  //                             color: Colors.green,
                                                  //                             size: 17),
                                                  //                         height: h / 15,
                                                  //                         width: w / 15,
                                                  //                         decoration:
                                                  //                         BoxDecoration(
                                                  //                             shape: BoxShape
                                                  //                                 .circle,
                                                  //                             color: colors
                                                  //                                 .primary
                                                  //                                 .withOpacity(
                                                  //                                 .1))),
                                                  //                     Text(" Voice Call :-  "),
                                                  //                     Text(
                                                  //                       "Accept",
                                                  //                       style: TextStyle(
                                                  //                           color: Colors.green),
                                                  //                     )
                                                  //                   ],
                                                  //                 )
                                                  //               ],
                                                  //             ),
                                                  //           ]),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // )

                                                  ;
                                            },
                                          ),
                                        ),
                                      ),
                          ),
                      )),

            ],
          ),
        ),
      ),
    );
  }
  qqq()async{
    await Future.delayed(Duration(seconds: 2));
    appoint_api_Controller.get_today();
    appoint_api_Controller.get_upcoming_list();
    appoint_api_Controller.get_past_list();
  }
}
