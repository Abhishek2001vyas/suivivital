import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color.dart';
import 'api_controller/Notification.dart';

class Notificatedoc extends StatefulWidget {
  const Notificatedoc({super.key});

  @override
  State<Notificatedoc> createState() => _NotificatedocState();
}

class _NotificatedocState extends State<Notificatedoc> {
  final todaynn= Get.put(Getdocotornotification());
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
                 if(todaynotdocolist.isNotEmpty)
                  { return
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today Notification",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        ListView.builder(physics
                        : NeverScrollableScrollPhysics(),
                          itemCount: todaynotdocolist.elementAt(0).length,
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
                                              child: Text(todaynotdocolist.elementAt(0)[index]["message"].toString(),style: TextStyle(fontSize: 12),)),
                                          // SizedBox(
                                          //   width: w / 3,
                                          // ),
                                          Text(todaynotdocolist.elementAt(0)[index]["time"].toString(),style: TextStyle(fontSize: 12)),
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

              if  (tornotdocolist.isNotEmpty){
                return
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yesterday Notification",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    ListView.builder(physics: NeverScrollableScrollPhysics(),
                      itemCount: tornotdocolist.elementAt(0).length,
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
                                          child: Text(tornotdocolist.elementAt(0)[index]["message"].toString(),style: TextStyle(fontSize: 12),)),
                                      // SizedBox(
                                      //   width: w / 3,
                                      // ),
                                      Text(tornotdocolist.elementAt(0)[index]["time"].toString(),style: TextStyle(fontSize: 12)),
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
                Text("");
                }

              },),
              
            
            ],
          ),
        ),
      ),
    );
  }
}
