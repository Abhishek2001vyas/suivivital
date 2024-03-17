import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:intl/intl.dart';
import '../../api_controller_user/HbA1c_api.dart';
import '../graph_01.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final hba1c_api = Get.put(hba_1c_api());
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
            "HbA1c Course",
            style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 25),
        child: FloatingActionButton(
          onPressed: () {
            hba1c_api.loader();
            hba1c_api.HBA_1C_api();
          },
          backgroundColor: Colors.amber.shade400,
          child: Obx(() => hba1c_api.isloading == false
              ? const Icon(
                  Icons.check,
                  color: Colors.black,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
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
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: w / 1.3,
                  child: TextFormField(
                    controller: hba1c_api.Hba_1c,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "HbA1c",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("%",style: TextStyle(fontSize: 13)),
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
                        //date = dateFormat.format(picker!);
                        hba1c_api.date.text =dateFormat.format(picker!) ;
                      });

                    },
                    controller: hba1c_api.date,
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
                        // DateFormat dateFormat = DateFormat('HH:mm');

                        hba1c_api.hour.text = picker.toString().substring(10,15);
                      });
                      print("gdkjfgkdsj${picker.toString()}");

                    },
                    controller: hba1c_api.hour,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(hintText: "Hour",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
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
