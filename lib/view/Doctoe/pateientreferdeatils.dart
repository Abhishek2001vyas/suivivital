import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import 'Homed.dart';
import 'api_controller/clinicanpatient.dart';
import 'api_controller/patient_details_api.dart';
import 'api_controller/waiting_for_appointment.dart';

class patientreferde extends StatefulWidget {
final indexx;
  const patientreferde({super.key, this.indexx, });

  @override
  State<patientreferde> createState() => _patientreferdeState();
}

class _patientreferdeState extends State<patientreferde> {
  final ListssController = Get.put(Clinicanpatient());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text(
          " Patient Deatils",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child:
        Obx(() =>
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: w / 1,
                        height: h / 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 10, right: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text("Name",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 27),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]
                                  [
                                  "user_name"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("mobile",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["mobile"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("email",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 22),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["email"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("gender",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["gender"],style: TextStyle(fontSize: 13))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: h / 50,
                  ),
                  Text(
                    "Log Entry",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: w / 1,
                        height: h / 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 10, right: 15, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("blood sugar levels",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("concentration")),
                                  // SizedBox(width: w / 27),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["concentration"]??"0"+" mg/dl"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("measure")),
                                  // SizedBox(width: w / 6.3),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["measure"]??"0"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("date / hour")),
                                  // SizedBox(width: w / 11),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["blood_date"]??"0"
                                      +
                                      " / "
                                      +
                                      ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["hour"].toString()?? "0"+"  "
                                  ),
                                ],
                              ),

                              Text("HBA1C course",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("hba1c")),
                                  // SizedBox(width: w / 13.9),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["hba_1c"]?? "0"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("date / hour")),
                                  // SizedBox(width: w / 11),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text("${ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["course_date"]} / ${ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["course_hour"]}"),
                                ],
                              ),

                              Text("Blood pressure",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("Weight 1 / Weight 2")),
                                  // SizedBox(width: w / 11),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Row(
                                      children: [
                                        Text(ListssController
                                            .listpatientrefer
                                            .elementAt(0)[widget.indexx]["blood_weight"]??"0") ,
                                        Text(" / "),
                                        Text(  ListssController
                                            .listpatientrefer
                                            .elementAt(0)[widget.indexx]["weight_2"]??"0")
                                      ] ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: h / 50,
                  ),
                  Text(
                    "Data",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: w / 1,
                        height: h / 2.5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 10, right: 15, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("diabetes types")),
                                  // SizedBox(width: w / 27),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["diabetes_types"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("hypoglycemia")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["hypoglycemia"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("glucose high")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text( ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["glucose_high"]??""),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("hyperglycemia")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["hyperglycemia"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("rapid  short acting insulin")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["rapid_short_acting_insulin"]??""),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("insulin pendose increments")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["insulin_pen_dose_increments"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("insulin pump")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  ListssController
                                      .listpatientrefer
                                      .elementAt(0)[widget.indexx]["insulin_name"]??""),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: h / 50,
                  ),

                ],
              ),
            ),
        ),

      ),
    );
  }
}
