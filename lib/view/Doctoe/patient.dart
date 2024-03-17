import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller/appoint_api.dart';
import 'api_controller/video_call_token_get.dart';

class Patient_bar extends StatefulWidget {
  const Patient_bar({super.key});

  @override
  State<Patient_bar> createState() => _Patient_barState();
}

class _Patient_barState extends State<Patient_bar> {
  final appoint_api_Controller = Get.put(Appointment_api());
  final token = Get.put(Get_token());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          // centerTitle: true,
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
          // ],
          backgroundColor: colors.logosec,
          elevation: 0,
          // titleTextStyle:  TextStyle(fontSize: 13),
          title: Text(
            " Patient",
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
                Text(
                  AppLocalizations.of(context)!.today,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: w / 50),

                RefreshIndicator(
                  //triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  displacement: 250,
                  backgroundColor: Colors.yellow,
                  color: Colors.red,
                  strokeWidth: 3,
                  onRefresh: () => qqq(),
                  child: FutureBuilder(
                    future: appoint_api_Controller.get_today(),
                    builder: (context, snapshot) => Obx(
                      () => appoint_api_Controller.isloading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : appoint_api_Controller.today_list.isEmpty
                              ? Text("No appointment for today")
                              : Container(
                                  height: h / 1.05,
                                  width: w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 200.0),
                                    child: ListView.builder(
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      //scrollDirection: Axis.horizontal,
                                      itemCount: appoint_api_Controller
                                          .today_list
                                          .elementAt(0)
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 10.0, bottom: 10),
                                          child: GestureDetector(
                                            onTap: () async {
                                              await appoint_api_Controller
                                                  .get_today;
                                              appoint_api_Controller
                                                  .useridforpe(
                                                      appoint_api_Controller
                                                              .today_list
                                                              .elementAt(
                                                                  0)[index]
                                                          ["userid"],
                                                      appoint_api_Controller
                                                              .today_list
                                                              .elementAt(
                                                                  0)[index]
                                                          ["booking_date"],
                                                appoint_api_Controller
                                                    .today_list
                                                    .elementAt(
                                                    0)[index]
                                                ["appointment_id"], index,


                                              );

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
                                                        Padding(
                                                          padding: const EdgeInsets.only(bottom: 5.0),
                                                          child: SizedBox(
                                                            width: w/5,height: h/8,
                                                            child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(10),
                                                                child: Image.network(fit: BoxFit.fill,"${user_image_url}${appoint_api_Controller.today_list.elementAt(0)[index]["user_image"]}")),
                                                          ),
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
                                                                    [
                                                                    "user_name"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            SizedBox(
                                                                height:
                                                                    h / 160),
                                                            SizedBox(
                                                              // height: h / 25,
                                                              width: w / 2.3,
                                                              child: Text(
                                                                  appoint_api_Controller
                                                                          .today_list
                                                                          .elementAt(
                                                                              0)[index]
                                                                      ["about"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    h / 100),
                                                            Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        size:
                                                                            16,
                                                                        color: Colors
                                                                            .grey),
                                                                    Text(
                                                                      " " +
                                                                          appoint_api_Controller
                                                                              .today_list
                                                                              .elementAt(0)[index]["booking_date"],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11),
                                                                      // DateTime.now()
                                                                      //     .toString()
                                                                      //     .substring(0, 10)
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        w / 30),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                        CupertinoIcons
                                                                            .clock,
                                                                        size:
                                                                            16,
                                                                        color: Colors
                                                                            .grey),
                                                                    Text(
                                                                      " " + appoint_api_Controller.today_list.elementAt(0)[index]["booking_time"] ??
                                                                          "null",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11),
                                                                      // DateTime.now()
                                                                      //     .toString()
                                                                      //     .substring(11, 16)
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height:  h/50),
                                                            Row(
                                                              children: [
                                                                // Container(
                                                                //     child: Icon(
                                                                //         Icons
                                                                //             .call,
                                                                //         color: Colors
                                                                //             .green,
                                                                //         size:
                                                                //             14),
                                                                //     height:
                                                                //         h / 20,
                                                                //     width:
                                                                //         w / 20,
                                                                //     decoration: BoxDecoration(
                                                                //         shape: BoxShape
                                                                //             .circle,
                                                                //         color: colors
                                                                //             .primary
                                                                //             .withOpacity(.1))),

                                                                GestureDetector(onTap: (){
                                                                  token.gettoken(
                                                                      appoint_api_Controller
                                                                          .today_list
                                                                          .elementAt(
                                                                          0)[index]
                                                                      ["userid"] ,  appoint_api_Controller
                                                                      .today_list
                                                                      .elementAt(0)[index]["booking_date"]);
                                                                },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(color:colors.primary ,
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        border: Border.all(width: 2,color: colors.primary)),
                                                                    height: h/22,width: w/2
                                                                  ,child: Center(child: Text("Video Call",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700,)),),
                                                                  ),
                                                                ),
                                                                // TextButton(
                                                                //     onPressed:
                                                                //         () {
                                                                //       print(
                                                                //           "doneeeeee");
                                                                //       token.gettoken(
                                                                //           appoint_api_Controller
                                                                //               .today_list
                                                                //               .elementAt(
                                                                //               0)[index]
                                                                //           ["userid"] ,  appoint_api_Controller
                                                                //       .today_list
                                                                //       .elementAt(0)[index]["booking_date"]);
                                                                //     },
                                                                //     child: Text(
                                                                //         "voiceCall")),
                                                                // Text(
                                                                //   AppLocalizations.of(
                                                                //           context)!
                                                                //       .accept,
                                                                //   style: TextStyle(
                                                                //       color: Colors
                                                                //           .green),
                                                                // )
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ));
  }

  qqq() async {
    await Future.delayed(Duration(seconds: 2));
    appoint_api_Controller.get_today();
  }
}
