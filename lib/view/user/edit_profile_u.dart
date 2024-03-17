import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/profile.dart';
import '../../utils/color.dart';
import 'api_controller_user/delete_account.dart';
import 'api_controller_user/get_user_profile_api.dart';
import 'api_controller_user/update_api.dart';
import 'edit_user_profile/edit_profile/edit.dart';

class Edit_profile_u extends StatefulWidget {
  const Edit_profile_u({super.key});

  @override
  State<Edit_profile_u> createState() => _Edit_profile_uState();
}

class _Edit_profile_uState extends State<Edit_profile_u> {
  final delete_user = Get.put(Delete_user());
  final edit_api = Get.put(Update_profile_user());
  final get_profile__user_api_con = Get.put(Get_profile_api_user_controller());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.to(Profile());

              // Get.to(Edit_profile_u());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        // titleTextStyle:  TextStyle(fontSize: 13),
        title: Text(
          " My profile",
          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        child: Column(children: [
          FutureBuilder(future:get_profile__user_api_con.user_profile() , builder: (context, snapshot) {
            return Column(children: [
              Center(
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/users/${user_deatils.elementAt(0).data!.image.toString()}")),
              ),
              SizedBox(
                height: h / 50,
              ),
              Center(
                child: Text(user_deatils.elementAt(0).data!.userName.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],);
          },),


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
                  Get.to(Edit_profile_user());
                },
                leading: Icon(Icons.edit, color: colors.geryq1, size: 16),
                title: Text(
                  "Edit profile",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 16),
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
                  "your Subscriptipon",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 16),
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
                  delete_user.delete_account();
                },
                leading:
                    Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
                title: Text(
                  "Delete account",
                  style: TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.w400),
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 16),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
