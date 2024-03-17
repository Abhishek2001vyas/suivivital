import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import 'package:suivivital/view/user/home/home1.dart';
import '../Doctoe/Homed.dart';
import '../Doctoe/profile/profile_controller.dart';
import '../user/api_controller_user/Notification.dart';
import '../user/api_controller_user/get_user_profile_api.dart';
import '../user/api_controller_user/getslider.dart';
import '../user/api_controller_user/nearpharmancy.dart';
import '../user/api_controller_user/newsapi.dart';
import '../user/api_controller_user/onlinedoctor_list_api.dart';
import '../user/api_controller_user/popualrdoctor_api.dart';
import 'g.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final getprofile = Get.put(Profile_controller());
  final slider = Get.put(Slider_image());
  final online_doctor = Get.put(Online_doctor_list());
  final popular_doctor = Get.put(popular_doctor_list());
  final get_profile__user_api_con = Get.put(Get_profile_api_user_controller());
  final nearphhh = Get.put(Nearpharmancy_list());
  final nearnew = Get.put(NearNews_list());
  final notifi = Get.put(Getnotification());
  @override
  void initState() {
    // TODO: implement initState
     getprofile.prof();
     online_doctor.online_doc();
     popular_doctor.popular_doc();
     nearphhh.pharmancy();
     nearnew.News();
     slider.slider();
     notifi.todaynot();
     notifi.torrnot();
    navigtohome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "assets/images/logo.jpeg",
        scale: 2,
      )),
    );
  }

  navigtohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    // currency();
    await _handle(Permission.camera);
    await _handle(Permission.location);
    await _handle(Permission.audio);
    await _handle(Permission.microphone);
    await _handle(Permission.storage);
    await _handle(Permission.manageExternalStorage);
    await _handle(Permission.photos);
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedus = shared_preferences.getString('user1_id');
    var isLogeddoc = shared_preferences.getString('user_id');
    if(isLogedus != null  ){
     await get_profile__user_api_con.user_profile();
      Get.to(()=> const Home1());
    }
    else if(isLogeddoc != null){
      await getprofile.prof();
      Get.to(()=> const Nav_bar());

      // getprofile.onli();

    }
    else {
      Get.to(() => const ONborad());
    }
  }

  void currency() async {
    var shared_preferences = await SharedPreferences.getInstance();
    Locale locale = Localizations.localeOf(context);
    var country = NumberFormat.simpleCurrency(
      name: "in",
    );
    var user_id = shared_preferences.setString(
        "country_curr", country.currencySymbol.toString());
    print("CURRENCY SYMBOL ${country.currencySymbol}");
    print("CURRENCY NAME ${country.currencyName}");
  }
}

_handle(Permission permission) async {
  final sstatus = await permission.request();
  var status = await permission.status;
}
