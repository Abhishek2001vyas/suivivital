import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import 'api_controller_user/newsapi.dart';

class News_details extends StatefulWidget {
  const News_details({super.key});

  @override
  State<News_details> createState() => _News_detailsState();
}

class _News_detailsState extends State<News_details> {

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),

          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 0,
          title: Text(
            "News Detalis",
            style:
            TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(height: h/4,width: w/1,
            child:ClipRRect(
             // borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                  fit: BoxFit.fill,
                  "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/news/${Newsdet.elementAt(0)["image"]}"),
            ),

          ),
           SizedBox(height: h/50),
          Column(
            children: [
              Material(elevation: 1,
                child: Container(height: h/1,width: w/1,color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Newsdet.elementAt(0)["title"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,),),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0,left: 5),
                            child: Divider(),
                          ),
                          Text(Newsdet.elementAt(0)["description"],style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w400,),),

                        ],
                      ),
                    )),
              ),



            ],)
          ]),
      ),


    );
  }
}
