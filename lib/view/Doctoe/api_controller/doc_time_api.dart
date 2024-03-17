import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import 'package:suivivital/view/common/modle/doctor_timming.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../doc_time/doc_time table.dart';
import '../doc_time/doc_time_controller.dart';



List daylist = [];
List timelist1 = [];
class Doc_time_api extends GetxController {
  List timings = [].obs;
  List timedoctor=[].obs;
  List gettime_list = [];
  List gettimeto_list = [];
  List gettimeid_list = [];
  List alldate = [];
  final add_day_cont = Get.put(Doc_time_controller());


  @override
  void onInit() {
    // TODO: implement onInit
    gettiming();
    oooo();
    time_list();
    super.onInit();
  }

  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }


  Day_list() async {
    try {
      loader();
      var res = await http.get(
        Uri.parse("${base_url}days_list"),
      );
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        daylist.clear();
        for (int i = 0; i != 8; i++) {
          daylist.add(resData["data"][i]["day"].toString());
          update();
        }
        ;
        loader_fa();
      } else {  loader_fa();
      }
    } catch (e) {}
  }

  RxBool isloading1 = false.obs;

  void loader1() {
    isloading1.value = true;
    update();
  }

  add_time(body) async {
    try {
      var res = await http.post(Uri.parse("${base_url}add_time"), body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}40');
        update();
        isloading1.value = false;
      } else {
        isloading1.value = false;
      }
    } catch (e) {}
  }

//  time_list() async {
//    var shared_preferences =
//    await SharedPreferences.getInstance();
//    var isLogedIn = shared_preferences.getString('user_id');
//    try {
//      var res = await http.post(
//        Uri.parse("${base_url}get_time_list"),body: {
//          "user_id":isLogedIn.toString(),
//      }
//      );
//      var resData = json.decode(res.body);
//
//      if (res.statusCode == 200 &&
//          resData["result"].toString() == "true".toString()) {
//        gettime_list.clear();
//        gettimeto_list.clear();
//        gettimeid_list.clear();
//        alldate.clear();
//        var qwer= Gettime.fromJson(resData);
//      // gettime_list.add( qwer.toString());
//
//        for (int i = 0; i != null; i++) {
//          gettimeid_list.add(qwer.data!.elementAt(i).id.toString());
//          gettimeto_list.add(qwer.data!.elementAt(i).endTime.toString());
//          gettime_list.add(qwer.data!.elementAt(i).startTime.toString());
//          alldate.add({qwer.data!.elementAt(i).endTime.toString() +"-"+qwer.data!.elementAt(i).startTime.toString()});
//
//        }
//        return qwer;
//        ;

//      } else {
//        Utils().sendMassage('${resData['msg'].toString()}');
//        // return qwer;
//      }
//    } catch (e) {}
//  }

  Submit(days_id,) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http.post(Uri.parse("${base_url}add_time_slots"), body: {
        "doctor_id": isLogedIn.toString(),
        "days_id": days_id.toString(),
        "time_id": add_day_cont.multiple_select.join(',').toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        add_day_cont.multiple_select.clear();
        add_day_cont.shift1(8);
        return Get.to(Doc_time());
      } else {
        Utils().sendMassage('${resData['msg'].toString()}e3');
      }
    } catch (e) {}
  }


  gettiming() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var is_time = shared_preferences.getString('user_id');
    try {
      var res =
      await http.post(Uri.parse("${base_url}get_time_slote_list"), body: {
        'doctor_id': is_time.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        var profile_data1 = DoctorTimming.fromJson(resData);
        timings.clear();
        timedoctor.clear();
        for (int i = 0; i != profile_data1.data!.length; i++) {
          timings.add({"day":
          profile_data1.data!.elementAt(i).day.toString(),
          "id": profile_data1.data!.elementAt(i).id.toString()
          });
        };
        for(int i = 0; i != profile_data1.data!.length; i++) {
            timedoctor.add(profile_data1.data!.elementAt(i).time!.join(" , "),);
          };
      } else {
        timings.clear();
        timedoctor.clear();
      }
    } catch (e) {}
  }

  void time_list() async {
    try {
      var res = await http.get(
        Uri.parse("${base_url}time_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        timelist1.clear();
        timelist1.add(resData["data"]);
        ;
      } else {

      }
    } catch (e) {}
  }

   oooo() {

  }

  doctor_time_delete(doctor_time_id) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var isLogedIn = shared_preferences.getString('user_id');
    try {
      var res = await http.post(Uri.parse("${base_url}doctor_time_delete"), body: {
        "doctor_id": isLogedIn.toString(),
        "doctor_time_id": doctor_time_id.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()}');
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }

}
