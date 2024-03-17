import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'api_controller_user/popualrdoctor_api.dart';
import 'book appointment/book_appoiment.dart';
import 'doctor_deatil.dart';
import 'home/home1.dart';

class Popular_doctor_all extends StatefulWidget {
  const Popular_doctor_all({super.key});

  @override
  State<Popular_doctor_all> createState() => _Popular_doctor_allState();
}

class _Popular_doctor_allState extends State<Popular_doctor_all> {
  final popular_Doc_all_api = Get.put(popular_doctor_list());
  final doctor_Details_api = Get.put(doctor_Details());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff8f8fc),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(const Home1());
              },
              icon: const Icon(
                Icons.arrow_back,
                // color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.popularDoctor,
            style:
                TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 15, bottom: 20),
          child: Column(
            children: [
              FutureBuilder(future:popular_Doc_all_api.popular_doc() , builder: (context, snapshot) =>
                  Container(
                    height: h / 1.2,
                    width: w,
                    color: Color(0xfff8f8fc),
                    child: ListView.builder(
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: popualr_doctor.elementAt(0).data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10.0, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              doctor_Details_api.detail_doctor_api(popualr_doctor
                                  .elementAt(0)
                                  .data!
                                  .elementAt(index)
                                  .id
                                  .toString());
                            },
                            child: Material(
                              elevation: 2,
                              shadowColor: Color(0xfff8f8fc),
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: h / 4.5,
                                width: w / 1.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10, right: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: SizedBox(height: h/10,width: w/4.5,
                                                child:ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  child: Image.network(
                                                    fit: BoxFit.fill,
                                                      "${doctor_image_url.toString()}${popualr_doctor.elementAt(0).data!.elementAt(index).profileImage.toString()}"),
                                                ),

                                              ),
                                            )
                                            // Container(
                                            //     decoration: BoxDecoration(
                                            //         shape: BoxShape.circle,
                                            //         border: Border.all(
                                            //             color: Colors.green)),
                                            //     height: h / 10,
                                            //     width: w / 10,
                                            //     child: Icon(Icons.person))
                                            ,
                                            SizedBox(
                                              width: w / 30,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: w/2,
                                                  child: Text(
                                                   overflow:  TextOverflow.ellipsis,
                                                  // maxLines: 2,
                                                    "Dr.${popualr_doctor.elementAt(0).data!.elementAt(index).name.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  "${popualr_doctor.elementAt(0).data!.elementAt(index).profession.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: colors.geryq1),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.location_solid,
                                                      size: 16,
                                                      color: Colors.grey,
                                                    ),SizedBox(width: w/80),
                                                    SizedBox(width: w/2.1,
                                                      child: Text(overflow: TextOverflow.ellipsis,
                                                        "${popualr_doctor.elementAt(0).data!.elementAt(index).address.toString()}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(0xff6e7682)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons.business_center_sharp,
                                                      size: 15,
                                                      color: Colors.black26,
                                                    ),
                                                    SizedBox(width: w/80),
                                                    Text(
                                                      " ${popualr_doctor.elementAt(0).data!.elementAt(index).experience.toString()}",
                                                      style: TextStyle(
                                                          color: Color(0xff777f8a),
                                                        fontSize: 13,
                                                          ),
                                                    ),
                                                    Text(
                                                      " Exp  ",
                                                      style: TextStyle( fontSize: 13,
                                                          color: Color(0xff777f8a)),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ]),
                                      Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: h / 20,
                                            width: w / 4.5,
                                            decoration: BoxDecoration(
                                                color: Color(0xfffff5db),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                // SizedBox(width: w/20,),
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Color(0xfffeba0c),
                                                ),
                                                SizedBox(
                                                  child: Text(
                                                    "${popualr_doctor.elementAt(0).data!.elementAt(index).rating.toString()}",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  "(${popualr_doctor.elementAt(0).data!.elementAt(index).ratingCount.toString()})",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                      color: Color(0xff777f8a)),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: w/40,),
                                          Container(
                                            width: w / 1.7,
                                            height: h / 20,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10))),
                                                    backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(0xff4c5df4))),
                                                onPressed: () {
                                                  Get.to(Book_appointment());
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .booknow,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),),

            ],
          ),
        ),
      ),
    );
  }
}
