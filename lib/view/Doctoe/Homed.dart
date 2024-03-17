import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:suivivital/view/Doctoe/profile/profile_controller.dart';
import 'package:suivivital/view/Doctoe/view_profile_doc_1.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller/doc_time_api.dart';
import 'api_controller/docetor_online_offline_set_api.dart';
import 'api_controller/patient_details_api.dart';
import 'api_controller/waiting_for_appointment.dart';
import 'notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final getprofile = Get.put(Profile_controller());
  final doc_time = Get.put(Doc_time_api());
  final waiting_app = Get.put(Wating_appoint_api());
  final d_on_off = Get.put(Doctor_on_off());
  final getpatient = Get.put(patientdetails());
  var user_image = postList.elementAt(0).data!.profileImage.toString();
  bool qwe = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: colors.logosec,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: FutureBuilder(
                  future: getprofile.prof(),
                  builder: (context, snapshot) =>
                      Obx(() => getprofile.isloading == true
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.to(() => View_profile_doc_1());
                              },
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                    "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/${user_image}"),
                              ),
                            ))),
            ),
            titleTextStyle: TextStyle(fontSize: 13),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => Notificatedoc());
                  },
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
            title: FutureBuilder(
              future: getprofile.prof(),
              builder: (context, snapshot) =>
                  Obx(() => getprofile.isloading == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.to(View_profile_doc_1());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postList.elementAt(0).data!.name.toString()),
                              Text(postList
                                  .elementAt(0)
                                  .data!
                                  .address
                                  .toString())
                            ],
                          ),
                        )),
            )),
        body: RefreshIndicator(
          displacement: 250,
          backgroundColor: Colors.yellow,
          color: Colors.red,
          strokeWidth: 3,
          onRefresh: () => qqq(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doctor Status ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      Obx(
                        () => Container(
                          height: h / 25,
                          child: LiteRollingSwitch(
                            width: 110,
                            //initial value
                            value: getprofile.tureorfalse.value,
                            textOn: 'Online',
                            textOff: 'Ofline',
                            colorOn: Colors.green,
                            colorOff: Colors.red,
                            textOnColor: Colors.white,
                            iconOn: CupertinoIcons.globe,
                            iconOff: Icons.close,
                            textSize: 16.0,
                            onChanged: (bool state) async {
                              var body1 = state == true
                                  ? "1".toString()
                                  : "0".toString();
                              await d_on_off.Doc_on_off(body1);
                            },
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: w / 50),
                  Text(
                    "Waiting for Appointment",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: w / 30),

                  StreamBuilder(
                    stream: Stream.periodic(Duration(seconds: 0))
                        .asyncMap((i) => waiting_app.get_pat_list()),
                    builder: (context, snapshot) => Obx(
                      () => waiting_app.pat_list.isEmpty
                          ? Text("No appointment")
                          : Container(
                              //height: h / 1.3,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 130.0),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: waiting_app.pat2_list.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10.0, bottom: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          getpatient.Getpatientdetailslist(
                                              waiting_app.pat2_list
                                                  .elementAt(index)["userid"],
                                              waiting_app.pat2_list
                                                  .elementAt(index)["id"],
                                              index);
                                        },
                                        child: Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            height: h / 3.9,
                                            width: w / 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                            child: Image.network(fit: BoxFit.fill,"${user_image_url}${waiting_app.pat2_list.elementAt(index)["users_image"]}")),
                                                      ),
                                                    ),
                                                    SizedBox(width: w / 40),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            waiting_app
                                                                    .pat2_list
                                                                    .elementAt(
                                                                        index)[
                                                                "user_name"],
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                            height: h / 160),
                                                        SizedBox(
                                                          // height: h / 25,
                                                          width: w / 2.3,
                                                          child: Text(
                                                              waiting_app.pat2_list
                                                                      .elementAt(
                                                                          index)[
                                                                  "about"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors
                                                                      .grey)),
                                                        ),
                                                        SizedBox(
                                                            height: h / 100),
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
                                                                        waiting_app.pat2_list.elementAt(index)[
                                                                            "booking_date"]
                                                                    // DateTime.now()
                                                                    //     .toString()
                                                                    //     .substring(0, 10)
                                                                    ,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)),
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
                                                                    " " +
                                                                        waiting_app.pat2_list.elementAt(index)[
                                                                            "booking_time"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)
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
                                                            Text(
                                                              " " +
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .voiceCall,style: TextStyle( fontWeight: FontWeight.w400,fontSize: 13),
                                                            ),
                                                            // Text(
                                                            //   "Accept",
                                                            //   style: TextStyle(
                                                            //       color: Colors.green),
                                                            // )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                                  SizedBox(height: h / 400),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          await waiting_app.reject(
                                                              waiting_app
                                                                      .pat2_list
                                                                      .elementAt(
                                                                          index)[
                                                                  "id"],
                                                              waiting_app
                                                                      .pat2_list
                                                                      .elementAt(
                                                                          index)[
                                                                  "userid"],
                                                              index);
                                                          waiting_app
                                                              .get_pat_list();
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2),
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                          width: w / 3,
                                                          height: h / 22,
                                                          child: Center(
                                                              child: Text(
                                                            "Canel",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      ),

                                                      //  Obx(() =>
                                                      // // waiting_app.yesno==index
                                                      //      waiting_app.isloading2==true?
                                                      //          Center(child: CircularProgressIndicator(),)
                                                      //          :
                                                      GestureDetector(
                                                        onTap: () async {
                                                          await waiting_app.accept(
                                                              waiting_app
                                                                      .pat2_list
                                                                      .elementAt(
                                                                          index)[
                                                                  "id"],
                                                              waiting_app
                                                                      .pat2_list
                                                                      .elementAt(
                                                                          index)[
                                                                  "userid"],
                                                              index);
                                                          waiting_app
                                                              .get_pat_list();
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: colors
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                          width: w / 3,
                                                          height: h / 22,
                                                          child: Center(
                                                              child:
                                                                  // waiting_app.ww
                                                                  // Center(child: CircularProgressIndicator(),):
                                                                  Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .accept,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
                ],
              ),
            ),
          ),
        ));
  }

  qqq() async {
    await Future.delayed(Duration(seconds: 2));
    waiting_app.get_pat_list();
  }
}
