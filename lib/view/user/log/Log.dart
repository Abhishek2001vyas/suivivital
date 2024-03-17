import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:suivivital/view/user/log/Log_entry.dart';
import 'package:suivivital/view/user/log/bolus_Advisior.dart';
import 'package:suivivital/view/user/log/charts.dart';
import 'package:suivivital/view/user/log/food.dart';
import 'package:suivivital/view/user/log/log_book.dart';
import 'package:suivivital/view/user/log/reminder.dart';

import '../../../custom_widget/drawer.dart';
import '../../../utils/color.dart';

class Log_of_user extends StatefulWidget {
  const Log_of_user({super.key});

  @override
  State<Log_of_user> createState() => _Log_of_userState();
}

class _Log_of_userState extends State<Log_of_user> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,

        title: Text("  " + AppLocalizations.of(context)!.userData,
            style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        // padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: h / 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(AppLocalizations.of(context)!.latestCheck,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.primary)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: h / 6.5,
                              width: w / 6.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.logosec,
                              ),
                              child: Center(
                                  child: Text(
                                "0 mmol/l",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Text(
                              AppLocalizations.of(context)!.other,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              radius: 45.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 12.0,
                              percent: .7,
                              center: Container(
                                height: h / 6,
                                width: w / 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Container(
                                    height: h / 6.5,
                                    width: w / 6.5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colors.logosec,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "   Est.0 Hba1c",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.yellow,
                              progressColor: Colors.red,
                            ),
                            SizedBox(
                              height: h / 20,
                            ),
                            Text(
                              AppLocalizations.of(context)!.daystrend,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: h / 6.5,
                              width: w / 6.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.logosec,
                              ),
                              child: Center(
                                  child: Text(
                                "0 U",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Text(
                              AppLocalizations.of(context)!.activeinsulin,
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: w / 1,
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Text(AppLocalizations.of(context)!.good,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colors.logosec)),
                  Text(AppLocalizations.of(context)!.startrecordinglucose,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colors.primary)),
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: h / 80),
            // Material(elevation: 2,borderRadius: BorderRadius.circular(15),
            //   child: Container(width: w/1,
            //     padding:EdgeInsets.all(15),
            //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Column(
            //           children: [
            //             Icon(Icons.water_drop,size: 30,color: colors.geryq1),
            //             SizedBox(
            //               height: h / 50,
            //             ),
            //             Text("Log Entry"),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Icon(Icons.grid_view_outlined,size: 30,color: colors.geryq1),
            //             SizedBox(
            //               height: h / 50,
            //             ),
            //             Text("Bolus Adviser"),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Icon(Icons.note_alt_outlined,size: 30,color: colors.geryq1),
            //             SizedBox(
            //               height: h / 50,
            //             ),
            //             Text("Log Book"),
            //           ],
            //         )
            //       ],),
            //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            //         ),),
            // )
            // ,
            SizedBox(
              height: h / 50,
            ),
            Container(
              height: h / 2.1,
              width: w / 1,
              child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(Log_entry());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.water_drop,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text("Log Entry"),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Bolus_Advisior());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.grid_view_outlined,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text("Bolus Adviser"),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Log_book());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.note_alt_outlined,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.logBook,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Food());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.fastfood,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.food,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.show_chart_outlined,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.graph,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Chart());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(CupertinoIcons.chart_pie_fill,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.charts,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(CupertinoIcons.mail,
                                  size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.report,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Reminder());
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.alarm, size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.reminders,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.cloud, size: 30, color: colors.geryq1),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                AppLocalizations.of(context)!.data,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   child: Material(
                    //     elevation: 2,
                    //     borderRadius: BorderRadius.circular(15),
                    //     child: Container(
                    //       padding: EdgeInsets.only(top: 30),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Colors.white,
                    //       ),
                    //       child: Center(
                    //           child: Column(
                    //         children: [
                    //           Icon(Icons.settings,
                    //               size: 30, color: colors.geryq1),
                    //           SizedBox(
                    //             height: h / 50,
                    //           ),
                    //           Text(
                    //             AppLocalizations.of(context)!.setting,
                    //           ),
                    //         ],
                    //       )),
                    //     ),
                    //   ),
                    // ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (5 / 5),
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10)),
            ),
            // GridView.count(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 03.0,
            //   mainAxisSpacing: 03.0,
            //   shrinkWrap: true,
            //   children: List.generate(
            //     8,
            //     (index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Container(
            //           child: Text("abh"),
            //           decoration: BoxDecoration(
            //             color: colors.logosec,
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(20.0),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      )),
    );
  }

  List grid_icon = [
    "cloud",
  ];
}
