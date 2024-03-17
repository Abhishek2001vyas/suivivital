import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suivivital/view/user/search.dart';
import '../../custom_widget/drawer.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/booking_time.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'api_controller_user/finddoctor.dart';
import 'api_controller_user/onlinedoctor_list_api.dart';
import 'api_controller_user/popualrdoctor_api.dart';
import 'book appointment/book_appoiment.dart';
import 'doctor_deatil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Find_doctor extends StatefulWidget {
  const Find_doctor({super.key});

  @override
  State<Find_doctor> createState() => _Find_doctorState();
}

class _Find_doctorState extends State<Find_doctor> {
  final doctor_Details_api = Get.put(doctor_Details());
  final booking_time_api = Get.put(Book_time_api());
  final finddoctor = Get.put(Find_Doctor());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // automaticallyImplyLeading: false,
        backgroundColor: colors.logosec,
        elevation: 0,
        title: const Text(
          "Find Doctor",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: w / 1.4,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        Get.to(()=>const Search());
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search,
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  PopupMenuButton(icon: Icon(Icons.filter_list),
                    onSelected: (value) {
                      value ==0?
                      finddoctor.rating():
                      value ==1?
                      finddoctor.exper()
                          :finddoctor.finddoctor();
                    },
                    itemBuilder: (context) {
                   return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("sort by rating"),
                      ),
                     const PopupMenuItem<int>(
                       value: 1,
                       child: Text("sort by Expercience"),
                     ),
                     const PopupMenuItem<int>(
                       value: 2,
                       child: Text("reset"),
                     ),
                    ];
                  },)
                ],
              ),

              FutureBuilder(
                future: finddoctor.finddoctor(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Obx(() =>
                  ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: finddoctor.finddocotrlist[0].data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10.0, bottom: 10),
                              child:

                              GestureDetector(
                                onTap: () async {
                                  await doctor_Details_api.detail_doctor_api1(
                                      finddoctor.finddocotrlist[0]
                                          .data!
                                          .elementAt(index)
                                          .id);
                                  Get.to(()=> const Doctor_deatils());
                                },
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    height: h / 4.5,
                                    width: w / 1.3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0,
                                          left: 11.7,
                                          right: 11.7,
                                          bottom: 10),
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
                                                  padding:
                                                  const EdgeInsets.only(top: 5.0),
                                                  child: SizedBox(
                                                    height: h / 10,
                                                    width: w / 4.5,
                                                    child: ClipRRect(
                                                      borderRadius: const BorderRadius.all(
                                                          Radius.circular(10)),
                                                      child: Image.network(
                                                          fit: BoxFit.fill,
                                                          "${doctor_image_url.toString()}${finddoctor.finddocotrlist[0].data!.elementAt(index).profileImage}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: w / 2.3,
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        "Dr.${finddoctor.finddocotrlist[0].data!.elementAt(index).name}",
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight.w600),

                                                      ),
                                                    ),
                                                    Text(
                                                      "${finddoctor.finddocotrlist[0].data!.elementAt(index).profession}",
                                                      style:const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400,
                                                          color: colors.geryq1),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          CupertinoIcons
                                                              .location_solid,
                                                          size: 16,
                                                          color: Colors.black26,
                                                        ),
                                                        SizedBox(
                                                          width: w / 2.5,
                                                          child: Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            "${finddoctor.finddocotrlist[0].data!.elementAt(index).address}",
                                                            style:const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                FontWeight.w400,
                                                                color: colors.geryq1),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.business_center_sharp,
                                                          size: 15,
                                                          color: Colors.black26,
                                                        ),
                                                        Text(
                                                          " ${finddoctor.finddocotrlist[0].data!.elementAt(index).experience}",
                                                          style:  const TextStyle(
                                                            color: Color(0xff777f8a),
                                                            fontSize: 13,
                                                          )),
                                                        Text(
                                                          " Exp",
                                                          style: const TextStyle(
                                                              color:
                                                              Color(0xff777f8a)),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ]),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Color(0xfffeba0c),
                                                  ),
                                                  Text(
                                                    "${finddoctor.finddocotrlist[0].data!.elementAt(index).rating}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "(${finddoctor.finddocotrlist[0].data!.elementAt(index).ratingCount} rating)",
                                                    style:  const TextStyle(
                                                        fontSize: 12,
                                                        color: Color(0xff777f8a)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: w / 1,
                                            height: h / 20,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color(
                                                                0xff4c5df4))),
                                                onPressed: () async {
                                                  var format =
                                                      DateFormat('dd-MM-yyyy');
                                                  var dateString = format
                                                      .format(DateTime.now());
                                                  await doctor_Details_api
                                                      .detail_doctor_api1(
                                                      finddoctor.finddocotrlist[0]
                                                              .data!
                                                              .elementAt(index)
                                                              .id
                                                              .toString());
                                                  await booking_time_api
                                                      .booktiming(
                                                          details1.elementAt(
                                                              0)["id"],
                                                          DateTime.now()
                                                              .weekday,
                                                          dateString
                                                              .toString());
                                                  Get.to(
                                                      () => Book_appointment());
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .booknow,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ))
                      : Text("loading");

                  ;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
