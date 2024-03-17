import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/user/verify_otp_user/verify_otp_controller.dart';
import '../../../utils/color.dart';
import '../api_controller_user/get_user_profile_api.dart';
import '../api_controller_user/onlinedoctor_list_api.dart';
import '../api_controller_user/popualrdoctor_api.dart';
import '../api_controller_user/verify_user_api.dart';
import '../loginu.dart';

class Verify_otp extends StatefulWidget {
  final otp_dis;

  const Verify_otp({
    super.key,
    this.otp_dis,
  });

  @override
  State<Verify_otp> createState() => _Verify_otpState();
}

class _Verify_otpState extends State<Verify_otp> {
  String otp = '';
  final verify_user_api_con = Get.put(Verify_api_user_controller());
  final verify_otp_user = Get.put(Verify_otp_user());
  final get_profile__user_api_con = Get.put(Get_profile_api_user_controller());
  final online_doctor = Get.put(Online_doctor_list());
  final popular_doctor = Get.put(popular_doctor_list());

  @override
  void initState() {
    // TODO: implement initState
    verify_otp_user.resent1();
    verify_otp_user.resent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 65,
      height: 65,
      textStyle: const TextStyle(
          fontSize: 20, color: colors.primary, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: colors.geryq1),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Loginu());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: colors.hinttext,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.verification,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: colors.hinttext),
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
              "Your OTP is : ${verify_otp_user.otpagain}",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          SizedBox(
            height: h / 20,
          ),
          Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
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
                  style: const TextStyle(color: colors.geryq1),
                ),
                verify_otp_user.res == "Res"
                    ? TextButton(
                        onPressed: () async {
                          await verify_user_api_con.resend_otp();
                        },
                        style: const ButtonStyle(),
                        child: const Text("Resend",
                            style: TextStyle(color: Colors.red)),
                      )
                    : buildTimer()
              ],
            )),
          ),
          SizedBox(
            height: h / 40,
          ),
          Obx(
            () => verify_user_api_con.isloading.value == true
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
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff4c5df4))),
                        onPressed: () async {
                          verify_user_api_con.loader();
                          var shared_preferences =
                              await SharedPreferences.getInstance();
                          var isLogedIn =
                              shared_preferences.getString('user1_id');
                          Map body = {
                            'user_id': isLogedIn.toString(),
                            "otp": otp.toString()
                          };

                          await verify_user_api_con.verify(body);
                          //await verify_otp_user.resentagainagin();
                        },
                        //Get.to(Home1());

                        child: Text(
                          AppLocalizations.of(context)!.verify,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        )),
                  ),
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
          duration: const Duration(seconds: 60),
          builder: (context, value, child) {
            return Row(
              children: [
                Text(
                  "00:${value.toInt()}",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
