import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io' as io;
import 'package:external_path/external_path.dart';
import '../../Doctoe/api_controller/getmedicinebydoctor.dart';
import '../api_controller_user/doctor_detatil.dart';



class History_user extends GetxController {
  var his = 0.obs;
  final pdf = pw.Document();

  void In(int val) {
    his.value = val;
  }

  createpdf(date,time,name) async {
    final downloadsDir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    print("$downloadsDir )))");
    var ppath = "$downloadsDir/suivivital${DateTime.now().toString().substring(15,16)}.pdf";
    final img = await rootBundle.load('assets/images/logo.jpeg');
    final imageBytes = img.buffer.asUint8List();
    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
    if (await File(ppath).exists()){
      print("exist in download");

    }
    else{

      List<pw.Widget> lll=[

      pw.Row(
          children: [
            pw.Container(
                height: 100,width: 100,
                child: image1
            ),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Dr. ${details_review.elementAt(0)[0]["name"]}"),
                  pw.Text("Dr. ${details_review.elementAt(0)[0]["address"]}"),
                  pw.Text("Appointment date:-  ${date}"),
                  pw.Text("Appointment time:-  ${time}"),
                  pw.Text("Patient name:-      ${name}"),
                ]
            )

          ]
      ),
      pw.Divider(thickness: 5),
      pw.ListView.builder(
        itemCount: Getmedicinebydoctorforplistforpdf.elementAt(0).length,
        itemBuilder: (context, index) {
          return pw.Padding(
            padding:  pw.EdgeInsets.only(bottom: 8.0),
            child: pw.Container(
              child: pw.Padding(
                padding:  pw. EdgeInsets.only(left: 15.0,right: 15,top: 10,bottom: 10),
                child:pw. Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.SizedBox(
                            child: pw.Text("Medicines name :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                        pw.Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["medicines_name"].toString()),

                      ],
                    ),

                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw.SizedBox(
                                width: 200,
                                child: pw.Text("medicines dose :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw.Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["medicines_dose"].toString() +"mg"),
                          ]),),

                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw.SizedBox(
                                width: 200,
                                child: pw.Text("medicines brand :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw.SizedBox(

                              child: pw.Text(
                                  Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["medicines_brand"].toString()),
                            )
                          ]),)

                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child:pw. Row(children: [
                            pw.SizedBox(
                                width: 100,
                                child: pw.Text("days :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw. Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["days"].toString()),
                          ]),),


                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw. SizedBox(
                                width: 100,
                                child: pw.Text("eating :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw. Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["eating"].toString()),

                          ]),),


                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw. SizedBox(
                                width: 100,
                                child: pw.Text("week day :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw.Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["week_day"].toString()),
                          ]),),


                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child:pw. Row(children: [
                            pw.SizedBox(
                                width: 100,
                                child: pw.Text("eating time :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw. Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["eating_time"].toString()),

                          ]),),


                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw.SizedBox(
                                width: 100,
                                child: pw.Text("medicines days :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw.Text(Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["medicines_days"].toString()),
                          ]),),


                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.SizedBox(
                          child: pw.Row(children: [
                            pw.SizedBox(
                                width: 100,
                                child: pw.Text(
                                  "comment :- ",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                            pw.SizedBox(
                                child: pw.Text(
                                    Getmedicinebydoctorforplistforpdf.elementAt(0)[index]["comment"].toString())),

                          ]),),


                      ],
                    ),
                  ],
                ),
              ),),
          );
        },)

      ];
      print(lll.length);
      print(lll.toString());
      pw.Document pdf = pw.Document();
    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          maxPages: 100,
          build: (context) => lll,),
    );
    final file = File(ppath);
    print("33");
    await file.writeAsBytes( await pdf.save());
    print("44");
    print("done");
    }
  }

  savepdf() async {
      final output = await getTemporaryDirectory();
    final downloadsDir = await getDownloadsDirectory();
    var ppath = "${downloadsDir!.path}/examplefgfdgfdg.pdf";
    final file = File(ppath);
    await io.File(ppath).writeAsBytes(await pdf.save());
    print("fhikdh");
  }
}
