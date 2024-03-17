import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:intl/intl.dart';

import '../../custom_widget/text_filled.dart';
import 'api_controller_user/reminderapi.dart';


class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final formKey = GlobalKey<FormState>();
  final Reminder_api = Get.put(Reminderapi());
  TextEditingController title = TextEditingController();
  TextEditingController desription = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        title: Text("Reminder"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20, top: 15, bottom: 20),
          child: Form(key: formKey,
            child: Column(children: [
              TextFilled(
                controller: title,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter title";
                  }
                  return null;
                },
                keyType: TextInputType.name,
                hindtext: 'Entre title',
                labeltext: 'title',
              ),
              SizedBox(
                height: h / 70,
              ),
              TextFilled(
                controller: desription,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter desription";
                  }
                  return null;
                },
                keyType: TextInputType.name,
                hindtext: 'desription',
                labeltext: 'desription',
              ),
              SizedBox(
                height: h / 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: w / 3,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter date";
                          }
                          return null;
                        },
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
                           date.text =dateFormat.format(picker!) ;
                          });

                        },
                        controller: date,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(hintText: "Date",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      width: w / 3,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter time";
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: ()async{
                          final  picker=await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now());
                          setState(() {
                            // DateFormat dateFormat = DateFormat('HH:mm');

                            time.text = picker.toString().substring(10,15);
                          });
                          print("gdkjfgkdsj${picker.toString()}");

                        },
                        controller: time,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(hintText: "Hour",hintStyle: TextStyle(fontSize: 13,color: Colors.grey)),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: h / 70,
              ),
            Obx(() => Reminder_api.isloading.value == true?
              const Center(
                child: CircularProgressIndicator(),
              )
                  :
              Container(width: w/1,height: h/20,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xff4c5df4))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                     await   Reminder_api.reminder_api(
                         title.text.toString(),
                     date.text.toString(),
                       time.text.toString(),
                       desription.text.toString()
                     );
                      }
                      else{
                        return null;
                      }


                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    )),

        )
            ),
              SizedBox(height: h/50,),
              FutureBuilder(future: Reminder_api.reminderget_api(), builder: (context, snapshot) {
                return   ListView.builder(shrinkWrap: true,
                  itemCount: Reminder_api.getreminder.elementAt(0).length,
                  itemBuilder:(context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Material(borderRadius: BorderRadius.circular(10),elevation: 1,
                        child: Container(
                          width: w/1,
                          decoration: BoxDecoration(color: Colors.white,borderRadius:  BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Reminder_api.getreminder.elementAt(0)[index]["date"]),
                                Text(Reminder_api.getreminder.elementAt(0)[index]["time"]),
                              ],
                            ),
                            Text(Reminder_api.getreminder.elementAt(0)[index]["title"]),
                            Text(Reminder_api.getreminder.elementAt(0)[index]["desription"]),
                          ],
                        ),
                      ),


                        ),
                      ),
                    );
                  },);
              },)


            ]),
          ),
        ),
      ),
    );
  }
}
