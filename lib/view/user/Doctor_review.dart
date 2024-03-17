import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/book%20appointment/book_appoiment.dart';
import 'package:suivivital/view/user/review/review.dart';

import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/cancelappointment.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'api_controller_user/history_past_api.dart';
import 'history/history_user_controller.dart';
import 'home/home1.dart';

class Doctor_review extends StatefulWidget {
  final doctor_id;
final date;
final booktime;
final iindex;
final paname;
final paad;
final paabout;
  const Doctor_review({super.key, this.doctor_id, this.date, this.booktime, this.iindex, this.paname, this.paad,  this.paabout});

  @override
  State<Doctor_review> createState() => _Doctor_reviewState();
}

class _Doctor_reviewState extends State<Doctor_review> {
  final detailcontroller = Get.put(Review_detail());
  final pressController = Get.put(History_user());
  final User_reject = Get.put(Reject_user_api());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(  iconTheme:const IconThemeData(color: Colors.white),
          backgroundColor:colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(const Home1());
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          elevation: 0,
          title: const Text(
            "Doctor Review",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18),
          )),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: detailcontroller.detail_doctor_api_1(widget.doctor_id),
        builder: (context, snapshot) {
          return Obx(() => detailcontroller.isloading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SizedBox(height: h/10,width: w/4.5,
                              child:ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                    fit: BoxFit.fill,
                                    "${doctor_image_url.toString()}${details_review.elementAt(0)[0]["profile_image"]}"),
                              ),

                            ),
                          ),

                          SizedBox(width: w / 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. ${details_review.elementAt(0)[0]["name"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: h / 200),
                              //Text("Gerenal Physcian",style: TextStyle(color: Color(0xff6e7bf6)),),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Color(0xfffeba0c),
                                  ),
                                  SizedBox(width: w/80),
                                  Text(
                                    details_review.elementAt(0)[0]["rating"],
                                    style:
                                        const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                                  ),
                                  Text(
                                    "(${ details_review.elementAt(0)[0]["rating_count"]})",
                                    style: const TextStyle(color: Colors.grey,fontSize: 12),
                                  )
                                ],
                              ),
                              SizedBox(height: h / 200),
                              Row(
                                children: [
                                  const  Icon(
                                    Icons.business_center_sharp,
                                    size: 16,
                                    color: Colors.black26,
                                  ),SizedBox(width: w/80),
                                  Text(
                                    "${details_review.elementAt(0)[0]["experience"]} exp",
                                    style:const
                                        TextStyle(fontWeight: FontWeight.w400,fontSize: 13,),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: h / 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.grey,size: 20,
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Text(
                            AppLocalizations.of(context)!.doctorInformation,
                            style:const TextStyle(
                                //color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: h / 80),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              Text(AppLocalizations.of(context)!.name,
                                  style: const TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 13,
                              ),
                              const  Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text("${details_review.elementAt(0)[0]["name"]}",
          style:const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          SizedBox(height: h / 100),
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              const  Text("Address",
                                  style: TextStyle(fontSize: 13,color: Colors.black,)),
                              SizedBox(
                                width: w / 30,
                              ),
                              const   Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              SizedBox(
                                  width: w/2,
                                  child: Text("${details_review.elementAt(0)[0]["address"]}",overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                          SizedBox(height: h / 100),
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              Text(AppLocalizations.of(context)!.gender,
                                  style:const TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 19,
                              ),
                              const Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text(
                                  "${details_review.elementAt(0)[0]["gender"]}", style:const TextStyle(fontSize: 13),)
                            ],
                          ),
                          // SizedBox(height: h / 100),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: w / 12,
                          //     ),
                          //     Text(AppLocalizations.of(context)!.phone,
                          //         style: TextStyle(color: Colors.black)),
                          //     SizedBox(
                          //       width: w / 29,
                          //     ),
                          //     Text(":", style: TextStyle(color: Colors.black)),
                          //     SizedBox(
                          //       width: w / 40,
                          //     ),
                          //     Text("9876543212")
                          //   ],
                          // ),
                          SizedBox(height: h / 100),
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              Text(AppLocalizations.of(context)!.about,
                                  style:const TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 13,
                              ),
                              const  Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text("${details_review.elementAt(0)[0]["about"]}", style:const TextStyle(fontSize: 13),)
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: w / 12,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 35.0),
                          //       child: Text(AppLocalizations.of(context)!.about,
                          //           style: TextStyle(color: Colors.black)),
                          //     ),
                          //     SizedBox(
                          //       width: w / 25,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 35.0),
                          //       child:
                          //           Text(":", style: TextStyle(color: Colors.black)),
                          //     ),
                          //     SizedBox(
                          //       width: w / 40,
                          //     ),
                          //     Container(
                          //       width: w / 1.58,
                          //       child: Text(
                          //         "${details_review.elementAt(0)["about"]}",
                          //         //maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(height: h / 30),
                      Row(
                        children: [
                          const  Icon(
                            CupertinoIcons.clock,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Text(
                            AppLocalizations.of(context)!.visittime,
                            style:const TextStyle(
                                //color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: h / 80),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              const Text("Date",
                                  style: TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 13,
                              ),
                              const Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text("${widget.date}",
                                style:const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          SizedBox(height: h / 100),
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              const Text("Time",
                                  style: TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 15,
                              ),
                              const Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text("${widget.booktime}",style:const TextStyle(fontSize: 13),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: h / 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.grey,size: 20,
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          const Text(
                            "Patient information",
                            style: TextStyle(
                              //color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: h / 80),
                      // Patient information
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              Text(AppLocalizations.of(context)!.name,
                                  style:const TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 13,
                              ),
                              const Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              Text(widget.paname,
                                style:const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          SizedBox(height: h / 100),
                          Row(
                            children: [
                              SizedBox(
                                width: w / 12,
                              ),
                              Text(AppLocalizations.of(context)!.about,
                                  style:const TextStyle(color: Colors.black,fontSize: 13)),
                              SizedBox(
                                width: w / 13,
                              ),
                              const Text(":", style: TextStyle(color: Colors.black)),
                              SizedBox(
                                width: w / 40,
                              ),
                              SizedBox(
                                  width: w/2,
                                  child: Text(widget.paabout,
maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(fontSize: 13),))
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: w / 12,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 35.0),
                          //       child: Text(AppLocalizations.of(context)!.about,
                          //           style: TextStyle(color: Colors.black)),
                          //     ),
                          //     SizedBox(
                          //       width: w / 25,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 35.0),
                          //       child:
                          //           Text(":", style: TextStyle(color: Colors.black)),
                          //     ),
                          //     SizedBox(
                          //       width: w / 40,
                          //     ),
                          //     Container(
                          //       width: w / 1.58,
                          //       child: Text(
                          //         "${details_review.elementAt(0)["about"]}",
                          //         //maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(height: h / 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                           Text(
                            AppLocalizations.of(context)!.consultationFees,
                            style:const TextStyle(
                                //color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: h / 80),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 12,
                          ),
                          Text(AppLocalizations.of(context)!.fees,
                              style:const TextStyle(color: Colors.black,fontSize: 13)),
                          SizedBox(
                            width: w / 25,
                          ),
                          const Text(":", style: TextStyle(color: Colors.black)),
                          SizedBox(
                            width: w / 40,
                          ),
                          Text("CFA ${details_review.elementAt(0)[0]["fees_condition"]}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.green),)
                        ],
                      ),
                      SizedBox(height: h / 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.note_alt_outlined,
                            color: Colors.grey,size: 20,
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          const Text(
                            "Prescriptions",
                            style: TextStyle(
                                //color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: w / 2.5,
                          ),
                          IconButton(
                            icon:const Icon(
                              Icons.picture_as_pdf,
                              color: Colors.grey,size: 20,
                            ),
                            onPressed: () async{
                           await pressController.createpdf(widget.date,widget.booktime,widget.paname);
                            //    pressController.savepdf();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: h / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w / 2.3,
                            height: h / 15,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    side:const MaterialStatePropertyAll(BorderSide(
                                        color: Colors.red, width: 2)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {
                                 // Get.to(Book_appointment());
                                  Get.defaultDialog(
                                    title:  'Cancel Appointment',
                                    titleStyle:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                                    content:const Text('You want Cancel Appointment',style: TextStyle(fontSize: 13)),

                                    cancel:
                                    TextButton(
                                      //textColor: Colors.black,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child:const Text('CANCEL'),
                                    ),
                                    confirm: Obx(
                                          () => User_reject.isloading1 == true
                                          ?const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                          : TextButton(
                                        // textColor: Colors.black,
                                        onPressed: () async {
                                          User_reject.loader();
                                          await User_reject.rejectuser(
                                            upcoming.elementAt(0)[widget.iindex]["appoinment_id"],
                                              upcoming.elementAt(0)[widget.iindex]["doctor_id"]
                                          );
                                        },
                                        child:const Text('ACCEPT'),
                                      ),
                                    ),

                                  );
                                },
                                child:const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red),
                                )),
                          ),
                          SizedBox(
                            width: w / 2.3,
                            height: h / 15,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff4c5df4))),
                                onPressed: () {
                                  Get.to(Review(
                                    doctor_id: widget.doctor_id,
                                  ));
                                },
                                child: const Text(
                                  "Review",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                    ],
                  ),
                ));
        },
      )),
    );
  }
}
