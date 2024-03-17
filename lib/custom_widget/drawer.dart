import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/api_controller_user/logout_api.dart';
import 'package:suivivital/view/user/upload_preceiption.dart';
import '../view/user/Add_clinician.dart';
import '../view/user/Newui.dart';
import '../view/user/Setting/setting.dart';
import '../view/user/Statistics/statistics.dart';
import '../view/user/api_controller_user/get_user_profile_api.dart';
import '../view/user/finddoctor.dart';
import '../view/user/history/history.dart';
import '../view/user/home/home1.dart';
import '../view/user/log2/graph_01.dart';
import '../view/user/near_by_pharmacy.dart';
import '../view/user/online_doctor.dart';
import '../view/user/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
final user_logout = Get.put(Logout_user_api());

class Drawer1 extends StatefulWidget {
  const Drawer1({super.key});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final get_profile__user_api_con = Get.put(Get_profile_api_user_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: h / 100,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Profile());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(future:get_profile__user_api_con.user_profile() , builder: (context, snapshot) => Center(
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/users/${user_deatils.elementAt(0).data!.image.toString()}")
                    // AssetImage(
                    //   "assets/images/th-_1_.jpg",
                    // ),
                  ),
                ) ,),

                SizedBox(
                  width: w / 10,
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: h / 60,
          ),

          drawer_listtiles(
            hintext:  "Home",
            ontap: () {
              Get.to(Home1());
            },
            icon: CupertinoIcons.home,
          ),
          drawer_listtiles(
            hintext: "Statistics",
            ontap: () {
              Get.to(statistics_01());
            },
            icon: Icons.stacked_line_chart,
          ),
          drawer_listtiles(
            hintext: "Log",
            ontap: () {
              Get.to(Graph_page());
            },
            icon: Icons.data_thresholding,
          ),
          drawer_listtiles(
            hintext: "Find medecines",
            ontap: () {
              Get.to(Upload_pre());
            },
            icon: Icons.medication,
          ),
          drawer_listtiles(
            hintext: "Pharmacy",
            ontap: () {
              Get.to(Near_pharmacy());
            },
            icon: Icons.medication_liquid,
          ),
          drawer_listtiles(
            hintext: "Find Doctor",
            ontap: () {
              Get.to(Find_doctor());
            },
            icon: Icons.person,
          ),
          drawer_listtiles(
            hintext: "Histroy",
            ontap: () {
              Get.to(History());
            },
            icon: Icons.list_alt,
          ),
          drawer_listtiles(
            hintext: "Add Clinician",
            ontap: () {
              Get.to(Addclinican());
            },
            icon: Icons.person,
          ),
          drawer_listtiles(
            hintext: "News",
            ontap: () {
              Get.to(()=>News());
            },
            icon: Icons.newspaper_sharp,
          ),
          drawer_listtiles(
            hintext: "Setting",
            ontap: () {
              Get.to(setting_info());
            },
            icon: Icons.settings,
          ),
          drawer_listtiles(
            hintext: "Logout",
            ontap: () {
              Showbox();
            },
            icon: Icons.logout,
          ),

          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(Home1());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(CupertinoIcons.home, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Home",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(statistics_01());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.stacked_line_chart, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Statistics",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),

          // GestureDetector(
          //   onTap: () {
          //      Get.to(Graph_page());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.data_thresholding, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Log",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(Upload_pre());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.medication, color: Colors.white),
          //               SizedBox(width: w / 10),
          //               SizedBox(
          //                 width: w / 3,
          //                 child: Text(
          //                   "Find medecines",
          //                   maxLines: 2,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 17,
          //                       color: Colors.white),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(Near_pharmacy());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.medication_liquid, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Pharmacy",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     //Get.to(Home1());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.person, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Find Doctor",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(History());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.list_alt, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Histroy",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     //Get.to(Home1());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.person, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Add Clinician",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     //Get.to(Home1());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.newspaper_sharp, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "News",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(width: w,height: h/1000,color: Colors.grey,),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(Home1());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Center(
          //         child: Row(children: [
          //           Icon(CupertinoIcons.home,color: Colors.white),
          //           SizedBox(width: w/7),
          //           Text(
          //             "Profile",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 17,
          //                 color: Colors.white),
          //           ),
          //         ],),
          //       )
          //
          //   ),
          // ),
          // SizedBox(
          //   height: h / 150,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(setting_info());
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.settings, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Setting",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Showbox();
          //   },
          //   child: Container(
          //       width: w / 2,
          //       height: h / 18,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 10.0),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Icon(Icons.logout, color: Colors.white),
          //               SizedBox(width: w / 7),
          //               Text(
          //                 "Logout",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 17,
          //                     color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: h / 50,
          // ),
          // Container(
          //   width: w,
          //   height: h / 1000,
          //   color: Colors.grey,
          // ),
        ]),
      ),
    );
  }

  void Showbox() {
    Get.defaultDialog(
title:  'Log Out',
      content: Text('You want log out'),
      cancel:
      TextButton(
              //textColor: Colors.black,
              onPressed: () {
                Get.back();
              },
              child: Text('CANCEL'),
            ),
      confirm: Obx(
              () => user_logout.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      // textColor: Colors.black,
                      onPressed: () async {
                        var shared_preferences = await SharedPreferences.getInstance();
                        var isLogedIn = shared_preferences.remove('user1_id');
                        user_logout.loader();
                        await user_logout.logout();
                      },
                      child: Text('ACCEPT'),
                    ),
            ),

    );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Log Out'),
    //       content: Text('You want log out'),
    //       actions: [
    //         TextButton(
    //           //textColor: Colors.black,
    //           onPressed: () {
    //             Get.back();
    //           },
    //           child: Text('CANCEL'),
    //         ),
    //         Obx(
    //           () => user_logout.isloading == true
    //               ? Center(
    //                   child: CircularProgressIndicator(),
    //                 )
    //               : TextButton(
    //                   // textColor: Colors.black,
    //                   onPressed: () async {
    //                     user_logout.loader();
    //                     await user_logout.logout();
    //                   },
    //                   child: Text('ACCEPT'),
    //                 ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}

class drawer_listtiles extends StatelessWidget {
  final VoidCallback ontap;
  final String hintext;
  final IconData icon;
  const drawer_listtiles({
    super.key,
    required this.ontap,
    required this.hintext,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: .8),
      contentPadding: EdgeInsets.only(left: 50),
      shape: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey,
      )),
      onTap: ontap,
      leading: Icon(icon, color: Colors.white,size: 20),
      title: Text(
        hintext,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
      ),
    );
  }
}

class Drawer_container extends StatefulWidget {
  const Drawer_container({super.key});

  @override
  State<Drawer_container> createState() => _Drawer_containerState();
}

class _Drawer_containerState extends State<Drawer_container> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(Profile());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/images/th-_1_.jpg",
              ),
            ),
          ),
          SizedBox(
            width: w / 10,
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
