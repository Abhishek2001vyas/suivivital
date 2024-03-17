import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:intl/intl.dart';
import '../../api_controller_user/bodyweight_Api.dart';
import '../graph_01.dart';

class Body_weight extends StatefulWidget {
  const Body_weight({super.key});

  @override
  State<Body_weight> createState() => _Body_weightState();
}

class _Body_weightState extends State<Body_weight> {
  final bodyweight_api = Get.put(Bodyweight_api());
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Graph_page()));
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            "Body Weight",
            style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 25),
        child: FloatingActionButton(
          onPressed: () {
            bodyweight_api.loader();
            bodyweight_api.bodyweight_api();
          },
          child: Obx(() => bodyweight_api.isloading == false
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
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: w / 1.3,
                  child: TextFormField(

                    controller: bodyweight_api.weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Weight",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Kg",style: TextStyle(fontSize: 13)),
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
                        bodyweight_api.date.text =dateFormat.format(picker!) ;
                      });

                    },
                    controller: bodyweight_api.date,
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
                        bodyweight_api.hour.text = picker.toString().substring(10,15);
                      });
                      print("gdkjfgkdsj${picker.toString()}");

                    },
                    controller: bodyweight_api.hour,
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
