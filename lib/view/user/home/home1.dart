import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suivivital/utils/constant.dart';
import 'package:suivivital/view/user/book%20appointment/book_appoiment.dart';
import 'package:suivivital/view/user/near_by_pharmacy.dart';
import 'package:suivivital/view/user/online_doctor.dart';
import 'package:suivivital/view/user/popular_doctor_all.dart';
import '../../../custom_widget/drawer.dart';
import '../../../utils/color.dart';
import '../api_controller_user/booking_time.dart';
import '../api_controller_user/doctor_detatil.dart';
import '../api_controller_user/getslider.dart';
import '../api_controller_user/nearpharmancy.dart';
import '../api_controller_user/onlinedoctor_list_api.dart';
import '../api_controller_user/popualrdoctor_api.dart';
import '../doctor_deatil.dart';
import '../notification.dart';
import '../pharmacy_details.dart';
import 'home_user_controller.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final location_get = Get.put(Home_user());
  final get_onlin_doc = Get.put(Online_doctor_list());
  final doctor_Details_api = Get.put(doctor_Details());
  final booking_time_api = Get.put(Book_time_api());
  final popular_doctor = Get.put(popular_doctor_list());

// var online_doc_list_shortcut= 'online_doctor.elementAt(0).data!.elementAt(index)';
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.currentlocation,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                      width: w / 1.85,
                      child: Obx(
                        () => Text(
                            maxLines: 2,
                            location_get.currentAddress.value ??
                                "select location",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      )),
                  // Icon(
                  //   Icons.keyboard_arrow_down,
                  //   color: Colors.white,
                  // )
                ],
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const Notificate());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      )),
                  height: h / 6,
                  width: w / 11,
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.search,
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7))),
              ),
              SizedBox(
                height: h / 30,
              ),
              Text(
                AppLocalizations.of(context)!.featuredServices,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: h / 30,
              ),
              Container(
                child: CarouselSlider.builder(
                    itemCount: sliderimage.elementAt(0).length,
                    itemBuilder: (context, index, realIndex) => Center(
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Container(
                                width: w / 1.1,
                                height: h / 6,
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xff0e18cf).withOpacity(.8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        fit: BoxFit.fill,
                                        "https://logicaltest.website/Deepesh/SuiviVital_Doctor//assets/dist/slider/${sliderimage.elementAt(0)[index]["banner_image"]}"))),
                          ),
                        ),
                    options: CarouselOptions(
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 16,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                    )),
              ),
              SizedBox(
                height: h / 30,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: w / 2.4,
                        height: h / 7,
                        decoration: BoxDecoration(
                            color: const Color(0xffffbfec),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/c1_(1).jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 70, left: 15.0),
                                child: Text(
                                  AppLocalizations.of(context)!.type1Diabetes,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c1037)),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                      Container(
                        width: w / 2.4,
                        height: h / 7,
                        decoration: BoxDecoration(
                            color: const Color(0xffb8f3cd),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/c1_(2).png",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 80.0),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .gestationalDiabetes,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c1037)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: w / 20),
                  Column(
                    children: [
                      Container(
                        width: w / 2.4,
                        height: h / 7,
                        decoration: BoxDecoration(
                            color: const Color(0xffffe1b5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/q.png"),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 70, left: 15.0),
                                child: Text(
                                  AppLocalizations.of(context)!.type2Diabetes,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c1037)),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                      Container(
                        width: w / 2.4,
                        height: h / 7,
                        decoration: BoxDecoration(
                            color: const Color(0xffb0e7ff),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/c1 (4).png"),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 15, left: 70.0),
                                child: Text(
                                  "Other Types Of Diabetes",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c1037)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.popularDoctor,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Popular_doctor_all());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.viewall,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 60,
              ),
              SizedBox(
                height: h / 3.5,
                width: w,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: popualr_doctor.elementAt(0).data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 10.0, bottom: 10),
                      child: GestureDetector(
                        onTap: () async {
                          await doctor_Details_api.detail_doctor_api1(
                              popualr_doctor
                                  .elementAt(0)
                                  .data!
                                  .elementAt(index)
                                  .id
                                  .toString());
                          Get.to(()=>const Doctor_deatils());
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
                                          child: Container(decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.black)),
                                            height: h / 10,
                                            width: w / 4.5,
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Image.network(
                                                  fit: BoxFit.fill,
                                                  "${doctor_image_url.toString()}${popualr_doctor.elementAt(0).data!.elementAt(index).profileImage.toString()}"),
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
                                                overflow: TextOverflow.ellipsis,
                                                "Dr.${popualr_doctor.elementAt(0).data!.elementAt(index).name.toString()}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Text(
                                              popualr_doctor
                                                  .elementAt(0)
                                                  .data!
                                                  .elementAt(index)
                                                  .profession
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: colors.geryq1),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  CupertinoIcons.location_solid,
                                                  size: 16,
                                                  color: Colors.black26,
                                                ),
                                                SizedBox(
                                                  width: w / 2.5,
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    popualr_doctor
                                                        .elementAt(0)
                                                        .data!
                                                        .elementAt(index)
                                                        .address
                                                        .toString(),
                                                    style: const TextStyle(
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
                                                  " ${popualr_doctor.elementAt(0).data!.elementAt(index).experience.toString()}",
                                                  style: const TextStyle(
                                                    color: Color(0xff777f8a),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Text(
                                                  " Exp",
                                                  style: const TextStyle(
                                                      color: Color(0xff777f8a)),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Color(0xfffeba0c),
                                          ),
                                          Text(
                                            popualr_doctor
                                                .elementAt(0)
                                                .data!
                                                .elementAt(index)
                                                .rating
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "(${popualr_doctor.elementAt(0).data!.elementAt(index).ratingCount.toString()} )",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff777f8a)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle,size: 10,
                                          color: popualr_doctor1
                                              .elementAt(0)[index]["status_on_of"].toString() =="1"?
                                            Colors.green:Colors.red
                                            ,
                                          ),
                                          popualr_doctor1
                                              .elementAt(0)[index]["status_on_of"].toString() =="1"?
                                           Text(
                                       "Online",
                                            style: TextStyle(
                                                fontSize: 14,color: Colors.green,
                                                fontWeight: FontWeight.w500),
                                          )
                                              :
                                           Text(
                                            "Offline",
                                            style: TextStyle(
                                                fontSize: 14,color: Colors.red,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(
                                    height: h / 50,
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
                                              .detail_doctor_api1(popualr_doctor
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
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.onlineDoctor,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Online_doctor_all());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.viewall,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 100,
              ),
              StreamBuilder(
                stream: Stream.periodic(Duration(seconds: 0))
                    .asyncMap((i) => get_onlin_doc.online_doc()),
                builder: (context, snapshot) => SizedBox(
                  height: h / 3.1,
                  width: w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: online_doctor.elementAt(0).data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, top: 15, bottom: 15),
                        child: GestureDetector(
                          onTap: () async {
                            await doctor_Details_api.detail_doctor_api1(
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
                              height: h / 3,
                              width: w / 1.8,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, left: 15, right: 15, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: 41,
                                            backgroundColor: Colors.grey,
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: NetworkImage(
                                                      "${doctor_image_url.toString()}${online_doctor.elementAt(0).data!.elementAt(index).profileImage.toString()}"),
                                                  radius: 35),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 55.0,
                                            ),
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: online_doctor
                                                              .elementAt(0)
                                                              .data!
                                                              .elementAt(index)
                                                              .statusOnOf ==
                                                          "1"
                                                      ? Colors.green
                                                      : Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 1.2,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "Dr.${online_doctor.elementAt(0).data!.elementAt(index).name.toString()}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 1.2,
                                      child: Text(
                                        online_doctor
                                            .elementAt(0)
                                            .data!
                                            .elementAt(index)
                                            .profession
                                            .toString(),
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.location_solid,
                                          size: 16,
                                          color: Colors.black26,
                                        ),
                                        SizedBox(width: w / 80),
                                        SizedBox(
                                          width: w / 2.7,
                                          child: Text(
                                            online_doctor
                                                .elementAt(0)
                                                .data!
                                                .elementAt(index)
                                                .address
                                                .toString(),
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Color(0xfffeba0c),
                                        ),
                                        SizedBox(width: w / 80),
                                        Text(
                                          online_doctor
                                              .elementAt(0)
                                              .data!
                                              .elementAt(index)
                                              .rating
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "( ${online_doctor.elementAt(0).data!.elementAt(index).ratingCount.toString()})",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.business_center_sharp,
                                          size: 15,
                                          color: Colors.black26,
                                        ),
                                        SizedBox(
                                          width: w / 80,
                                        ),
                                        Text(
                                          online_doctor
                                              .elementAt(0)
                                              .data!
                                              .elementAt(index)
                                              .experience
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "  Exp",
                                          //${AppLocalizations.of(context)!.yearExp}
                                          style: const TextStyle(
                                              color: Color(0xff777f8a)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.nearbypharmacy,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Near_pharmacy());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.viewall,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 100,
              ),
              Container(
                height: h / 3.1,
                width: w,
                child: FutureBuilder(
                  future: nearphhh.pharmancy(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: pharmancylist.elementAt(0).length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 10.0, top: 15, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(Pharmacy_details(
                                iindex: index,
                              ));
                            },
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: h / 3,
                                width: w / 1.5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h / 6,
                                      width: w / 1,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image.network(
                                              fit: BoxFit.fill,
                                              "${imageurlph.toString()}${pharmancylist.elementAt(0)[index]["shop_image"]}")),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0,
                                          left: 15,
                                          right: 15,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: w / 1.6,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${pharmancylist.elementAt(0)[index]["shop_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.location_solid,
                                                size: 16,
                                                color: Colors.black26,
                                              ),
                                              SizedBox(
                                                width: w / 2,
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  " ${pharmancylist.elementAt(0)[index]["shop_address"]}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Icon(Icons.business,
                                                      size: 16,
                                                      color: Colors.black26),
                                                  SizedBox(width: w / 80),
                                                  Text(
                                                    "${pharmancylist.elementAt(0)[index]["shop_status"]}",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Color(0xfffeba0c),
                                                  ),
                                                  Text(
                                                    "${pharmancylist.elementAt(0)[index]["shop_rating"]}",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "(0)",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
            ],
          ),
        )),
      ),
    );
  }

  final nearphhh = Get.put(Nearpharmancy_list());
}
