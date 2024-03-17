import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suivivital/view/common/modle/poi.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../common/modle/doctor_timming.dart';
import '../../common/modle/userside_doctortime.dart';
import 'doctor_detatil.dart';

List booktime = [];
List bookday = [];
List qwert = [];
List ooo=[];
// List ooo1=[];
List lkj=[];
List bookappoint_details=[];
// int? trendIndex;

List<UsersideDoctortime>? time1;
class Book_time_api extends GetxController {
  RxBool isloading = false.obs;
  var dayno = DateTime.now().weekday.obs;
  var trendIndex=9.obs;
  List multiple_select = [].obs;
  List greycolor = [].obs;
  var timeid = "".obs;
  var dayid = "".obs;
  @override
  void onInit() async{
    var format = DateFormat('dd-MM-yyyy');
    var dateString = format.format(DateTime.now());
    // TODO: implement onInit
    await booktiming(details1.elementAt(0)["id"],DateTime.now().weekday,dateString.toString());

    super.onInit();
  }


  void loader() {
    isloading.value = true;
    update();
  }

  void loader_fa() {
    isloading.value = false;
    update();
  }

  void changedayweek(daynwo) {
    dayno.value = daynwo;

  }



  void mtime(val,time_id,day_id) {
    multiple_select.add(val);
    dayid.value=day_id;
    timeid.value=time_id;

  }

  booktiming(doctor_id,dayid,date) async {

    try {
      var res =
          await http.post(Uri.parse("https://logicaltest.website/Deepesh/SuiviVital_Doctor/Api/book_time_slote_user"), body: {
            'doctor_id': doctor_id.toString(),
            "date":date.toString(),
            "days_id":dayid.toString()
      });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        var time2 = UsersideDoctortime.fromJson(resData);
        lkj.clear();
        for(int e=0;e != time2.data!.length;e++){
        lkj.add(resData["data"][e]["time"]);}
        ;
        booktime.clear();
        bookday.clear();
        for(int i=0;i!=time2.data!.length;i++){
          bookday.add({
            "dayid":time2.data!.elementAt(i).daysId.toString(),
            "doctorid":time2.data!.elementAt(i).doctorId.toString(),
            "day":time2.data!.elementAt(i).day.toString(),
            "time1":lkj.elementAt(i),
          }
          );

          // for(int j=0;j !=time.data!.elementAt(i).time!.length;j++){
          //   booktime.add(time.data!.elementAt(i).time!.elementAt(j).toString() );
          // }
        }


        // for(int i=0;i !=time.data!.length;i++){
        //   bookday.add(time.data!.elementAt(i).daysId.toString());
        //   for (int j=0;j!= time.data!.elementAt(0).time!.length;j++) {
        //
        //     booktime.add(time.data!.elementAt(0).time!.join(" , ").toString());
        //   }
        // }

        // for (int i = 0; i != time.data!.length; i++) {
        //   booktime.add({
        //     "days_id": time.data!.elementAt(i).daysId.toString(),
        //     "time": time.data!.elementAt(i).time!.join(" , "),
        //   });
          // booktime.add( stringsplit);
          // update();
//         qwert.clear();
//         // if( booktime.indexWhere((f) =>
//         // f['days_id'] == "8")){
//         //  }
//         // else {
         trendIndex.value = bookday.indexWhere((f) => f['dayid'] == "$dayno");

//         // var result = booktime.elementAt(trendIndex)["time"].split(',');
//         if (trendIndex <= -1) {
//           ooo = [];
//         }
//         else {
//
//           ooo.clear();

//           for(int w=0;w != lkj.elementAt(trendIndex).length ;w++){
//
//            ooo.add(bookday.elementAt(trendIndex)["time1"][w]);
//
//           }
//
//           qwert.add(ooo);
//
//         }
        isloading.value = false;
      } else {
        lkj.clear();
        booktime.clear();
        bookday.clear();
        //Utils().sendMassage('${resData['msg'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }




  bookappointment(doctor_id,firstname,lastname,mobile,email,age,gender,problem,cons_fee,dates)
  async {
    try {
      var shared_preferences = await SharedPreferences.getInstance();
      var user_id_signup = shared_preferences.get('user1_id');
      var res =
          await http.post(Uri.parse("${base_url}book_appointment"),
              body: {
            "doctor_id":doctor_id,
            "age":age.toString(),
            "time_id":timeid.toString(),
            "user_id": user_id_signup.toString(),
            "days_id":dayid.toString(),
            "consultation_fees":cons_fee,
            "first_name":firstname.toString(),
            "last_name":lastname.toString(),
            "mobile":mobile.toString(),
            "email":email.toString(),
            "gender":gender.toString(),
            "about":problem.toString(),
            "date":dates.toString(),
          }
          );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['msg'].toString()} ');
        update();
        bookappoint_details.clear();
        bookappoint_details.add(resData["data"]);
        // var user_id = shared_preferences.setString("user_id",resData["data"]["id"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['msg'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {
      print("**");

    }
  }
}
