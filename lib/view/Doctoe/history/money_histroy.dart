import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../api_controller/history_api.dart';
import 'history_doc_controller.dart';

class Money_history extends StatefulWidget {
  const Money_history({super.key});

  @override
  State<Money_history> createState() => _Money_historyState();
}

class _Money_historyState extends State<Money_history> {
  final pressController = Get.put(History_doc());
  final wallet_api = Get.put(Histroy_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: colors.logosec,
          elevation: 0,
          // titleTextStyle:  TextStyle(fontSize: 13),
          title: Obx(
            () => Text(
              pressController.his == 0 ? "    Wallet" : "    Call",
              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {

                        pressController.In(0);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.primary, width: 2),
                              color: pressController.his == 0
                                  ? colors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 2.5,
                          height: h / 15,
                          child: Center(
                              child: Text(
                            "Wallet",
                            style: TextStyle(
                                color: pressController.his == 0
                                    ? Colors.white
                                    : colors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        pressController.In(1);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.primary, width: 2),
                              color: pressController.his == 1
                                  ? colors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: w / 2.5,
                          height: h / 15,
                          child: Center(
                              child: Text(
                            "Call",
                            style: TextStyle(
                                color: pressController.his == 1
                                    ? Colors.white
                                    : colors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      )),
                ],
              ),
              Obx(() {
                return pressController.his == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h / 50,
                          ),
                          Center(
                            child: Text("Current Balance",
                                style: TextStyle(fontSize: 14)),
                          ),
                          SizedBox(
                            height: h / 50,
                          ),
                          FutureBuilder(future: wallet_api.history_wallet_balanace(),
                              builder: (context, snapshot) =>

                              Obx(()=>
                              wallet_api.isloading1==true?
                              Center(child: CircularProgressIndicator(),):
                              Center(
                                child: Text("CFA ${wallet_api.wallet_balance.elementAt(0)[0]["current_balance"]??"0"} ",
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.bold)),
                              ))
                                 ,)
                         ,
                          SizedBox(
                            height: h / 50,
                          ),
                          Center(
                            child: Container(
                              width: w / 2,
                              height: h / 15,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff4c5df4))),
                                  onPressed: () {},
                                  child: Text(
                                    "Withdraw",
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: h / 40,
                          ),
                          Text(
                            "All Transaction",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h / 60,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.8),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 2,
                                  child: Container(
                                    height: h / 11,
                                    width: w / 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13.0,
                                          top: 10,
                                          right: 15,
                                          bottom:9.7),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [

                                              CircleAvatar(
                                                radius: 19,
                                                 backgroundImage: AssetImage("assets/images/logo.jpeg"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          SizedBox( width: w / 2,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 0),
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Received from",
                                                      style: TextStyle(
                                                          fontSize: 13)),
                                                  SizedBox(
                                                    height: h / 200,
                                                  ),
                                                  Text("Amir ali",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "CFA 200",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14),
                                              ),
                                              Text("2023-09-10",
                                                  style:
                                                      TextStyle(fontSize: 9)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: h / 50,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                        child: ExpansionTile(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("patient id : 001",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text("Mobile +919876543212",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                  "Incomming call,10 mins 40 sec",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                        )
                                      ],
                                      title: Row(
                                        children: [
                                          Icon(Icons.call_received,
                                              color: Colors.grey, size: 24),
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          Text("Mr.amir ali khan",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ))),
                              );
                            },
                          )
                        ],
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
