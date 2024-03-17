import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../newsdetails.dart';


List Newslist = [];
List Newsdet = [];
class NearNews_list extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    News();
    super.onInit();
  }
  News()async{
    print("999");
    try {
      var res = await http.get(
        Uri.parse("${base_url}news_list"),
      );
      print("3333${jsonDecode(res.body)}");
      var resData = jsonDecode(res.body);
      print("888");

      print("2222");
      print("333"+resData.toString());
      if (res.statusCode == 200) {
        print("444");
        Newslist.clear();
        print("");
        Newslist.add(resData["data"]);
        print(Newslist.elementAt(0)[0]["id"]);
        print("0000");
      } else {
        print("5555");
        //Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }
  Newsde(id)async{
    print("999");
    try {
      var res = await http.post(
        Uri.parse("${base_url}news_details"),body: {
          "user_id":id.toString()
      }
      );
      print("3333${jsonDecode(res.body)}");
      var resData = jsonDecode(res.body);
      print("333"+resData.toString());
      if (res.statusCode == 200) {
        print("444");
        Newsdet.clear();
        print("");
        Newsdet.add(resData["data"]);
        Get.to(News_details());
        print("0000");
      } else {
        print("5555");
        //Utils().sendMassage('${resData['msg'].toString()}');
      }
    } catch (e) {}
  }
}