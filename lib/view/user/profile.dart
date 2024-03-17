import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:suivivital/main.dart';
import 'package:suivivital/view/common/policy_api.dart';
import 'package:suivivital/view/user/edit_profile_u.dart';
import '../../custom_widget/drawer.dart';
import '../../language.dart';
import '../../language_constant.dart';
import '../../utils/color.dart';
import '../common/aboutus.dart';
import '../common/aboutus_api.dart';
import '../common/privacy_policy.dart';
import '../common/terms&condition.dart';
import '../common/terms_api.dart';
import 'api_controller_user/update_api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final edit_api = Get.put(Update_profile_user());
  final ploicy1 = Get.put(Policy_api());
  final terms = Get.put(Terms_api());
  final about = Get.put(Aboutus_api());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text( AppLocalizations.of(context)!.userProfile,
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        height: h / 1.22,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
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
                      Get.to(Edit_profile_u());
                    },
                    leading: Icon(CupertinoIcons.profile_circled,
                        color: colors.geryq1, size: 20),
                    title: Text(
                      AppLocalizations.of(context)!.myprofile,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,size: 18),
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
                        color: colors.geryq1, size: 20),
                    title: Text(
                      AppLocalizations.of(context)!.pattern,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,size: 18),
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
              //       leading: Icon(Icons.newspaper_sharp,
              //           color: colors.geryq1, size: 24),
              //       title: Text(AppLocalizations.of(context)!.news,),
              //       trailing: Icon(Icons.arrow_forward_ios),
              //     ),
              //   ),
              // ),
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
                            Icon(Icons.call, color: colors.geryq1, size: 20),
                            SizedBox(height: h / 100),
                            Icon(Icons.star, color: colors.geryq1, size: 20),
                            SizedBox(height: h / 100),
                            Icon(Icons.file_open_outlined,
                                color: colors.geryq1, size: 20),
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
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 13),
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
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 13),
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
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 13),
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
                          Icon(CupertinoIcons.globe, color: Colors.grey,size: 20),
                          SizedBox(width: 30),
                          Text("change language",
                              style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500)),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    e.flag,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  Text(e.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),)
                                ],
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
              // Material(
              //   borderRadius: BorderRadius.circular(10),
              //   elevation: 2,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       //border: Border.all(color: colors.logosec)
              //     ),
              //     child: ListTile(
              //       onTap: () {
              //         Showbox();
              //
              //       },
              //       leading: Icon(Icons.logout, color: colors.geryq1, size: 24),
              //       title: Text(AppLocalizations.of(context)!.signout,),
              //       trailing: Icon(Icons.arrow_forward_ios),
              //     ),
              //   ),
              // ),
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
      )),
    );
  }

  List<String> diabetetypelist = [
    'english',
    'french',
  ];
  String? diabetetype;
}
