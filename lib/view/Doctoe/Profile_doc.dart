import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/Doctoe/doc_time/doc_time%20table.dart';
import 'package:suivivital/view/Doctoe/patientdeatilsreference.dart';
import 'package:suivivital/view/Doctoe/profile/profile.dart';
import 'package:suivivital/view/Doctoe/profile/profile_controller.dart';
import '../../language.dart';
import '../../language_constant.dart';
import '../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/color.dart';
import '../common/aboutus.dart';
import '../common/aboutus_api.dart';
import '../common/option_choose.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import '../common/policy_api.dart';
import '../common/privacy_policy.dart';
import '../common/terms&condition.dart';
import '../common/terms_api.dart';
import 'api_controller/doc_time_api.dart';
import 'api_controller/logout_api.dart';

final doc_logout = Get.put(Logout_doctor_api());

class Profile_doctor extends StatefulWidget {
  const Profile_doctor({super.key});

  @override
  State<Profile_doctor> createState() => _Profile_doctorState();
}

class _Profile_doctorState extends State<Profile_doctor> {
  final getprofile = Get.put(Profile_controller());
  final doc_time = Get.put(Doc_time_api());
  final ploicy1 = Get.put(Policy_api());
  final terms = Get.put(Terms_api());
  final about = Get.put(Aboutus_api());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,

        title: Text("  " + AppLocalizations.of(context)!.userProfile,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h / 1.2,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 15, bottom: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: h / 40,
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
                        getprofile.prof();
                        Get.to(Edit_profile());
                      },
                      leading: Icon(CupertinoIcons.profile_circled,
                          color: colors.geryq1, size: 24),
                      title: Text(
                        AppLocalizations.of(context)!.myprofile,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                        doc_time.Day_list();
                        doc_time..time_list();
                        Get.to(Doc_time());
                      },
                      leading: Icon(CupertinoIcons.profile_circled,
                          color: colors.geryq1, size: 24),
                      title: Text(
                        "edit Time table",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                        // getprofile.prof();
                        Get.to(Patient_reference());
                      },
                      leading: Icon(CupertinoIcons.profile_circled,
                          color: colors.geryq1, size: 24),
                      title: Text(
                       "Patient List",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                      leading: Icon(CupertinoIcons.settings,
                          color: colors.geryq1, size: 24),
                      title: Text(
                        AppLocalizations.of(context)!.pattern,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                      leading: Icon(Icons.newspaper_sharp,
                          color: colors.geryq1, size: 24),
                      title: Text(
                        AppLocalizations.of(context)!.news,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 60,
                ),
                // Material(
                //   borderRadius: BorderRadius.circular(10),
                //   elevation: 2,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       //border: Border.all(color: colors.logosec)
                //     ),
                //     child: ListTile(
                //       onTap: () {},
                //       leading: Icon(CupertinoIcons.person,
                //           color: colors.geryq1, size: 24),
                //       title: Text('Clinician'),
                //       trailing: Icon(Icons.arrow_forward_ios),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: h / 60,
                // ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        //border: Border.all(color: colors.logosec)
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              // Icon(CupertinoIcons.book,
                              //     color: colors.geryq1, size: 24),
                              // Icon(CupertinoIcons.globe,
                              //     color: colors.geryq1, size: 24),
                              // Icon(CupertinoIcons.person_3_fill,
                              //     color: colors.geryq1, size: 24),
                              Icon(Icons.call, color: colors.geryq1, size: 24),
                              SizedBox(height: h / 100),
                              Icon(Icons.star, color: colors.geryq1, size: 24),
                              SizedBox(height: h / 100),
                              Icon(Icons.file_open_outlined,
                                  color: colors.geryq1, size: 24),
                            ],
                          ),
                          SizedBox(width: w / 015),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("User Guide"),
                              // SizedBox(height: h / 110),
                              // Text("Diabetes M website"),
                              // SizedBox(height: h / 110),
                              // Text("Discussion group"),
                              // SizedBox(height: h / 110),
                              SizedBox(
                                height: h / 25,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(About_us());
                                  },
                                  child: Text(
                                    style: TextStyle(color: Colors.black),
                                    "About us",
                                  ),
                                ),
                              ),
                              // SizedBox(height: h / 110),
                              SizedBox(
                                height: h / 25,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(policy());
                                  },
                                  child: Text(
                                    style: TextStyle(color: Colors.black),
                                    "Privacy Policy",
                                  ),
                                ),
                              ),
                              // SizedBox(height: h / 110),
                              SizedBox(
                                height: h / 25,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(Terms());
                                  },
                                  child: Text(
                                    style: TextStyle(color: Colors.black),
                                    AppLocalizations.of(context)!.termspolicy,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: h / 60,
                ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    width: w / 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<Language>(
                        underline: const SizedBox(),
                        hint: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(CupertinoIcons.globe, color: Colors.grey),
                            SizedBox(width: 30),
                            Text("change language",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        // icon: const Icon(
                        //   Icons.language,
                        //   color: Colors.white,
                        // ),
                        onChanged: (Language? language) async {
                          if (language != null) {
                            Locale _locale =
                                await setLocale(language.languageCode);
                            MyApp.setLocale(context, _locale);
                          }
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        e.flag,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: w / 010,
                                      ),
                                      Text(
                                        e.name,
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
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
                        Showbox();
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return Expanded(
                        //       child: AlertDialog(
                        //         title: Text('Log Out'),
                        //         content: Text('You want log out'),
                        //         actions: [
                        //           TextButton(
                        //             //textColor: Colors.black,
                        //             onPressed: () {
                        //               Get.back();
                        //             },
                        //             child: Text('CANCEL'),
                        //           ),
                        //           TextButton(
                        //             // textColor: Colors.black,
                        //             onPressed: () {
                        //               Get.to(Choose_option());
                        //             },
                        //             child: Text('ACCEPT'),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      leading:
                          Icon(Icons.logout, color: colors.geryq1, size: 24),
                      title: Text(
                        AppLocalizations.of(context)!.signout,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                // Container(
                //     padding: EdgeInsets.all(15),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         border: Border.all(color: colors.logosec)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Icon(
                //           Icons.facebook,
                //           color: colors.geryq1,
                //           size: 24,
                //         ),
                //         Icon(
                //           Icons.facebook,
                //           color: colors.geryq1,
                //           size: 24,
                //         ),
                //         Icon(
                //           Icons.facebook,
                //           color: colors.geryq1,
                //           size: 24,
                //         ),
                //         Icon(
                //           Icons.facebook,
                //           color: colors.geryq1,
                //           size: 24,
                //         ),
                //       ],
                //     )),
                // Container(
                //     height: h / 6,
                //     padding:
                //         const EdgeInsets.only(left: 20.0, bottom: 15, top: 15),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         border: Border.all(color: colors.logosec)),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Text(
                //           "Medical Device",
                //           style: TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //         Text("software for monitoring and alleving diabetes"),
                //         Row(
                //           children: [
                //             Text(
                //               "UDI",
                //               style: TextStyle(fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(
                //               width: w / 50,
                //             ),
                //             Text("(+91)9876543212"),
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             Icon(
                //               Icons.factory_outlined,
                //               color: colors.geryq1,
                //               size: 24,
                //             ),
                //             SizedBox(
                //               width: w / 50,
                //             ),
                //             Text("dgvdxzgvsdv"),
                //           ],
                //         ),
                //       ],
                //     )),
              ],
            ),
          ),
        ),


      ),
    );
  }

  void Showbox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('You want log out'),
          actions: [
            TextButton(
              //textColor: Colors.black,
              onPressed: () {
                Get.back();
              },
              child: Text('CANCEL'),
            ),
            Obx(
              () => doc_logout.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      // textColor: Colors.black,
                      onPressed: () async {
                        doc_logout.loader();
                        await doc_logout.logout();
                        var shared_preferences = await SharedPreferences.getInstance();
                        var isLogedIn = shared_preferences.remove('user_id');
                      },
                      child: Text('ACCEPT'),
                    ),
            ),
          ],
        );
      },
    );
  }
}
