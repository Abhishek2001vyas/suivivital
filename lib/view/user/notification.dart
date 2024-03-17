import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color.dart';
import 'api_controller_user/Notification.dart';

class Notificate extends StatefulWidget {
  const Notificate({super.key});

  @override
  State<Notificate> createState() => _NotificateState();
}

class _NotificateState extends State<Notificate> {
  final todaynn= Get.put(Getnotification());
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
          title: Text("Notification", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white))),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(future:todaynn.todaynot() , builder: (context, snapshot) {
                 if(todaynotlist.isNotEmpty)
                  { return
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today Notification",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              todaynn.resData["count"].toString() ,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        ListView.builder(physics
                        : NeverScrollableScrollPhysics(),
                          itemCount: todaynotlist.elementAt(0).length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: h / 15,
                                    width: w / 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage("assets/images/logo.jpeg"),
                                            radius: 20,
                                          ),
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          SizedBox(
                                              width: w / 2,
                                              child: Text(todaynotlist.elementAt(0)[index]["message"].toString(),style: TextStyle(fontSize: 12),)),
                                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(todaynotlist.elementAt(0)[index]["date"].toString(),style: TextStyle(fontSize: 10)),
                                              Text(todaynotlist.elementAt(0)[index]["time"].toString(),style: TextStyle(fontSize: 10)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            );

                          },
                                          ),

                        SizedBox(
                          height: h / 50,
                        ),

                      ],
                    );
                  }
                 else{ return
                  Text("")
                ;}
              },),


              FutureBuilder(future: todaynn.torrnot() , builder: (context, snapshot) {

              if  (tornotlist.isNotEmpty){
                return
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Yesterday Notification",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          todaynn.resData1["count"].toString() ,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    ListView.builder(physics: NeverScrollableScrollPhysics(),
                      itemCount: tornotlist.elementAt(0).length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: h / 15,
                                width: w / 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/logo.jpeg"),
                                        radius: 20,
                                      ),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      SizedBox(
                                          width: w / 1.8,
                                          child: Text(tornotlist.elementAt(0)[index]["message"].toString(),style: TextStyle(fontSize: 12),)),
                                      // SizedBox(
                                      //   width: w / 3,
                                      // ),
                                      Text(tornotlist.elementAt(0)[index]["time"].toString(),style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ],
                );}

              else{ return
                Text("")
              ;
                }

              },),
              
            
            ],
          ),
        ),
      ),
    );
  }
}
