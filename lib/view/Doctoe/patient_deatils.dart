import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import 'Homed.dart';
import 'api_controller/patient_details_api.dart';
import 'api_controller/waiting_for_appointment.dart';

class Patient_deatails extends StatefulWidget {
  final appoint_id;
  final index1;
  const Patient_deatails({super.key, this.appoint_id, this.index1});

  @override
  State<Patient_deatails> createState() => _Patient_deatailsState();
}

class _Patient_deatailsState extends State<Patient_deatails> {
  var yesno = 0;
  final getpatient = Get.put(patientdetails());
  final waiting_app = Get.put(Wating_appoint_api());
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
                                  Text(getpatient.Getpatientdetails.elementAt(0)["user_name"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("mobile",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(getpatient.Getpatientdetails.elementAt(0)["mobile"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("email",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 22),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(getpatient.Getpatientdetails.elementAt(0)["email"],style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("gender",style: TextStyle(fontSize: 13)),
                                  SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(getpatient.Getpatientdetails.elementAt(0)["gender"],style: TextStyle(fontSize: 13))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Problem"),
                                  SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Container(
                                      width: w / 1.7,
                                      child: Text(
                                        getpatient.Getpatientdetails.elementAt(0)["about"] ?? "null" ,
                                        textAlign: TextAlign.justify,softWrap: true,
                                        // maxLines: 3,
                                          style: TextStyle(fontSize: 13)
                                      )),

                              ]),
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
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /10,
                                      child: Text("Date")),
                                  // SizedBox(width: w / 14),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                 Text(getpatient.Getpatientdetails.elementAt(0)["booking_date"]),
                                  SizedBox(width: w / 40),
                                  Text(" ,  "),
                                  SizedBox(
                                      width: w /9,
                                      child: Text("Time")),
                                  // SizedBox(width: w / 40),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                 Text(getpatient.Getpatientdetails.elementAt(0)["booking_time"] ?? "0")
                                ],
                              ),
                              Text("blood sugar levels",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("concentration")),
                                  // SizedBox(width: w / 27),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                 Text(getpatient.Getpatientdetails.elementAt(0)["concentration"]+" mg/dl"),
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
                                  Text(getpatient.Getpatientdetails.elementAt(0)["measure"]),
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
                                  Text(getpatient.Getpatientdetails.elementAt(0)["blood_date"]+" / "+getpatient.Getpatientdetails.elementAt(0)["hour"]),
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
                                 Text(getpatient.Getpatientdetails.elementAt(0)["hba_1c"]?? "0"),
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
                                 Text("${getpatient.Getpatientdetails.elementAt(0)["course_date"]} / ${getpatient.Getpatientdetails.elementAt(0)["course_hour"]}"),
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
                                      Text(getpatient.Getpatientdetails.elementAt(0)["blood_weight"]??"0") ,
                      Text(" / "),
                      Text(  getpatient.Getpatientdetails.elementAt(0)["weight_2"]??"0")
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
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["diabetes_types"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("hypoglycemia")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["hypoglycemia"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("glucose high")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["glucose_high"]??""),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("hyperglycemia")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["hyperglycemia"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("rapid  short acting insulin")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["rapid_short_acting_insulin"]??""),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,
                                      child: Text("insulin pendose increments")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["insulin_pen_dose_increments"]??"null"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: w /3.5,child: Text("insulin pump")),
                                  Text(":"),
                                  SizedBox(width: w / 40),
                                  Text(  getpatient.Getpatientdetails.elementAt(0)["insulin_name"]??""),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          await waiting_app.reject(
                            widget.appoint_id ,
                              getpatient.Getpatientdetails.elementAt(0)["user_id"],widget.index1);
                          waiting_app.get_pat_list();
                          Get.to(Home());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 3,
                          height: h / 15,
                          child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          await waiting_app.accept(
                              widget.appoint_id ,
                              getpatient.Getpatientdetails.elementAt(0)["user_id"],widget.index1);
                          waiting_app.get_pat_list();
                          Get.to(Home());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 3,
                          height: h / 15,
                          child: Center(
                              child: Text(
                                "Accpet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    ],
                  ),
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
