import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../Doctoe/login.dart';
import '../user/loginu.dart';

class Choose_option extends StatefulWidget {
  const Choose_option({super.key});

  @override
  State<Choose_option> createState() => _Choose_optionState();
}

class _Choose_optionState extends State<Choose_option> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15,bottom: 15),
            child: Center(
              child: Column(children: [
                Image.asset(
                  "assets/images/logo.jpeg",
                  scale: 4,
                ),
                Image.asset("assets/images/Onboarding_31.jpg"),
                SizedBox(
                  height: h / 15,
                ),
                Text(
                  "Find Your Doctor",
                  style: TextStyle(
                      color: Color(0xff0c1037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lectus sed",
                      softWrap: true,
                      style: TextStyle(
                        color: Color(0xff898f99),
                        fontSize: 15,
                      )),
                ),
                SizedBox(
                  height: h / 20,
                ),
                Container(
                  width: w / 1,
                  height: h / 15,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff4c5df4))),
                      onPressed: () {
                        Get.to(Logind());
                      },
                      child: Text(
                        AppLocalizations.of(context)!.are_you_a_Doctor,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: h / 100,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff4c5df4), width: 2)),
                  width: w / 1,
                  height: h / 15,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        Get.to(Loginu());
                      },
                      child: Text(
                        AppLocalizations.of(context)!.are_you_a_patient,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff4c5df4)),
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
