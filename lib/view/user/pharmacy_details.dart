import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import 'api_controller_user/nearpharmancy.dart';
import 'near_by_pharmacy.dart';

class Pharmacy_details extends StatefulWidget {
  final iindex;
  const Pharmacy_details({super.key, this.iindex});

  @override
  State<Pharmacy_details> createState() => _Pharmacy_detailsState();
}

class _Pharmacy_detailsState extends State<Pharmacy_details> {
  var mdb = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                // color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            "Pharmacy Detalis",
            style:
                TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: w,
                height: h / 4,
                child: Image.network(fit: BoxFit.fill,"${imageurlph.toString()}${pharmancylist.elementAt(0)[widget.iindex]["shop_image"]}")
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 15, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: w/1.7,
                        child: Text(overflow: TextOverflow.ellipsis,
                          "${pharmancylist.elementAt(0)[widget.iindex]["shop_name"]}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Color(0xfffeba0c),
                          ),
                          Text(
                            "${pharmancylist.elementAt(0)[widget.iindex]["shop_rating"]}",
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "(100+)",
                          //   style: TextStyle(color: Color(0xff777f8a)),
                          // )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: h / 150),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        size: 16,
                        color: Colors.black26,
                      ),
                      Container(
                        width: w / 1.5,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "${pharmancylist.elementAt(0)[widget.iindex]["shop_address"]}",
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 150),
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        // CupertinoIcons.clock,
                        size: 16,
                        color: Colors.black26,
                      ),
                      SizedBox(width: w / 80),
                      Text(
                        "${pharmancylist.elementAt(0)[widget.iindex]["shop_status"]}",
                        style: TextStyle(fontSize: 13,
                            fontWeight: FontWeight.w400, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              mdb = 0;
                            });
                          },
                          child: Text(
                            "Medicines",
                            style: TextStyle(fontSize: 11,
                                color: mdb == 0 ? Colors.red : Colors.grey),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              mdb = 1;
                            });
                          },
                          child: Text(
                            "About us",
                            style: TextStyle(fontSize: 11,
                                color: mdb == 1 ? Colors.red : Colors.grey),
                          )),
                      // TextButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         mdb = 2;
                      //       });
                      //     },
                      //     child: Text(
                      //       "Open & closed ",
                      //       style: TextStyle(fontSize: 11,
                      //           color: mdb == 2 ? Colors.red : Colors.grey),
                      //     )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              mdb = 3;
                            });
                          },
                          child: Text(
                            "Rating",
                            style: TextStyle(fontSize: 11,
                                color: mdb == 3 ? Colors.red : Colors.grey),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 2,
                          width: w / 3,
                          color: mdb == 0 ? Colors.red : Colors.grey),
                      Container(
                        height: 2,
                        width: w / 3,
                        color: mdb == 1 ? Colors.red : Colors.grey,
                      ),
                      // Container(
                      //     height: 2,
                      //     width: w / 03.7,
                      //     color: mdb == 2 ? Colors.red : Colors.grey),
                      Container(
                        height: 2,
                        width: w / 4.5,
                        color: mdb == 3 ? Colors.red : Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: h / 70),
                  mdb == 0
                      ? Text("")
                  // Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           SizedBox(
                  //             height: h / 30,
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(
                  //                 Icons.add,
                  //                 color: Colors.grey,
                  //               ),
                  //               TextButton(
                  //                   onPressed: () {},
                  //                   child: Text(
                  //                     "Upload Prescription",
                  //                     style: TextStyle(color: colors.logosec),
                  //                   ))
                  //             ],
                  //           )
                  //         ],
                  //       )
                      // Column(
                      //         children: [
                      //           TextFormField(
                      //             decoration: InputDecoration(
                      //                 hintText: "Search ...",
                      //                 prefixIcon:
                      //                     Icon(Icons.search, color: Colors.black),
                      //                 fillColor: Colors.grey.shade300,
                      //                 filled: true,
                      //                 border: OutlineInputBorder(
                      //                     borderSide: BorderSide.none,
                      //                     borderRadius: BorderRadius.circular(7))),
                      //           ),
                      //           SizedBox(height: h / 80),
                      //           Container(
                      //             height: h,
                      //             width: w / 1,
                      //             child: GridView(
                      //                 physics: ScrollPhysics(),
                      //                 shrinkWrap: true,
                      //                 children: [
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Get.to(Pharmacy_details());
                      //                     },
                      //                     child: Material(
                      //                       elevation: 2,
                      //                       borderRadius: BorderRadius.circular(15),
                      //                       child: Container(
                      //                         height: 200,
                      //                         width: w / 1.5,
                      //                         child: Column(
                      //                           children: [
                      //                             Container(
                      //                               // decoration: BoxDecoration(
                      //                               //     shape: BoxShape.circle,
                      //                               //     color: Color(0xfffeba0c)),
                      //                               height: h / 6,
                      //                               width: w / 1,
                      //                               child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(10),
                      //                                           topRight:
                      //                                               Radius.circular(
                      //                                                   10)),
                      //                                   child: Image.asset(
                      //                                     "assets/images/download (1).jpg",
                      //                                     fit: BoxFit.fill,
                      //                                   )),
                      //                             ),
                      //                             SizedBox(
                      //                               height: h / 500,
                      //                             ),
                      //                             Padding(
                      //                               padding: const EdgeInsets.only(
                      //                                   top: 5.0,
                      //                                   left: 15,
                      //                                   right: 15,
                      //                                   bottom: 10),
                      //                               child: Column(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     "Napa Extend Taplet",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 3.5,
                      //                                     child: Text(
                      //                                       overflow: TextOverflow
                      //                                           .ellipsis,
                      //                                       "(Paracentamol)",
                      //                                       style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color: Color(
                      //                                               0xff6e7682)),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Row(
                      //                                     children: [
                      //                                       Text(
                      //                                         "MRP",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                       Text(
                      //                                         "  \$6.99",
                      //                                         style: TextStyle(
                      //                                             color:
                      //                                                 Colors.green,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: h / 500,
                      //                                   ),
                      //                                   Container(
                      //                                     width: w / 1,
                      //                                     height: h / 30,
                      //                                     child: ElevatedButton(
                      //                                         style: ButtonStyle(
                      //                                             shape: MaterialStateProperty.all(
                      //                                                 RoundedRectangleBorder(
                      //                                                     borderRadius:
                      //                                                         BorderRadius.circular(
                      //                                                             5))),
                      //                                             backgroundColor:
                      //                                                 MaterialStateProperty
                      //                                                     .all(Color(
                      //                                                         0xff4c5df4))),
                      //                                         onPressed: () {},
                      //                                         child: Text(
                      //                                           "Add to cart",
                      //                                           style: TextStyle(
                      //                                               color: Colors
                      //                                                   .white),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //                 gridDelegate:
                      //                     SliverGridDelegateWithFixedCrossAxisCount(
                      //                         childAspectRatio: (1 / 1.4),
                      //                         crossAxisCount: 2,
                      //                         crossAxisSpacing: 13,
                      //                         mainAxisSpacing: 15)),
                      //           ),
                      //         ],
                      //       )
                      : mdb == 1
                          ? Column(
                              children: [
                                SizedBox(height: h / 50),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.business_sharp,
                                      size: 25,
                                      color: Color(0xfffeba0c),
                                    ),
                                    SizedBox(width: w / 50),
                                    Text(
                                      "${pharmancylist.elementAt(0)[widget.iindex]["shop_name"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h / 150),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: w / 1.5,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${pharmancylist.elementAt(0)[widget.iindex]["shop_address"]}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff6e7682)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h / 150),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.business,
                                      color: Colors.grey,
                                    ),
                                    // Image.asset(
                                    //   "assets/images/delivery.png",
                                    //   width: 25,
                                    //   height: 25,
                                    //   color: Colors.grey,
                                    // ),
                                    SizedBox(width: w / 80),
                                    Text(
                                      "${pharmancylist.elementAt(0)[widget.iindex]["shop_status"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h / 150),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color(0xfffeba0c),
                                    ),
                                    Text(
                                      "${pharmancylist.elementAt(0)[widget.iindex]["shop_rating"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Text(
                                    //   "(100+)",
                                    //   style:
                                    //       TextStyle(color: Color(0xff777f8a)),
                                    // )
                                  ],
                                ),
                                SizedBox(height: h / 150),
                              ],
                            )
                          : mdb == 2
                              ? Text("24 * 7 open  shop ")
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: h / 50,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 4.5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(
                                      height: h / 80,
                                    ),
                                    Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "4.5",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "(100+)",
                                              style: TextStyle(
                                                  color: Color(0xff777f8a)),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
