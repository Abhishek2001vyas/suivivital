import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../utils/color.dart';
import 'aboutus_api.dart';

class About_us extends StatefulWidget {
  const About_us({super.key});

  @override
  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  final about = Get.put(Aboutus_api());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        leading: IconButton(
            onPressed: () {
              Get.back();
              // Get.to(Loginu());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("About us",
            style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),


      ),
      body: SingleChildScrollView(
        child:
            Obx(() =>
            about1.isEmpty?
            Text("No data")
                :
            about.isloading1 == true ?
             Center(child: CircularProgressIndicator(),)
            :
                Html(
                  data: htmlData,
                  style: {
                    "table": Style(
                      backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                    ),
                    "tr": Style(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    "th": Style(
                      padding: HtmlPaddings.all(6),
                      backgroundColor: Colors.grey,
                    ),
                    "td": Style(
                      padding: HtmlPaddings.all(6),
                      alignment: Alignment.topLeft,
                    ),
                    'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                  },
                ),
            ),

      ),
    );
  }

  String htmlData = about1.elementAt(0).toString();
}
