import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/form/unit/uint_controller.dart';
import '../../../../utils/color.dart';
import '../../api_controller_user/signup_api.dart';
import '../../api_controller_user/signup_form1.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final formKey = GlobalKey<FormState>();
  final unit_controller = Get.put(Unit_con());
  final signup_api = Get.put(Signup_user());
  final signup_form1_user_api = Get.put(Signup_form_1_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text("User Profile",
            style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: h / 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    CupertinoIcons.person_add,
                    color: colors.geryq1,
                    size: 24,
                  ),
                  Container(
                    width: w / 1.23,
                    height: h / 15,
                    child: TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: doctor_code,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "please enter Username";
                      //   }
                      //   return null;
                      // },
                      // keyboardType: keyType,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: colors.geryq1, width: 1)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: colors.geryq1)),
                          hintText: "Add your doctor account code",
                          labelText: "Add your doctor account code",
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: colors.geryq1,
                    size: 24,
                  ),
                  Container(
                    width: w / 1.23,
                    padding:
                        const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
                    child: Obx(
                      () {
                        return DropdownButton(
                          underline: const SizedBox(),
                          value: unit_controller.diabetetype.value,
                          hint: const Text('select'),
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: colors.primary),
                          items: diabetetypelist.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text("diabete type :- $items"),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            unit_controller.drop(newValue!);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  width: w / 2.9,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    controller: weight,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter weight";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: colors.geryq1, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: colors.geryq1)),
                        hintText: 'Entre weight',
                        labelText: 'weight',
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Text("Kg"),
                SizedBox(
                  width: w / 35,
                ),
                SizedBox(
                  width: w / 2.9,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    controller: height,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter height";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: colors.geryq1, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: colors.geryq1)),
                        hintText: 'Entre Height',
                        labelText: 'Height',
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Text("Cm"),
              ]),
              SizedBox(
                height: h / 50,
              ),
              const Text("Activity factor", style: TextStyle(color: colors.primary)),
              SizedBox(
                height: h / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.sports_gymnastics,
                    color: colors.geryq1,
                    size: 24,
                  ),
                  Container(
                    width: w / 1.23,
                    padding:
                        const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      value: dropdownvalue,
                      hint: const Text('select'),
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: colors.primary),
                      items: items.map((String items) {
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
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              const Center(
                child: Text("specify the unit of measurement",
                    style: TextStyle(color: colors.primary)),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  Container(
                    height: h / 20,
                    width: w / 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.logosec, width: 2)),
                    child: Icon(
                      Icons.done,
                      color: colors.logosec,
                    ),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  Container(
                    width: w / 1.24,
                    height: h / 15,
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: colors.logosec,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.geryq1, width: 1)),
                    child: Text("Metric (kg,gram,ml,cm)"),
                  )
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              Obx(() => signup_form1_user_api.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: w / 1,
                      height: h / 15,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff4c5df4))),
                          onPressed: () async {
                            //signup_api.view_change(2);

                            signup_form1_user_api.loader();
                            if (formKey.currentState!.validate()) {
                              await signup_form1_user_api.signup_user_form1(
                                  doctor_code.text.toString(),
                                  unit_controller.diabetetype.value.toString(),
                                  weight.text.toString(),
                                  height.text.toString(),
                                  dropdownvalue.toString());
                              //Get.to(Form1());
                            }
                            signup_form1_user_api.loader_fa();
                            //Get.to(Form3());
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    )),
            ],
          ),
        ),
      )),
    );
  }

  // var unit = 1;
  // var blood_unit = 0;
  // var carbo_unit=0;
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController doctor_code = TextEditingController();
  List<String> diabetetypelist = [
    'non-diabetes',
    'prediabetes',
    'type-1',
    'type-2',
    'lada',
    'gestational',
  ];
  String? dropdownvalue;
  List<String> items = [
    'Little or no exercise',
    'sport 1-3 days/week',
    'sport 3-5 days/week',
    'sport 6-7 days/week',
    'Sport and physical job',
  ];
// String diabetetype = "non-diabetes";
}
