import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/pharmacy_details.dart';
import '../../custom_widget/drawer.dart';
import '../../utils/color.dart';
import 'Nav_bar_usser.dart';
import 'api_controller_user/nearpharmancy.dart';


const imageurlph="https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/shop_image/";
class Near_pharmacy extends StatefulWidget {
  const Near_pharmacy({super.key});

  @override
  State<Near_pharmacy> createState() => _Near_pharmacyState();
}

class _Near_pharmacyState extends State<Near_pharmacy> {
  final nearphhh = Get.put(Nearpharmancy_list());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar( iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          elevation: 0,
          title: Text(
            "Nearby Pharmacy",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              Container(
                height: h / 1.2,
                width: w / 1,
                child:
                FutureBuilder(future: nearphhh.pharmancy(), builder: (context, snapshot) {
                  return
                    GridView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {

                            Get.to(Pharmacy_details(iindex: index,));
                          },
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: h / 2,
                              width: w / 1.5,
                              child: Column(
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     color: Color(0xfffeba0c)),
                                    height: h / 6,
                                    width: w / 1,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child:Image.network(fit: BoxFit.fill,"${imageurlph.toString()}${pharmancylist.elementAt(0)[index]["shop_image"]}")
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 15, right: 15, bottom: 5),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: w/2,
                                          child: Text(
                                            "${pharmancylist.elementAt(0)[index]["shop_name"]}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.location_solid,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            Container(
                                              width: w / 3.5,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                "${pharmancylist.elementAt(0)[index]["shop_address"]}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff6e7682)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.business,
                                                size: 15, color: Colors.grey),
                                            // Image.asset(
                                            //   "assets/images/delivery.png",
                                            //   width: 25,
                                            //   height: 25,
                                            //   color: Colors.grey,
                                            // ),
                                            SizedBox(width: w / 80),
                                            Text(
                                              "${pharmancylist.elementAt(0)[index]["shop_status"]}",
                                              style: TextStyle(fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Color(0xfffeba0c),
                                            ),
                                            Text(
                                              "${pharmancylist.elementAt(0)[index]["shop_rating"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Text(
                                            //   "(100+)",
                                            //   style: TextStyle(
                                            //       color: Color(0xff777f8a)),
                                            // )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pharmancylist.elementAt(0).length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / 1.7),
                          crossAxisCount: 2,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 15));
                },),

              ),
              SizedBox(height: h / 20),
            ],
          ),
        ),
      ),
    );
  }
}
