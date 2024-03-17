import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:intl/intl.dart';
import '../../api_controller_user/bloodpressure_api.dart';
import '../../api_controller_user/bodyweight_Api.dart';
import '../Blood_Sugar_Level/blood_level.dart';
import '../Body_Weight/body_weight.dart';
import '../Course/course.dart';
import '../graph_01.dart';

class Blood_pressure extends StatefulWidget {
  const Blood_pressure({super.key});

  @override
  State<Blood_pressure> createState() => _Blood_pressureState();
}

class _Blood_pressureState extends State<Blood_pressure> {
  final bloodpressure = Get.put(Bloodpressure_api());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                Get.to(() => Graph_page());
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            "Blood Pressure",
            style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 25),
        child: FloatingActionButton(
          onPressed: () {
            bloodpressure.loader();
            bloodpressure.bloodpres_api();
          },
          child: Obx(() => bloodpressure.isloading == false
              ? const Icon(
                  Icons.check,
                  color: Colors.black,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
          backgroundColor: Colors.amber.shade400,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h / 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Container(
                  width: w / 3.2,
                  child: TextFormField(
                    controller: bloodpressure.wei,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Weight",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "/",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: w / 3.2,
                  child: TextFormField(
                    controller: bloodpressure.wei2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Weight",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("mm/Hg",style: TextStyle(fontSize: 13,)),
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
                child: Container(
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
                       // date = dateFormat.format(picker!);
                        bloodpressure.date.text =dateFormat.format(picker!) ;
                      });

                    },
                    controller: bloodpressure.date,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(hintText: "Date",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: w / 2.5,
                  child: TextFormField(
                    readOnly: true,
                    onTap: ()async{
                      final  picker=await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now());
                      setState(() {
                        DateFormat dateFormat = DateFormat('HH:mm');

                        bloodpressure.hour.text = picker.toString().substring(10,15);
                      });
                      print("gdkjfgkdsj${picker.toString()}");

                    },
                    controller: bloodpressure.hour,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(hintText: "Hour",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
