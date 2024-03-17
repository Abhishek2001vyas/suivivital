import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/Doctoe/add_prescription/Add_prescription.dart';
import 'package:suivivital/view/Doctoe/api_controller/patient_details_api.dart';

import '../../utils/color.dart';
import 'api_controller/getmedicinebydoctor.dart';
import 'navgation_bar.dart';

class Prescription extends StatefulWidget {
  final appointid;
  final indedx;
  final userid;
  const Prescription({super.key, this.appointid, this.indedx, this.userid, });

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final Getmedicinebydoctor_Controller = Get.put(Getmedicinebydoctor());
  final getpatient = Get.put(patientdetails());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: const Text(
          "Patient Prescription",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
        ),
      ),
      body:
      SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Search ...",
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7))),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  SizedBox(
                  height: h / 30,
                ),
                  PopupMenuButton(color: Colors.white,
                    // add icon, by default "3 dot" icon
                    // icon: Icon(Icons.book)
                      itemBuilder: (context){
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Text("Patient Deatils"),
                          ),
                        ];
                      },
                      onSelected:(value){
                    value ==0?
                     getpatient.Getpatientdetailslist(
                         widget.userid,widget.appointid,widget.indedx
                     )
                        :null;

                      }
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: colors.geryq1,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(()=>const Add_prescription());
                      },
                      child: Text(
                        "Add Medicienes",
                        style: TextStyle(color: colors.logosec),
                      ))
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              // Container(width: w / 1, height: h / 1.8),

              FutureBuilder(future: Getmedicinebydoctor_Controller.Getmedicinebydoctorlist(), builder: (context, snapshot) {
                return
                Obx(() =>
                Getmedicinebydoctor_Controller.isloading == true
                  ? Center(child: CircularProgressIndicator()):
                Getmedicinebydoctorforplistqq.isEmpty?
                    Text("No data")
                    :
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Getmedicinebydoctorforplistqq.elementAt(0).length,
                      itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Material(elevation: 2,borderRadius: BorderRadius.circular(5),
                        child: Container(height: h/2,width: w/1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child:
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10,bottom: 10),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: w/3,
                                        child: Text("Medicines name :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                    Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["medicines_name"].toString()),

                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                      SizedBox(
                                          width: w/3,
                                          child: Text("medicines dose :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                      Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["medicines_dose"].toString() +"mg"),
                                    ]),),
                                    // SizedBox(
                                    //   child: Row(children: [
                                    //     SizedBox(
                                    //         width: w/3,
                                    //         child: Text("medicines_brand :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                    //     Text("c"),
                                    //   ]),)

                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("medicines brand :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                      SizedBox(width: w/2.3,
                                          child: Text(
                                              overflow: TextOverflow.ellipsis,Getmedicinebydoctorforplistqq.elementAt(0)[index]["medicines_brand"].toString()),
                                      )
                                      ]),)

                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("days :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["days"].toString()),
                                      ]),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("eating :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["eating"].toString()),

                                      ]),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("week day :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["week_day"].toString()),
                                      ]),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("eating time :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["eating_time"].toString()),

                                      ]),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text("medicines days :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(Getmedicinebydoctorforplistqq.elementAt(0)[index]["medicines_days"].toString()),
                                      ]),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(children: [
                                        SizedBox(
                                            width: w/3,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "comment :- ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                        SizedBox(width: w/2.3,
                                            child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                Getmedicinebydoctorforplistqq.elementAt(0)[index]["comment"].toString())),

                                      ]),),


                                  ],
                                ),
                              ],
                            ),
                          ),),
                      ),
                    );
                },));

              },),
              SizedBox(
                height: h / 50,
              ),
              Container(
                width: w / 1,
                height: h / 15,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff4c5df4))),
                    onPressed: () {
                      Get.to(Nav_bar());
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              SizedBox(height: h / 30),
            ],
          ),
        ),
      ),
    );
  }
  var patdetils;
  List<String> ppee=[
    "Patient deatils",
  ];
}
