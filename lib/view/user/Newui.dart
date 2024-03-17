import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widget/drawer.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/newsapi.dart';
import 'newsdetails.dart';


class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final newsde= Get.put(NearNews_list());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white //Color(0xfff7f7fc)
      ,
      drawer: const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(  iconTheme: IconThemeData(color: Colors.white),
        // automaticallyImplyLeading: false,
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text(
         "News",
          style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding:  const EdgeInsets.only(left: 10.0, right: 10, top: 15,),
          child: Container(width: w,height: h,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: Newslist.elementAt(0).length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: ()async{
                    await newsde.Newsde(Newslist.elementAt(0)[index]["id"]);
                  },
                  child: Material(
                    elevation: 2,
                    borderRadius:
                    BorderRadius
                        .circular(15),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      height:h/8,width:w/1 ,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        SizedBox(height: h/10,width: w/4.5,
                          child:ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                                fit: BoxFit.fill,
                                "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/news/${Newslist.elementAt(0)[index]["image"]}"),
                          ),

                        ),
                        SizedBox(
                            width: w /
                                40),
                        Column(
                          children: [
                          SizedBox(width: w/1.9,
                          child: Text(overflow: TextOverflow.ellipsis,
                            Newslist.elementAt(0)[index]["title"].toString(),style: TextStyle(fontSize: 13),)),
                            SizedBox(height: h/13,width: w/1.9,
                            child: Text(maxLines: 3, overflow: TextOverflow.ellipsis,
                            Newslist.elementAt(0)[index]["description"].toString(),
                            style: TextStyle(fontSize: 10,color: Colors.grey)),
                            )
                        ],)
                      ]),
                    ),
                    ),
                  ),
                ),
              );
            },),
          ),
        ),
      ),
    );
  }
}
