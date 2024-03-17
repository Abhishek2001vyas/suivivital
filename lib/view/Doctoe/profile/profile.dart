import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import 'package:suivivital/view/Doctoe/profile/profile_controller.dart';

import '../../../utils/color.dart';
// import '../../api_controller/api_controller.dart';
// import '../../api_controller/api_controller.dart';
// import '../../api_controller/api_controller.dart';
import '../edit_profile/edit_profile_d.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  final profile_con = Get.put(Profile_controller());
  // final getprofile = Get.put(Profile_controller());
  //final api_con =Get.put(Api_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        leading: IconButton(
            onPressed: () {
              Get.to(Nav_bar());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 0,
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: Text(
          " My profile",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        child: Column(children: [
          FutureBuilder(future:  profile_con.prof(), builder: (context, snapshot) {
           return Column(
             children: [
               FutureBuilder(future:  profile_con.prof(), builder:
               (context, snapshot) {
                 return Column(
                   children: [
                     Center(
                       child: postList.elementAt(0).data!.profileImage.toString() != null
                           ? CircleAvatar(
                         radius: 60,
                         backgroundImage: NetworkImage(
                           "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/" +
                               postList.elementAt(0).data!.profileImage.toString(),
                         ),
                       )
                           : CircleAvatar(
                         radius: 60,
                         backgroundImage: AssetImage(
                           "assets/images/th-_1_.jpg",
                         ),
                       ),
                     ),
                     SizedBox(
                       height: h / 40,
                     ),
                   ],
                 );
               },),
               Center(
                 child: Text(postList.elementAt(0).data!.name.toString(),
                     style:
                     const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
               ),
                   ],
                 );
               },
               ),

          SizedBox(
            height: h / 50,
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                //border: Border.all(color: colors.logosec)
              ),
              child: ListTile(
                onTap: () {
                  Get.to(Edit_profile_d());
                },
                leading: Icon(Icons.edit, color: colors.geryq1, size: 16),
                title: Text(
                  "Edit profile",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 20),
              ),
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                //border: Border.all(color: colors.logosec)
              ),
              child: ListTile(
                onTap: () {},
                leading:
                    Icon(Icons.subscriptions, color: colors.geryq1, size: 16),
                title: Text(
                  "your Subscriptipon",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 20),
              ),
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                //border: Border.all(color: colors.logosec)
              ),
              child: ListTile(
                onTap: () {
                  profile_con.delete_account();
                },
                leading:
                    Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
                title: Text(
                  "Delete account",
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 14),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 20),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
