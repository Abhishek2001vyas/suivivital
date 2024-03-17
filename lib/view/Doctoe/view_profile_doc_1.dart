import 'package:flutter/material.dart';
import 'package:suivivital/view/Doctoe/profile/profile_controller.dart';

import '../../custom_widget/text_filled.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';

class View_profile_doc_1 extends StatefulWidget {
  const View_profile_doc_1({super.key});

  @override
  State<View_profile_doc_1> createState() => _View_profile_doc_1State();
}

class _View_profile_doc_1State extends State<View_profile_doc_1> {
  var user_image = postList.elementAt(0).data!.profileImage.toString();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          elevation: 0,
          title: Text(
            " My profile",
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(children: [
              Center(
                  child: CircleAvatar(
                backgroundImage:
                    NetworkImage("${doctor_image_url}${user_image}"),
                backgroundColor: Colors.white,
                radius: 60,
              )),
              SizedBox(
                height: h / 50,
              ),
              TextFilled3(
                  labeltext: "Name",
                  initialval: postList.elementAt(0).data!.name.toString()),
              SizedBox(
                height: h / 35,
              ),
              TextFilled3(
                  labeltext: "Email",
                  initialval: postList.elementAt(0).data!.email.toString()),
              SizedBox(
                height: h / 35,
              ),
              TextFilled3(
                  labeltext: "Mobile",
                  initialval: postList.elementAt(0).data!.mobile.toString()),
              SizedBox(
                height: h / 35,
              ),
              TextFilled3(
                  labeltext: "National referral Code",
                  initialval:
                      postList.elementAt(0).data!.referralCode.toString()),
              SizedBox(
                height: h / 35,
              ),
              // TextFilled3(
              //     initialval: postList.elementAt(0).data!.name.toString()),
              // SizedBox(
              //   height: h / 35,
              // ),
              // TextFilled3(
              //     initialval: postList.elementAt(0).data!.mobile.toString()),
              // SizedBox(
              //   height: h / 35,
              // ),
              TextFilled3(
                  labeltext: "Gender",
                  initialval: postList.elementAt(0).data!.gender.toString()),
              SizedBox(
                height: h / 35,
              ),
              TextFilled3(
                  labeltext: "about",
                  initialval: postList.elementAt(0).data!.about.toString()),
              SizedBox(
                height: h / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.school,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: colors.geryq1, width: 1)
                    ),
                    child: TextFilled3(
                        initialval: postList
                            .elementAt(0)
                            .data!
                            .qualification
                            .toString()),
                  ),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.person_pin,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: colors.geryq1, width: 1)
                    ),
                    child: TextFilled3(
                        initialval:
                            postList.elementAt(0).data!.profession.toString()),
                  ),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.business_center,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFilled3(
                        initialval:
                            postList.elementAt(0).data!.experience.toString()),
                  ),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.location_on_outlined,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFilled3(
                        labeltext: "State",
                        initialval:
                            postList.elementAt(0).data!.state.toString()),
                  ),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.location_on_outlined,
                    color: colors.geryq1,
                    size: 24,
                  )),
                  Container(
                      width: w / 1.23,
                      height: h / 13,
                      padding: EdgeInsets.only(top: 19, bottom: 5, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: Text(
                        postList.elementAt(0).data!.address,
                      )),
                ],
              ),
              SizedBox(
                height: h / 35,
              ),
              TextFilled3(
                  labeltext: "fee",
                  initialval:
                      postList.elementAt(0).data!.feesCondition.toString()),
              SizedBox(
                height: h / 35,
              ),
              Text(
                "cerficate image",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h / 35,
              ),
              Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${doctor_image_url}${postList.elementAt(0).data!.certificateImage.toString()}"),
                //
                radius: 60,
              )),
              SizedBox(
                height: h / 35,
              ),
              Text(
                "licence image",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h / 35,
              ),
              Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${doctor_image_url}${postList.elementAt(0).data!.licenseImage.toString()}"),
                backgroundColor: Colors.white,
                radius: 60,
              )),
              SizedBox(
                height: h / 35,
              ),
            ]),
          ),
        ));
  }
}
