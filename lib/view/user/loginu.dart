import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/form/glucose/glucoselevel.dart';
import 'package:suivivital/view/user/form/thearpy/therapy.dart';
import 'package:suivivital/view/user/form/unit/units.dart';
import 'package:suivivital/view/user/signup/signupu.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../common/option_choose.dart';
import 'api_controller_user/login_api.dart';
import 'form/medicines/medicinesuse.dart';
import 'form/thearpy/therapy_controller.dart';


class Loginu extends StatefulWidget {
  const Loginu({super.key});

  @override
  State<Loginu> createState() => _LoginuState();
}

class _LoginuState extends State<Loginu> {
  final login_user_api_con = Get.put(Login_api_user_controller());
  String countryCode = '';
  final formKey = GlobalKey<FormState>();
  final therapy_contoller = Get.put(Therapy_controller());
  int ll=8;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.to(Choose_option());
              },
              icon: Icon(
                Icons.arrow_back,
                color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.signin,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: colors.hinttext),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(children: [
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                style: TextStyle(color: colors.geryq1, fontSize: 20),
              ),
              SizedBox(
                height: h / 15,
              ),
              Row(
                children: [
                  Container(
                    width: w / 1.15,
                    child: IntlPhoneField(
                      onCountryChanged: (value) {
                        setState(() {
                          ll=value.maxLength;
                        });
                      },
                      controller: mobile,
                      validator: (value) {
                        if (value == null) {
                          return "please mobile";
                        }
                        return null;
                      },
                      flagsButtonPadding: const EdgeInsets.all(8),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'BF',
                      // onChanged: (phone) {
                      //   print(phone.completeNumber);
                      // },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 15,
              ),
              Obx(
                () => login_user_api_con.isloading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: w / 1,
                        height: h / 15,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff4c5df4))),
                            onPressed: () async {
                              // login_user_api_con.loader();
                              if (formKey.currentState!.validate() && mobile.text.toString().length==ll) {
                                await login_user_api_con
                                    .login_user_api(mobile.text.toString());
                              }
                              else if (mobile.text.toString().length !=ll){
                                Utils().alertbox(
                                    ' Please entre mobile no up to $ll digit ');
                              }
                              else{
                                Utils().alertbox(
                                    ' Please entre mobile no ');
                              }
                              //Get.off(Verify_otp());
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signin,
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.donothaveanaccount,
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.geryq1,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.signup,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.w600)),
                    onPressed: () async {
                      var shared_preferences =
                          await SharedPreferences.getInstance();
                      var user_signup_status =
                          shared_preferences.get("user_signup_status");
                      print(user_signup_status.toString());

                      user_signup_status.toString() == "0" ||
                              user_signup_status.toString() == "null"
                          ? Get.to(const Signupu())
                          : user_signup_status == "1"
                              ? Get.to(Form1())
                              : user_signup_status == "2"
                                  ? Get.to(const Form3())
                                  : user_signup_status == "3"
                                      ? Get.to(Form4(
                                          noninsulin: therapy_contoller
                                              .noninsulin.value
                                              .toString(),
                                        ))
                                      : user_signup_status == "4"
                                          ? Get.to(const Form5())
                                          : const Text("kj");
                    },
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  TextEditingController mobile = TextEditingController();
}
