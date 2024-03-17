import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/verify_otp/verify_controller.dart';
import '../../../utils/color.dart';
import '../api_controller/doc_time_api.dart';
import '../api_controller/resend_otp.dart';
import '../api_controller/verify_api.dart';
import '../login.dart';
import '../profile/profile_controller.dart';

class Verify_otp_doc extends StatefulWidget {
  final otp_dis;

  const Verify_otp_doc({
    super.key,
    this.otp_dis,
  });

  @override
  State<Verify_otp_doc> createState() => _Verify_otp_docState();
}

class _Verify_otp_docState extends State<Verify_otp_doc> {
  String otp = '';

  final verify_con = Get.put(verify());
  final api_con = Get.put(Verify_doctor_api());
  final verify_doc_api_con = Get.put(Resend_doctor_api());
  final profile_con = Get.put(Profile_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 65,
      height: 65,
      textStyle: TextStyle(
          fontSize: 20, color: colors.primary, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: colors.geryq1),
        borderRadius: BorderRadius.circular(15),
      ),
    );
    final verify_otp_doc = Get.put(verify());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.off(Logind());
              },
              icon: Icon(
                Icons.arrow_back,
                color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.verification,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: colors.hinttext),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
        child: Column(children: [
          Obx(
            () =>
// Text(
//   "Your OTP is : " + widget.otp_dis,
//   style: TextStyle(color: Colors.black, fontSize: 15),
// )
//     :
                Text(
              "Your OTP is : " + verify_con.otpagain1.toString(),
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          SizedBox(
            height: h / 20,
          ),
          Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,
              showCursor: true,
              onCompleted: (pin) {
                setState(() {
                  otp = pin;
                });
              }),
          SizedBox(
            height: h / 40,
          ),
          Obx(
            () => Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.youcanrequestotpafter,
                  style: TextStyle(color: colors.geryq1),
                ),
                verify_con.res == "Res"
                    ? TextButton(
                        onPressed: () async {
                          await verify_doc_api_con.resend_otp();
                        },
                        child:
                            Text("Resend", style: TextStyle(color: Colors.red)),
                        style: ButtonStyle(),
                      )
                    : buildTimer()
              ],
            )),
          ),
          SizedBox(
            height: h / 40,
          ),
          Container(
            width: w / 1,
            height: h / 15,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff4c5df4))),
                onPressed: () async {
                  api_con.loader();
                  var shared_preferences =
                      await SharedPreferences.getInstance();
                  var isLogedIn = shared_preferences.getString('user_id');
                  Map body = {
                    'user_id': isLogedIn.toString(),
                    "otp": otp.toString()
                  };
                  profile_con.prof();
                  await api_con.verify(body);
                },
                child: Text(
                  AppLocalizations.of(context)!.verify,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ]),
      ),
    );
  }

  var time;

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (context, value, child) {
            return Row(
              children: [
                Text(
                  "00:${value.toInt()}",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
