import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/common/policy_api.dart';
import '../../utils/color.dart';

class policy extends StatefulWidget {
  const policy({super.key});

  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
  final ploicy1 = Get.put(Policy_api());
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
        title: Text("Privacy Policy",style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),

      ),
      body: SingleChildScrollView(
        child:
        ploicy.isEmpty?
            Text("No data"):
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
    );
  }

  String htmlData = ploicy.elementAt(0);
}
