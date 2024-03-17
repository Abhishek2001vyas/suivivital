import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suivivital/custom_widget/button.dart';
import 'package:suivivital/view/Doctoe/signup/signup.dart';
import 'package:suivivital/view/Doctoe/signup/signup_controller.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../common/option_choose.dart';
import 'api_controller/getdropdwon.dart';
import 'api_controller/login_api.dart';


class Logind extends StatefulWidget {
  const Logind({super.key});

  @override
  State<Logind> createState() => _LogindState();
}

class _LogindState extends State<Logind> {

  String countryCode = '';
  final formKey = GlobalKey<FormState>();
  final api_con = Get.put(Login_doctor_api());
  final api_con1 = Get.put(Getdrop());
  final signup_con = Get.put(Signup_controller());
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                "Wellcome back ",
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 15,
              ),
              Obx(() => api_con.isloading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Button_widget(
                      buttontext: "Sign in",
                      button_height: 15,
                      button_width: 1,
                      onpressed: () async {
                        // api_con.loader();
                        if (formKey.currentState!.validate()
                        && mobile.text.toString().length==ll
                        ) {
                          await api_con.login_api(mobile.text.toString());
                        }
                        else if (mobile.text.toString().length !=ll){
                          Utils().alertbox(
                              ' Please entre mobile no up to $ll digit ');
                        }
                        else{
                          Utils().alertbox(
                              ' Please entre mobile no ');
                        }
                      },
                    )),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.donothaveanaccount,
                    style: const TextStyle(
                        fontSize: 15,
                        color: colors.geryq1,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.signup,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: colors.primary,fontSize: 18 ,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Get.to(Signupd());
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
