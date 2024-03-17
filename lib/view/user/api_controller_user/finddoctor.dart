import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../common/modle/finddoctorlistmodel.dart';


List<Finddoctorlistmodel> searchlist = [];

class Find_Doctor extends GetxController {
  RxList<Finddoctorlistmodel> finddocotrlist = <Finddoctorlistmodel>[].obs;
  RxBool isloading =false.obs;

  
 Future<List<Finddoctorlistmodel>> finddoctor()async{
    try {
      var res = await http.get(
        Uri.parse("${base_url}all_doctor_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        finddocotrlist.clear();
        var data=Finddoctorlistmodel.fromJson(resData);
        finddocotrlist.add(data);

       return finddocotrlist;
      } else {
        return finddocotrlist;
      }
    } catch (e) {}
    return finddocotrlist;
  }

  Future<List<Finddoctorlistmodel>>searchdoctor(key)async{
    isloading.value=true;
    try {
      var res = await http.post(
        Uri.parse("${base_url}search_doctor"),
        body: {
          "keyword":key.toString()
        }
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        searchlist.clear();
        var data=Finddoctorlistmodel.fromJson(resData);
        searchlist.add(data);
        isloading.value =false;
        return searchlist;
      } else {  isloading.value =false;
        return searchlist;

      }
    } catch (e) {}
    return searchlist;
  }

  Future<List<Finddoctorlistmodel>> rating()async{
    try {
      var res = await http.get(
        Uri.parse("${base_url}doctor_fillter_rating"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        finddocotrlist.clear();
        var data=Finddoctorlistmodel.fromJson(resData);
        finddocotrlist.add(data);
        return finddocotrlist;
      } else {
        return finddocotrlist;
      }
    } catch (e) {}
    return finddocotrlist;
  }

  Future<List<Finddoctorlistmodel>> exper()async{
    try {
      var res = await http.get(
        Uri.parse("${base_url}search_experience"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        finddocotrlist.clear();
        var data=Finddoctorlistmodel.fromJson(resData);
        finddocotrlist.add(data);

        return finddocotrlist;
      } else {
        return finddocotrlist;
      }
    } catch (e) {}
    return finddocotrlist;
  }


}
