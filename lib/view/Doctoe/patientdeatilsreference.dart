import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:suivivital/view/Doctoe/pateientreferdeatils.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller/clinicanpatient.dart';
import 'api_controller/clinicanpatient.dart';



class Patient_reference extends StatefulWidget {
  const Patient_reference({super.key});

  @override
  State<Patient_reference> createState() => _Patient_referenceState();
}

class _Patient_referenceState extends State<Patient_reference> {
  final ListssController = Get.put(Clinicanpatient());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: Text(
          "Patient reference",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          RefreshIndicator(
          //triggerMode: RefreshIndicatorTriggerMode.onEdge,
          displacement: 250,
          backgroundColor: Colors.yellow,
          color: Colors.red,
          strokeWidth: 3,
          onRefresh:()=>qqq() ,
          child: FutureBuilder(
            future: ListssController.Addcclin_api(),
            builder: (context, snapshot) =>
            ListssController.listpatientrefer.isEmpty
                ? Text("No data")
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
                  itemCount: ListssController
                      .listpatientrefer
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
                          // await ListssController
                          //     .Addcclin_api();
                          // ListssController
                          //     .useridforpe(
                          //   ListssController
                          //       .listpatientrefer
                          //       .elementAt(
                          //       0)[index]
                          //   ["userid"],
                          //   ListssController
                          //       .listpatientrefer
                          //       .elementAt(
                          //       0)[index]
                          //   ["booking_date"],
                          //   ListssController
                          //       .listpatientrefer
                          //       .elementAt(
                          //       0)[index]
                          //   ["appointment_id"], index, );
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
                                          child: Image.network("${user_image_url}${ListssController.listpatientrefer.elementAt(0)[index]["image"]}",fit: BoxFit.fill)),
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
                                        Row(
                                          children: [
                                            Text(
                                                ListssController
                                                    .listpatientrefer
                                                    .elementAt(0)[index]
                                                [
                                                "user_name"],
                                                style: TextStyle(
                                                    fontSize:
                                                    16,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            SizedBox(width: w/3,),
                                            PopupMenuButton(color: Colors.white,iconSize: 20,
                                                itemBuilder: (context){
                                                  return [
                                                    PopupMenuItem<int>(
                                                      value: 0,
                                                      child: Text("Patient Deatils"),
                                                    ),
                                                  ];
                                                },
                                                onSelected:(value){
                                               value==0 ?
                                               Get.to(patientreferde(indexx: index,)):null;
                                                }
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: h /
                                                160),
                                        SizedBox(
                                          width:
                                          w / 2.3,
                                          child: Text(
                                              ListssController
                                                  .listpatientrefer
                                                  .elementAt(0)[index]
                                              ["address"],
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
                                                        ListssController.listpatientrefer.elementAt(0)[index]["dob"]??"null",
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
                                                    CupertinoIcons.person,
                                                    size:
                                                    15,
                                                    color:
                                                    Colors.grey),
                                                Text(
                                                    " " + ListssController.listpatientrefer.elementAt(0)[index]["gender"] ??
                                                        "null",
                                                    style:
                                                    TextStyle(fontSize: 10)

                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: h/100,),
                                        Row(
                                          children: [
                                            Text("Diabetes types : -",
                                              style: TextStyle(fontSize: 12),),
                                            Text(" "+ListssController.listpatientrefer.elementAt(0)[index]["diabetes_types"],
                                              style: TextStyle(fontSize: 12),)

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

          ],
        ),
      ),
    );
  }
  qqq()async{
    await Future.delayed(Duration(seconds: 2));

  }
}
