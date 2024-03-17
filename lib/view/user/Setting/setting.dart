import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:suivivital/custom_widget/drawer.dart';
import 'package:suivivital/utils/color.dart';
import 'package:suivivital/view/user/Setting/About.dart';
import 'package:suivivital/view/user/Setting/Change_user_name.dart';
import 'package:suivivital/view/user/Setting/Help.dart';
import 'package:suivivital/view/user/Setting/Privacy.dart';

import '../../common/aboutus.dart';
import '../../common/privacy_policy.dart';
import '../../common/terms&condition.dart';

List account = [ "Privacy", "Help", "About"];
//List notification = ["user_name_change", "privacy"];

List Trail_navi = [ policy(), Terms(), About_us()];

class setting_info extends StatefulWidget {
  const setting_info({super.key});

  @override
  State<setting_info> createState() => _setting_infoState();
}

class _setting_infoState extends State<setting_info> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        title: Text("Setting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        backgroundColor: colors.logosec,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: h / 2.7,
              width: w,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue.shade800,size: 20,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Container(
                    height: h / 4,
                    width: w,
                    child: ListView.builder(
                        itemCount: account.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(account[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Trail_navi[index]));
                                },
                                icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black87,)),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: h / 2.7,
              width: w,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: Colors.blue.shade800,size: 20,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  // Container(
                  //   height: h / 4,
                  //   width: w,
                  //   child: ListView.builder(
                  //       itemCount: notification.length,
                  //       itemBuilder: (context, index) {
                  //         return ListTile(
                  //           title: Text(notification[index]),
                  //           trailing: IconButton(
                  //               onPressed: () {},
                  //               icon: Icon(Icons.arrow_forward_ios_rounded)),
                  //         );
                  //       }),
                  // ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Send via email",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: h / 25,
                            child:
                            Switch(
                                value: onoff2,
                                onChanged: (reverse) {
                                  setState(() {
                                    onoff2=reverse;
                                  });
                                }),
                            // LiteRollingSwitch(
                            //   width: 50,
                            //   //initial value
                            //   value: false,
                            //   // textOn: 'On',
                            //   // textOff: 'Off',
                            //   colorOn: Colors.green,
                            //   colorOff: Colors.red,
                            //   iconOn: CupertinoIcons.circle_filled,
                            //   iconOff: Icons.circle,
                            //   textSize: 0.0,
                            //   onChanged: (bool state) async {
                            //     //Use it to manage the different states
                            //     // var shared_preferences =
                            //     //     await SharedPreferences.getInstance();
                            //     // var isLogedIn = shared_preferences.getString('user_id');
                            //     // Set<Map<String, String>> body = {
                            //     //  state == true?
                            //     //   {'user_id': isLogedIn.toString(),
                            //     //   "status_on_of": "1".toString()}
                            //     //   :
                            //     // {'user_id': isLogedIn.toString(),
                            //     // "status_on_of": "0".toString()
                            //     // }
                            //     // } ;
                            //     var body1 = state == true
                            //         ? "1".toString()
                            //         : "0".toString();
                            //
                            //     print('Current State of SWITCH IS: $state');
                            //   },
                            //   onTap: () {},
                            //   onDoubleTap: () {},
                            //   onSwipe: () {},
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Send via SMS",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: h / 25,
                            child:
                            Switch(
                                value: onoff,
                                onChanged: (reverse) {
                                  setState(() {
                                    onoff=reverse;
                                  });
                                }),
                            // LiteRollingSwitch(
                            //   width: 50,
                            //   //initial value
                            //   value: false,
                            //   // textOn: 'On',
                            //   // textOff: 'Off',
                            //   colorOn: Colors.green,
                            //   colorOff: Colors.red,
                            //   iconOn: CupertinoIcons.circle_filled,
                            //   iconOff: Icons.circle,
                            //   textSize: 0.0,
                            //   onChanged: (bool state) async {
                            //     //Use it to manage the different states
                            //     // var shared_preferences =
                            //     //     await SharedPreferences.getInstance();
                            //     // var isLogedIn = shared_preferences.getString('user_id');
                            //     // Set<Map<String, String>> body = {
                            //     //  state == true?
                            //     //   {'user_id': isLogedIn.toString(),
                            //     //   "status_on_of": "1".toString()}
                            //     //   :
                            //     // {'user_id': isLogedIn.toString(),
                            //     // "status_on_of": "0".toString()
                            //     // }
                            //     // } ;
                            //     var body1 = state == true
                            //         ? "1".toString()
                            //         : "0".toString();
                            //
                            //     print('Current State of SWITCH IS: $state');
                            //   },
                            //   onTap: () {},
                            //   onDoubleTap: () {},
                            //   onSwipe: () {},
                            // ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool onoff = false;
  bool onoff2 = false;
}
