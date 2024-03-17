import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/booking_time.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'api_controller_user/finddoctor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'api_controller_user/onlinedoctor_list_api.dart';
import 'book appointment/book_appoiment.dart';
import 'doctor_deatil.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final finddoctor = Get.put(Find_Doctor());
  final doctor_Details_api = Get.put(doctor_Details());
  final booking_time_api = Get.put(Book_time_api());
  TextEditingController search= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        // automaticallyImplyLeading: false,
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text(
          "search doctor",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(

        child:    Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(width: w/1.4,
                    child: TextFormField(
                      // textInputAction: TextInputAction.go,
                      controller: search,
                      onChanged: (value)async {
                        await finddoctor.searchdoctor(value.toString());
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search,
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                          fillColor: Colors.grey.shade300,
                          filled: true,

                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.filter_list,size: 40,))
                ],
              ),

              Obx(() =>
              finddoctor.isloading==true?
                  Center(child: CircularProgressIndicator(),):
                  FutureBuilder(

                future: null,
                builder: (context, snapshot) {

                  return
                    // snapshot.hasData?
                    searchlist.isEmpty?Text("no data"):
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: searchlist[0].data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10.0, bottom: 10),
                          child: GestureDetector(
                            onTap: () async {

                              await  doctor_Details_api.detail_doctor_api1(
                                  online_doctor
                                      .elementAt(0)
                                      .data!
                                      .elementAt(index)
                                      .id
                                      .toString());
                              Get.to(Doctor_deatils());
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
                                            CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    "${doctor_image_url.toString()}${searchlist[0].data!.elementAt(index).profileImage}"),
                                                radius: 26)
                                            ,
                                            SizedBox(
                                              width: w / 30,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: w / 2,
                                                  child: Text(
                                                    overflow: TextOverflow.ellipsis,
                                                    "Dr.${searchlist[0].data!.elementAt(index).name}",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  "${searchlist[0].data!.elementAt(index).profession}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff6e7bf6)),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      CupertinoIcons.location_solid,
                                                      size: 18,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      width: w / 2.1,
                                                      child: Text(
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        "${ searchlist[0].data!.elementAt(index).address}",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xff6e7682)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                                size: 18,
                                                color: Color(0xfffeba0c),
                                              ),
                                              Text(
                                                "${searchlist[0].data!.elementAt(index).rating}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "(${searchlist[0].data!.elementAt(index).ratingCount} rating)",
                                                style: const TextStyle(
                                                    color: Color(0xff777f8a)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.clock,
                                                size: 18,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                " ${searchlist[0].data!.elementAt(index).experience}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                " Exp",
                                                style: const TextStyle(
                                                    color: Color(0xff777f8a)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: w / 1,
                                        height: h / 20,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xff4c5df4))),
                                            onPressed: () async {
                                              var format = DateFormat('dd-MM-yyyy');
                                              var dateString =
                                              format.format(DateTime.now());
                                              await doctor_Details_api
                                                  .detail_doctor_api1(online_doctor
                                                  .elementAt(0)
                                                  .data!
                                                  .elementAt(index)
                                                  .id);
                                              await booking_time_api.booktiming(
                                                  details1.elementAt(0)["id"],
                                                  DateTime.now().weekday,
                                                  dateString.toString());
                                              Get.to(() => Book_appointment());
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!.booknow,
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
                    )
                        // :Text("loading")
                  ;

                  // ;
                },) )
             ,
            ],
          ),
        ),
      ),
    );
  }
}
