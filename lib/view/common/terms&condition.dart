import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/common/terms_api.dart';
import '../../utils/color.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final terms = Get.put(Terms_api());

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
        title: Text("Terms & Condition",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Termscond.isEmpty?
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

  String htmlData = Termscond.elementAt(0);
}
