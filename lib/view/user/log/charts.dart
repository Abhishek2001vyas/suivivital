import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        actions: [
          Container(
            width: w / 3.5,
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton(
              underline: const SizedBox(),
              // Initial Value
              value: cate,
              hint: Text('interval', style: TextStyle(color: Colors.white)),
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),

              // Array list of items
              items: catea.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              onChanged: (String? newValue) {
                setState(() {
                  cate = newValue ?? '';
                });
              },
            ),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Chart", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                // PieChart(
                //   dataMap: dataMap,
                //   animationDuration: Duration(milliseconds: 800),
                //   chartLegendSpacing: 32,
                //   chartRadius: MediaQuery.of(context).size.width / 3.2,
                //   initialAngleInDegree: 0,
                //   //chartType: ChartType.ring,
                //   ringStrokeWidth: 32,
                //   centerText: "HYBRID",
                //   legendOptions: LegendOptions(
                //     showLegendsInRow: false,
                //     legendPosition: LegendPosition.right,
                //     showLegends: true,
                //
                //     legendTextStyle: TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   chartValuesOptions: ChartValuesOptions(
                //     showChartValueBackground: true,
                //     showChartValues: true,
                //     showChartValuesInPercentage: false,
                //     showChartValuesOutside: false,
                //     decimalPlaces: 1,
                //   ),
                //   // gradientList: ---To add gradient colors---
                //   // emptyColorGradient: ---Empty Color gradient---
                // )
                )
          ],
        ),
      ),
    );
  }

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  List<String> catea = [
    '7 days',
    '14 days',
    '30 days',
    '90 days',
    'other',
  ];
  String? cate;
}
