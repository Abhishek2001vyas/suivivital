import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:suivivital/view/common/modle/userside_doctortime.dart';
import '../../api_controller_user/bloodsugarlevel_api.dart';
import '../graph_01.dart';
import 'package:intl/intl.dart';

class Blood_Sugar extends StatefulWidget {
  const Blood_Sugar({super.key});

  @override
  State<Blood_Sugar> createState() => _Blood_SugarState();
}

class _Blood_SugarState extends State<Blood_Sugar> {
  final _value = "-1";
  var date =DateTime.now().toString().substring(0,10);
  var time =TimeOfDay.now().toString();
  final blood_sugar_api = Get.put(Blood_sugar_api());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Graph_page()));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "Blood Sugar Level",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 25),
        child: FloatingActionButton(
          onPressed: () {
            blood_sugar_api.loader();
            blood_sugar_api.bloodsugar_api(dropdownvalue.toString());
          },
          backgroundColor: Colors.amber.shade400,
          child: Obx(() => blood_sugar_api.isloading == false
              ? const Icon(
                  Icons.check,
                  color: Colors.black,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: w / 1.3,
                    child: TextFormField(
                      controller: blood_sugar_api.blood_sugar,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Concentration",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("mg/dL",style: TextStyle(fontSize: 13)),
                )
              ],
            ),
            SizedBox(
              height: h / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: w / 2.5,
                    child: TextFormField(
                       readOnly: true,
                      onTap: ()async{
                       final  picker=  await  showDatePicker(
                             context: context,
                             firstDate: DateTime(1800),
                             lastDate: DateTime(2200),
                           initialDate: DateTime.now(),

                         );

                       setState(() {
                         DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                         date = dateFormat.format(picker!);
                        blood_sugar_api.date.text =date.toString() ;
                       });

                      },
                      //initialValue: date,
                     controller: blood_sugar_api.date,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(hintText: "Date",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    width: w / 2.5,
                    child: TextFormField(
                      readOnly: true,
                    onTap: ()async{
                      final  picker=await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now());
                      setState(() {
                        DateFormat dateFormat = DateFormat('HH:mm');

                        blood_sugar_api.hour.text = picker.toString().substring(10,15);
                      });
                      print("gdkjfgkdsj${picker.toString()}");

                    },
                     controller: blood_sugar_api.hour,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(hintText: "Hour",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Measure",
                style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: w / 1,
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(10),
                  // border: Border.fromBorderSide(BorderSide)
                  ),
              child: DropdownButton(style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),
                underline: const SizedBox(),
                // Initial Value
                value: dropdownvalue,
                hint: Text('select'),
                isExpanded: true,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: colors.primary,size: 20),

                // Array list of items
                items: bloodcheckshift.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue ?? '';
                  });
                },
              ),
            ),
            SizedBox(
              height: h / 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: blood_sugar_api.remarks,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(hintText: "Remarks",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dropdownvalue = "Before Breakfast";
  List<String> bloodcheckshift = [
    'Before Breakfast',
    'After Breakfast',
    "Before Lunch",
    'After Lunch',
    'Before Dinner',
    'After Dinner',
  ];
}
