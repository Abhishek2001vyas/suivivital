import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/custom_widget/drawer.dart';
import 'package:suivivital/utils/color.dart';
import 'package:suivivital/view/user/api_controller_user/graph_histroy_api.dart';
import 'package:suivivital/view/user/reminder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'Blood_Pressure/blood_pressure.dart';
import 'Blood_Sugar_Level/blood_level.dart';
import 'Body_Weight/body_weight.dart';
import 'Course/course.dart';
import 'graph_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Graph_page extends StatefulWidget {
  const Graph_page({super.key});

  @override
  State<Graph_page> createState() => _Graph_pageState();
}

class _Graph_pageState extends State<Graph_page> {
  final graph_his_api = Get.put(Graph_histroy_api());
  final graph_con = Get.put(Graph_controller());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text("Diabete Control"),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(const Reminder());
                    },
                    icon: const Icon(
                      Icons.alarm,
                      color: Colors.white,
                      size: 25,
                    ))
              ],
              backgroundColor: colors.logosec,
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              elevation: 0,
            ),
            drawer:
                const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endContained,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 25),
              child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        context: context,
                        builder: (context) => SizedBox(
                              // width: 60,
                              height: 270,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 60),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() => const Blood_Sugar());
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: w / 9,
                                                    height: h / 18.5,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .pink.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: const Icon(
                                                      Icons.water_drop_rounded,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Blood Sugar Level",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors
                                                            .grey.shade600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20, top: 60),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() => const Course());
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: w / 9,
                                                    height: h / 18.5,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .orange.shade800,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: const Icon(
                                                      Icons.thermostat,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "HbA1c Course",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors
                                                            .grey.shade600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 30, top: 60),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() => const Body_weight());
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: w / 9,
                                                    height: h / 18.5,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .purple.shade900,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Icon(
                                                      Icons.shopping_bag,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Body Weight",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors
                                                            .grey.shade600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => Blood_pressure());
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: w / 9,
                                              height: h / 18.5,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Icon(
                                                Icons.browse_gallery_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Blood Pressure",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.amber.shade400),
            ),
            body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: w,
                        height: h / 15,
                        color: colors.logosec,
                        child: TabBar(
                            automaticIndicatorColorAdjustment: true,
                            indicatorColor: Colors.white,
                            indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 4.0, color: Colors.white),
                            ),
                            tabs: const [
                              Text(
                                "Preview",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Help",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                      SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: SizedBox(
                            width: w,
                            height: h / 1,
                            child: TabBarView(children: [
                              SizedBox(
                                height: h / 2,
                                width: w,
                                child: Column(
                                  children: [
                                    Obx(
                                      () => graph_con.gra == 0
                                      // boold sugar
                                          ? Container(
                                              width: w,
                                              height: h / 2.2,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            top: 10,
                                                            right: 10),
                                                    child: Container(
                                                        height: h / 13,
                                                        width: w / 1,
                                                        padding: EdgeInsets
                                                            .only(
                                                                top: 5,
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: DropdownButton(
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                            underline:
                                                                const SizedBox(),
                                                            // Initial Value
                                                            value: dayget,
                                                            hint: Text('day'),
                                                            isExpanded: true,
                                                            // Down Arrow Icon
                                                            icon: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color: Colors
                                                                    .black,
                                                                size: 20),

                                                            // Array list of items
                                                            items: day.map(
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
                                                                dayget =
                                                                    newValue ??
                                                                        '';
                                                              });
                                                              dayget.toString() =="Today"?
                                                              graph_his_api.graphhistroy_bloodsugarday_api():
                                                              dayget.toString()== "Weekly"?
                                                              graph_his_api.graphhistroy_bloodsugarweekly_api():
                                                              dayget.toString()=="Monthy"?
                                                              graph_his_api.graphhistroy_bloodsugarmonthly_api() :
                                                              const Text("");


                                                            })),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      height: h / 3,
                                                      child: Sparkline(
                                                        data: bloodsuno,
                                                        // useCubicSmoothing: true,
                                                        // cubicSmoothingFactor: 1.0,
                                                        pointsMode:
                                                            PointsMode.all,
                                                        pointSize: 6.0,
                                                        pointColor:
                                                            Colors.amber,
                                                        // fillMode:
                                                        //     FillMode.below,
                                                        // fillColor:
                                                        //     colors.logosec,
                                                        // averageLabel: true,averageLine: true,
                                                        enableGridLines: true,
                                                      ),
                                                    ),
                                                    //
                                                    // SizedBox(height: h/15,width: w/1.2,
                                                    //   child:
                                                    //   SfSparkLineChart(
                                                    //     data: bloodsuno,
                                                    //     trackball: SparkChartTrackball(),
                                                    //
                                                    //     labelStyle: TextStyle(color: Colors.black,),
                                                    //     // axisLineColor: Colors.red,
                                                    //
                                                    //     marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
                                                    //
                                                    //     // pointsMode: PointsMode.all,
                                                    //     // pointSize: 8.0,
                                                    //     // pointColor: Colors.amber,
                                                    //   ),
                                                    // )
                                                    // SfCartesianChart(
                                                    //  //primaryXAxis:CategoryAxis(),
                                                    //   //legend: Legend(isVisible: true),
                                                    //
                                                    //   //tooltipBehavior: TooltipBehavior(enable: true,canShowMarker: true,),
                                                    //   //selectionType: LinearBorder.none,
                                                    //   series:
                                                    //   [
                                                    //     AreaSeries(
                                                    //         dataSource: bloodsuno,
                                                    //         xValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                    //         yValueMapper: (bloodsuno1, index) => bloodsuno1,)
                                                    //     // LineSeries(
                                                    //     // dataSource:(bloodsuno,bloodsuno1),
                                                    //     //       // yValueMapper: (bloodsuno, index) => bloodsuno,
                                                    //     //      yValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                    //     //      xValueMapper: (bloodsuno1, index) => bloodsuno1,
                                                    //     //       // Enable data label
                                                    //     //       dataLabelSettings: DataLabelSettings(isVisible: true),
                                                    //     //
                                                    //     // //yValueMapper: (double datum, int index) =>bloodsuno1,
                                                    //     //   )
                                                    //     ]
                                                    // )
                                                    // LineChartWidget(points),
                                                  ),
                                                ],
                                              )
                                      )
                                          : graph_con.gra == 1
                                      //body weight
                                              ? Container(
                                                  width: w,
                                                  height: h / 2.2,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10),
                                                          child: Container(
                                                              height: h / 13,
                                                              width: w / 1,
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 5,
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 5),
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                              ),
                                                              child: DropdownButton(
                                                                  style: const TextStyle(
                                                                      fontSize: 13,
                                                                      color:
                                                                      Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                                  underline:
                                                                  const SizedBox(),
                                                                  // Initial Value
                                                                  value: dayget,
                                                                  hint: const Text('day'),
                                                                  isExpanded: true,
                                                                  // Down Arrow Icon
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 20),

                                                                  // Array list of items
                                                                  items: day.map(
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
                                                                      dayget =
                                                                          newValue ??
                                                                              '';
                                                                    });
                                                                    dayget.toString() =="Today"?
                                                                    graph_his_api.body_weight_listday_api():
                                                                    dayget.toString()== "Weekly"?
                                                                    graph_his_api.body_weight_listdayweekly_api():
                                                                    dayget.toString()=="Monthy"?
                                                                    graph_his_api.body_weight_listdaymonthly_api() :
                                                                    const Text("");
                                                                  })),
                                                        ),
                                                        SizedBox(   height: h / 3,
                                                          child: Sparkline(
                                                            data: bloodwe,
                                                            //useCubicSmoothing: true,
                                                            //cubicSmoothingFactor: 0.2,
                                                            pointsMode:
                                                                PointsMode.all,
                                                            pointSize: 6.0,
                                                            pointColor:
                                                                Colors.amber,
                                                            // fillMode:
                                                            //     FillMode.below,
                                                            // fillColor:
                                                            //     colors.logosec,
                                                            // averageLabel: true,averageLine: true,
                                                            enableGridLines: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //
                                                  // SizedBox(height: h/15,width: w/1.2,
                                                  //   child:
                                                  //   SfSparkLineChart(
                                                  //     data: bloodsuno,
                                                  //     trackball: SparkChartTrackball(),
                                                  //
                                                  //     labelStyle: TextStyle(color: Colors.black,),
                                                  //     // axisLineColor: Colors.red,
                                                  //
                                                  //     marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
                                                  //
                                                  //     // pointsMode: PointsMode.all,
                                                  //     // pointSize: 8.0,
                                                  //     // pointColor: Colors.amber,
                                                  //   ),
                                                  // )
                                                  // SfCartesianChart(
                                                  //  //primaryXAxis:CategoryAxis(),
                                                  //   //legend: Legend(isVisible: true),
                                                  //
                                                  //   //tooltipBehavior: TooltipBehavior(enable: true,canShowMarker: true,),
                                                  //   //selectionType: LinearBorder.none,
                                                  //   series:
                                                  //   [
                                                  //     AreaSeries(
                                                  //         dataSource: bloodsuno,
                                                  //         xValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                  //         yValueMapper: (bloodsuno1, index) => bloodsuno1,)
                                                  //     // LineSeries(
                                                  //     // dataSource:(bloodsuno,bloodsuno1),
                                                  //     //       // yValueMapper: (bloodsuno, index) => bloodsuno,
                                                  //     //      yValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                  //     //      xValueMapper: (bloodsuno1, index) => bloodsuno1,
                                                  //     //       // Enable data label
                                                  //     //       dataLabelSettings: DataLabelSettings(isVisible: true),
                                                  //     //
                                                  //     // //yValueMapper: (double datum, int index) =>bloodsuno1,
                                                  //     //   )
                                                  //     ]
                                                  // )
                                                  // LineChartWidget(points),
                                                )
                                              : graph_con.gra == 2
                                      // hba1c
                                                  ? Container(
                                                      width: w,
                                                      height: h / 2.2,
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 10,
                                                                  right: 10),
                                                              child: Container(
                                                                  height: h / 13,
                                                                  width: w / 1,
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      top: 5,
                                                                      left: 10,
                                                                      right: 10,
                                                                      bottom: 5),
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(10),
                                                                  ),
                                                                  child: DropdownButton(
                                                                      style: const TextStyle(
                                                                          fontSize: 13,
                                                                          color:
                                                                          Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                      underline:
                                                                      const SizedBox(),
                                                                      // Initial Value
                                                                      value: dayget,
                                                                      hint: const Text('day'),
                                                                      isExpanded: true,
                                                                      // Down Arrow Icon
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          color: Colors
                                                                              .black,
                                                                          size: 20),

                                                                      // Array list of items
                                                                      items: day.map(
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
                                                                          dayget =
                                                                              newValue ??
                                                                                  '';
                                                                        });
                                                                        dayget.toString() =="Today"?
                                                                        graph_his_api.course_of_hba_1c_listday_api():
                                                                        dayget.toString()== "Weekly"?
                                                                        graph_his_api.course_of_hba_1c_listweekly_api():
                                                                        dayget.toString()=="Monthy"?
                                                                        graph_his_api.course_of_hba_1c_listmonthly_api() :
                                                                        const Text("");
                                                                      })),
                                                            ),
                                                            SizedBox(
                                                                height: h / 3,
                                                              child: Sparkline(
                                                                data: bloodhb1ac,
                                                                //useCubicSmoothing: true,
                                                                //cubicSmoothingFactor: 0.2,
                                                                pointsMode:
                                                                    PointsMode.all,
                                                                pointSize: 6.0,
                                                                pointColor:
                                                                    Colors.amber,
                                                                // fillMode:
                                                                //     FillMode.below,
                                                                // fillColor:
                                                                //     colors.logosec,
                                                                // averageLabel: true,averageLine: true,
                                                                enableGridLines:
                                                                    true,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //
                                                      // SizedBox(height: h/15,width: w/1.2,
                                                      //   child:
                                                      //   SfSparkLineChart(
                                                      //     data: bloodsuno,
                                                      //     trackball: SparkChartTrackball(),
                                                      //
                                                      //     labelStyle: TextStyle(color: Colors.black,),
                                                      //     // axisLineColor: Colors.red,
                                                      //
                                                      //     marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
                                                      //
                                                      //     // pointsMode: PointsMode.all,
                                                      //     // pointSize: 8.0,
                                                      //     // pointColor: Colors.amber,
                                                      //   ),
                                                      // )
                                                      // SfCartesianChart(
                                                      //  //primaryXAxis:CategoryAxis(),
                                                      //   //legend: Legend(isVisible: true),
                                                      //
                                                      //   //tooltipBehavior: TooltipBehavior(enable: true,canShowMarker: true,),
                                                      //   //selectionType: LinearBorder.none,
                                                      //   series:
                                                      //   [
                                                      //     AreaSeries(
                                                      //         dataSource: bloodsuno,
                                                      //         xValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                      //         yValueMapper: (bloodsuno1, index) => bloodsuno1,)
                                                      //     // LineSeries(
                                                      //     // dataSource:(bloodsuno,bloodsuno1),
                                                      //     //       // yValueMapper: (bloodsuno, index) => bloodsuno,
                                                      //     //      yValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                      //     //      xValueMapper: (bloodsuno1, index) => bloodsuno1,
                                                      //     //       // Enable data label
                                                      //     //       dataLabelSettings: DataLabelSettings(isVisible: true),
                                                      //     //
                                                      //     // //yValueMapper: (double datum, int index) =>bloodsuno1,
                                                      //     //   )
                                                      //     ]
                                                      // )
                                                      // LineChartWidget(points),
                                                    )
                                      //boold pressure
                                                  : Container(
                                                      width: w,
                                                      height: h / 2.2,
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 10,
                                                                  right: 10),
                                                              child: Container(
                                                                  height: h / 13,
                                                                  width: w / 1,
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      top: 5,
                                                                      left: 10,
                                                                      right: 10,
                                                                      bottom: 5),
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(10),
                                                                  ),
                                                                  child: DropdownButton(
                                                                      style: const TextStyle(
                                                                          fontSize: 13,
                                                                          color:
                                                                          Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                      underline:
                                                                      const SizedBox(),
                                                                      // Initial Value
                                                                      value: dayget,
                                                                      hint: const Text('day'),
                                                                      isExpanded: true,
                                                                      // Down Arrow Icon
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          color: Colors
                                                                              .black,
                                                                          size: 20),

                                                                      // Array list of items
                                                                      items: day.map(
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
                                                                          dayget =
                                                                              newValue ??
                                                                                  '';
                                                                        });
                                                                        dayget.toString() =="Today"?
                                                                        graph_his_api.blood_pressure_listday_api():
                                                                        dayget.toString()== "Weekly"?
                                                                        graph_his_api.blood_pressure_listdayweekly_api():
                                                                        dayget.toString()=="Monthy"?
                                                                        graph_his_api.blood_pressure_listdaymonthly_api() :
                                                                        const Text("");
                                                                      })),
                                                            ),
                                                            SizedBox(   height: h / 3,
                                                              child: Sparkline(
                                                                data: bloodpreno,
                                                                // useCubicSmoothing: true,
                                                                // cubicSmoothingFactor: 1.0,
                                                                pointsMode:
                                                                    PointsMode.all,
                                                                pointSize: 6.0,
                                                                pointColor:
                                                                    Colors.amber,
                                                                // fillMode:
                                                                //     FillMode.below,
                                                                // fillColor:
                                                                //     colors.logosec,
                                                                // averageLabel: true,averageLine: true,
                                                                enableGridLines:
                                                                    true,
                                                              ),
                                                              // SfCartesianChart(
                                                              //   //primaryXAxis:CategoryAxis(),
                                                              //   //legend: Legend(isVisible: true),
                                                              //
                                                              //   //tooltipBehavior: TooltipBehavior(enable: true,canShowMarker: true,),
                                                              //   //selectionType: LinearBorder.none,
                                                              //     series:
                                                              //     [
                                                              //       // AreaSeries(
                                                              //       //   dataSource: bloodsuno,
                                                              //       //   xValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                              //       //   yValueMapper: (bloodsuno1, index) => bloodsuno1,)
                                                              //       LineSeries(
                                                              //       dataSource:[
                                                              //
                                                              //       ],
                                                              //             // yValueMapper: (bloodsuno, index) => bloodsuno,
                                                              //            yValueMapper: (bloodsuno, index) =>bloodsuno ,
                                                              //            xValueMapper: (bloodsuno1, index) => bloodsuno1,
                                                              //             // Enable data label
                                                              //             dataLabelSettings: DataLabelSettings(isVisible: false),
                                                              //
                                                              //       //yValueMapper: (double datum, int index) =>bloodsuno1,
                                                              //         )
                                                              //     ]
                                                              // )
                                                              //hhhh
                                                              // Sparkline(
                                                              //   data: bloodpreno,
                                                              //   //useCubicSmoothing: true,
                                                              //   //cubicSmoothingFactor: 0.2,
                                                              //   pointsMode:
                                                              //       PointsMode.all,
                                                              //   pointSize: 6.0,
                                                              //   pointColor:
                                                              //       Colors.amber,
                                                              //   fillMode:
                                                              //       FillMode.below,
                                                              //   fillColor:
                                                              //       colors.logosec,
                                                              //   // averageLabel: true,averageLine: true,
                                                              //   enableGridLines:
                                                              //       true,
                                                              // ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //
                                                      // SizedBox(height: h/15,width: w/1.2,
                                                      //   child:
                                                      //   SfSparkLineChart(
                                                      //     data: bloodsuno,
                                                      //     trackball: SparkChartTrackball(),
                                                      //
                                                      //     labelStyle: TextStyle(color: Colors.black,),
                                                      //     // axisLineColor: Colors.red,
                                                      //
                                                      //     marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
                                                      //
                                                      //     // pointsMode: PointsMode.all,
                                                      //     // pointSize: 8.0,
                                                      //     // pointColor: Colors.amber,
                                                      //   ),
                                                      // )

                                                      // LineChartWidget(points),
                                                    ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: w,
                                      height: h / 12,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: w / 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                        width: w / 2.5,
                                                        child: Row(
                                                          children: [
                                                            Obx(() => graph_con
                                                                        .gra ==
                                                                    0
                                                                ? const Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: Colors
                                                                        .pink,
                                                                    size: 14,
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .circle_outlined,
                                                                    color: Colors
                                                                        .pink,
                                                                    size: 14,
                                                                  )),
                                                            SizedBox(
                                                              width: w / 50,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                graph_con
                                                                    .change_graph(
                                                                        0);
                                                              },
                                                              child: Text(
                                                                "Blood Sugar",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                              ),
                                                            ),
                                                          ],
                                                        )),

                                                    SizedBox(
                                                        width: w / 2.5,
                                                        child: Row(
                                                          children: [
                                                            Obx(() => graph_con
                                                                        .gra ==
                                                                    1
                                                                ? Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: Colors
                                                                        .purple
                                                                        .shade900,
                                                                    size: 14,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .circle_outlined,
                                                                    color: Colors
                                                                        .purple
                                                                        .shade900,
                                                                    size: 14,
                                                                  )),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                graph_con
                                                                    .change_graph(
                                                                        1);
                                                              },
                                                              child: Text(
                                                                "Body Weight",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: h / 60,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: w / 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                        width: w / 2.5,
                                                        child: Row(
                                                          children: [
                                                            Obx(() => graph_con
                                                                        .gra ==
                                                                    2
                                                                ? Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: Colors
                                                                        .orange
                                                                        .shade800,
                                                                    size: 14,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .circle_outlined,
                                                                    color: Colors
                                                                        .orange
                                                                        .shade800,
                                                                    size: 14,
                                                                  )),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                graph_con
                                                                    .change_graph(
                                                                        2);
                                                              },
                                                              child: Text(
                                                                "HbA1c Course",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                              ),
                                                            ),
                                                          ],
                                                        )),


                                                    SizedBox(
                                                        width: w / 2.5,
                                                        child: Row(
                                                          children: [
                                                            Obx(() => graph_con
                                                                        .gra ==
                                                                    3
                                                                ? const Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: Colors
                                                                        .green,
                                                                    size: 14,
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .circle_outlined,
                                                                    color: Colors
                                                                        .green,
                                                                    size: 14,
                                                                  )),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                graph_con
                                                                    .change_graph(
                                                                        3);
                                                              },
                                                              child: Text(
                                                                "Blood Pressure",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                    ),
                                    Container(
                                      width: w,
                                      height: h / 30,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          Text(
                                            "Last Check",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: w / 20,
                                          ),
                                          Text(
                                            "52mg/dL",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.purple.shade700),
                                          ),
                                          SizedBox(
                                            width: w / 20,
                                          ),
                                          Text(
                                            "9/27/23 15:41",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                    ),
                                    Container(
                                      width: w,
                                      height: h / 30,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          Text(
                                            "HbA1c:",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: w / 15,
                                          ),
                                          Text(
                                            "Not enough data to calculate HbA1c",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                    ),
                                    Container(
                                      width: w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: h / 40),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Advice",
                                                style: TextStyle(fontSize: 12)),
                                          ),
                                          SizedBox(
                                            height: h / 40,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Text(
                                                style: TextStyle(fontSize: 12),
                                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h,
                                width: w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      child: Container(
                                          height: h / 13,
                                          width: w / 1,
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              left: 10,
                                              right: 10,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // border: Border.all(
                                            //     color: Colors.grey, width: 1)),
                                          ),
                                          child: DropdownButton(
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                              underline: const SizedBox(),
                                              // Initial Value
                                              value: experciencess,
                                              hint: Text('experciences'),
                                              isExpanded: true,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.black,
                                                  size: 20),

                                              // Array list of items
                                              items: experciences
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                print(experciencess);
                                                print(newValue);
                                                setState(() {
                                                  experciencess =
                                                      newValue ?? '';
                                                });
                                                graph_his_api
                                                    .loaderstr(newValue!);
                                                print(experciencess);
                                              })),
                                    ),
                                    SizedBox(
                                      height: h / 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.purple,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          Text(
                                            "Hypoglycemia",
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: w / 60,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.blue,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          Text(
                                            "Weak",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: w / 60,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: w / 60,
                                          ),
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.orange,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          const Text(
                                            "Pupil",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: w / 60,
                                          ),
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          const Text(
                                            "Hyperglycemia",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 60,
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                    ),
                                    Obx(
                                        () =>
                                            graph_his_api.dropchange ==
                                                    "Blood Sugar Level"
                                                ? Container(
                                                    child: FutureBuilder(
                                                        future: graph_his_api
                                                            .graphhistroy_bloodsugar_api(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // if(snapshot.hasData) {
                                                          return Obx(() => graph_his_api
                                                                      .isloading1 ==
                                                                  true
                                                              ? const Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                )
                                                              : bloodsuno
                                                                      .isEmpty
                                                                  ? Center(
                                                                      child: Text(
                                                                          "No data"))
                                                                  : Container(
                                                                      height: h /
                                                                          1.5,
                                                                      child: ListView.builder(
                                                                          // physics: NeverScrollableScrollPhysics(),
                                                                          itemCount: bloodsu.elementAt(0).length,
                                                                          itemBuilder: (context, index) => Padding(
                                                                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                                                                child: Material(
                                                                                  elevation: 1,
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  child: Container(
                                                                                    height: h / 6,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(5.0),
                                                                                      child: Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Container(
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      Text(bloodsu.elementAt(0)[index]["date"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                      SizedBox(
                                                                                                        width: w / 50,
                                                                                                      ),
                                                                                                      Text(bloodsu.elementAt(0)[index]["hour"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  "${bloodsu.elementAt(0)[index]["concentration"].toString()} mg/dL",
                                                                                                  style: TextStyle(color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w700),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Text(bloodsu.elementAt(0)[index]["measure"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Text(bloodsu.elementAt(0)[index]["remark"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                    ));
                                                        }))
                                                : graph_his_api.dropchange ==
                                                        "HbA1c Course"
                                                    ? Container(
                                                        child: FutureBuilder(
                                                            future: graph_his_api
                                                                .course_of_hba_1c_list_api(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // if(snapshot.hasData) {
                                                              return Obx(() => graph_his_api
                                                                          .isloading2 ==
                                                                      true
                                                                  ? Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    )
                                                                  : bloodhb1ac
                                                                          .isEmpty
                                                                      ? Center(
                                                                          child:
                                                                              Text("No data"))
                                                                      : Container(
                                                                          height:
                                                                              h / 2,
                                                                          child: ListView.builder(
                                                                              physics: NeverScrollableScrollPhysics(),
                                                                              itemCount: hb1ac.elementAt(0).length,
                                                                              itemBuilder: (context, index) => Padding(
                                                                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                                                                    child: Material(
                                                                                      elevation: 1,
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      child: Container(
                                                                                        height: h / 15,
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(5.0),
                                                                                          child: Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          Text(hb1ac.elementAt(0)[index]["date"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                          SizedBox(
                                                                                                            width: w / 50,
                                                                                                          ),
                                                                                                          Text(hb1ac.elementAt(0)[index]["hour"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      "${hb1ac.elementAt(0)[index]["hba_1c"].toString()} %",
                                                                                                      style: const TextStyle(color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w400),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )),
                                                                        ));
                                                            }))
                                                    : graph_his_api
                                                                .dropchange ==
                                                            "Body Weight"
                                                        ? Container(
                                                            height: h / 1.2,
                                                            child:
                                                                FutureBuilder(
                                                                    future: graph_his_api
                                                                        .body_weight_list_api(),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // if(snapshot.hasData) {
                                                                      return Obx(() => graph_his_api.isloading3 ==
                                                                              true
                                                                          ? Center(
                                                                              child: CircularProgressIndicator(),
                                                                            )
                                                                          : bloodwe.isEmpty
                                                                              ? const Center(child: Text("No data"))
                                                                              : SizedBox(
                                                                                  height: h / 2,
                                                                                  child: ListView.builder(
                                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                                      itemCount: bodywe.elementAt(0).length,
                                                                                      itemBuilder: (context, index) => Padding(
                                                                                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                                                                            child: Material(
                                                                                              elevation: 1,
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                              child: Container(
                                                                                                height: h / 15,
                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(5.0),
                                                                                                  child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Row(
                                                                                                                children: [
                                                                                                                  Text(bodywe.elementAt(0)[index]["date"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                                  SizedBox(
                                                                                                                    width: w / 50,
                                                                                                                  ),
                                                                                                                  Text(bodywe.elementAt(0)[index]["hour"].toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              "${bodywe.elementAt(0)[index]["weight"].toString()} kg",
                                                                                                              style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w400, fontSize: 13),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          )),
                                                                                ));
                                                                    }))
                                                        : Container(
                                                            height: h / 2,
                                                            child:
                                                                FutureBuilder(
                                                                    future: graph_his_api
                                                                        .blood_pressure_list_api(),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // if(snapshot.hasData) {
                                                                      return Obx(() => graph_his_api.isloading4 ==
                                                                              true
                                                                          ? const Center(
                                                                              child: CircularProgressIndicator(),
                                                                            )
                                                                          : bloodpreno.isEmpty
                                                                              ? const Center(child: Text("No data"))
                                                                              : SizedBox(
                                                                                  height: h / 2,
                                                                                  child: ListView.builder(
                                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                                      itemCount: bloodpre.elementAt(0).length,
                                                                                      itemBuilder: (context, index) => Padding(
                                                                                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                                                                            child: Material(
                                                                                              elevation: 1,
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                              child: Container(
                                                                                                height: h / 15,
                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(5.0),
                                                                                                  child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Row(
                                                                                                                children: [
                                                                                                                  Text(bloodpre.elementAt(0)[index]["date"].toString(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                                  SizedBox(
                                                                                                                    width: w / 50,
                                                                                                                  ),
                                                                                                                  Text(bloodpre.elementAt(0)[index]["hour"].toString(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              child: Row(
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    bloodpre.elementAt(0)[index]["weight"].toString(),
                                                                                                                    style: const TextStyle(color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w400),
                                                                                                                  ),
                                                                                                                  const Text(
                                                                                                                    " /",
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    " ${bloodpre.elementAt(0)[index]["weight_2"].toString()} ",
                                                                                                                    style: const TextStyle(color: Colors.purple),
                                                                                                                  ),
                                                                                                                  const Text(
                                                                                                                    " mm/hg",
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          )),
                                                                                ));
                                                                    }))),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "About Diabetes",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: h / 40,
                                    ),
                                    const Text(
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        "Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Glucose is your body’s main source of energy. Your body can make glucose, but glucose also comes from the food you eat. Insulin is a hormone made by the pancreas that helps glucose get into your cells to be used for energy. If you have diabetes, your body doesn’t make enough—or any—insulin, or doesn’t use insulin properly. Glucose then stays in your blood and doesn’t reach your cells.")
                                  ],
                                ),
                              )
                            ]),
                          )),
                    ]))));
  }

  List<String> experciences = [
    'Blood Sugar Level',
    'HbA1c Course',
    'Body Weight',
    'Blood Pressure',
  ];
  String? experciencess = "Blood Sugar Level";
  List<String> day = [
    'Today',
    'Weekly',
    'Monthly',
  ];
  String dayget = "Today";
}
