import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../../api_controller_user/get_dropdown_list.dart';
import '../../../api_controller_user/signup_api.dart';
import '../../../api_controller_user/update_api.dart';
import 'medicines_controller_edit.dart';

class Form4_edit extends StatefulWidget {
  final noninsulin;

  const Form4_edit({super.key, required this.noninsulin});

  @override
  State<Form4_edit> createState() => _Form4_editState();
}

class _Form4_editState extends State<Form4_edit> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.noninsulin);
    super.initState();
  }

  final signup_api = Get.put(Signup_user());
  final signup_Form4_edit_user_api = Get.put(Update_profile_user());
  final medicines_con = Get.put(Medicined__edit_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
      child: Column(
        children: [
          SizedBox(
            height: h / 70,
          ),
          Text("what medication do you ue?",
              style: TextStyle(color: colors.primary)),
          widget.noninsulin == 1 || widget.noninsulin == 2
              ? SizedBox(
                  height: h / 70,
                )
              : Text(""),
          widget.noninsulin == 1 || widget.noninsulin == 2
              ? Column(
                  children: [
                    Center(
                      child: Text("Rapid/short acting insulin",
                          style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: h / 70,
                    ),
                    Container(
                      width: w / 1,
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // Initial Value
                        value: short,
                        hint: Text('other'),
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: colors.primary),

                        // Array list of items
                        items: rapidshortactinginsulin_data.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            short = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ],
                )
              : Text(""),
          widget.noninsulin == 1 || widget.noninsulin == 2
              ? SizedBox(
                  height: h / 70,
                )
              : Text(""),
          widget.noninsulin == 1
              ? Column(
                  children: [
                    Center(
                      child: Text("intermediate/long acting insulin",
                          style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: h / 70,
                    ),
                    Container(
                      width: w / 1,
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.geryq1, width: 1)),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // Initial Value
                        value: intermedia,
                        hint: Text('other'),
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: colors.primary),

                        // Array list of items
                        items: intermediatelong_actinginsulin_data
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            intermedia = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ],
                )
              : const Text(""),
          widget.noninsulin == 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Icon(
                      Icons.add,
                      color: colors.geryq1,
                      size: 24,
                    )),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => Container(
                            height: h / 3,
                            child: AlertDialog(
                              title: const Text("Add Basal"),
                              content: Container(
                                height: h / 3,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("medicine Name"),
                                        Container(
                                          height: h / 20,
                                          width: w / 1,
                                          child: TextFormField(
                                              controller: medi_name_2,
                                              decoration: InputDecoration(
                                                  // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                  contentPadding:
                                                      EdgeInsets.all(5),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black)))),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: h / 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("medicine dose"),
                                        Container(
                                          height: h / 20,
                                          width: w / 1,
                                          child: TextFormField(
                                              controller: dose_2,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(5),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black)))),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: h / 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("medicine qty"),
                                        Container(
                                          height: h / 20,
                                          width: w / 1,
                                          child: TextFormField(
                                              controller: qty_2,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(5),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black)))),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    medicines_con.val11(1);
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text("Submit"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Obx(
                        () => medicines_con.val1.value == 0
                            ? Container(
                                width: w / 1.23,
                                height: h / 13,
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colors.geryq1, width: 1)),
                                child: Text("Basal"),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    width: w / 1.23,
                                    height: h / 10,
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: colors.geryq1, width: 1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("medicine Name = "),
                                            SizedBox(
                                              width: w / 50,
                                            ),
                                            Text(medi_name_2.text.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("medicine dose   = "),
                                            SizedBox(
                                              width: w / 50,
                                            ),
                                            Text(dose_2.text.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("medicine qty      ="),
                                            SizedBox(
                                              width: w / 40,
                                            ),
                                            Text(qty_2.text.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: -1,
                                    child: IconButton(
                                        onPressed: () {
                                          medicines_con.val11(0);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ],
                )
              : const Text(""),
          widget.noninsulin == 1 || widget.noninsulin == 2
              ? SizedBox(
                  height: h / 70,
                )
              : Text(""),
          Center(
            child: Text("medications",
                style: TextStyle(
                    color: colors.primary, fontWeight: FontWeight.bold)),
          ),
          // add medication
          SizedBox(
            height: h / 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: Icon(
                Icons.add,
                color: colors.geryq1,
                size: 24,
              )),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => Container(
                      height: h / 3,
                      child: AlertDialog(
                        title: const Text("Add medication"),
                        content: Container(
                          height: h / 3,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("medicine Name"),
                                  Container(
                                    height: h / 20,
                                    width: w / 1,
                                    child: TextFormField(
                                        controller: medi_name,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))),
                                  )
                                ],
                              ),
                              SizedBox(height: h / 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("medicine dose"),
                                  Container(
                                    height: h / 20,
                                    width: w / 1,
                                    child: TextFormField(
                                        controller: dose,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))),
                                  )
                                ],
                              ),
                              SizedBox(height: h / 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("medicine qty"),
                                  Container(
                                    height: h / 20,
                                    width: w / 1,
                                    child: TextFormField(
                                        controller: qty,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              medicines_con.val22(1);
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Submit"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Obx(
                  () => medicines_con.val2.value == 0
                      ? Container(
                          width: w / 1.23,
                          height: h / 13,
                          padding: EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: colors.geryq1, width: 1)),
                          child: Text("Add medications"),
                        )
                      : Stack(
                          children: [
                            Container(
                              width: w / 1.23,
                              height: h / 10,
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("medicine Name = "),
                                      SizedBox(
                                        width: w / 50,
                                      ),
                                      Text(medi_name.text.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("medicine dose   = "),
                                      SizedBox(
                                        width: w / 50,
                                      ),
                                      Text(dose.text.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("medicine qty      ="),
                                      SizedBox(
                                        width: w / 40,
                                      ),
                                      Text(qty.text.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -1,
                              child: IconButton(
                                  onPressed: () {
                                    medicines_con.val22(0);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 20,
          ),
          Obx(() => signup_Form4_edit_user_api.isloading == true
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
                        signup_Form4_edit_user_api.view_change(4);
                        // signup_Form4_edit_user_api.loader();
                        // if(formKey.currentState!.validate()) {
                        // await signup_Form4_edit_user_api.signup_user_Form4_edit(
                        //     short.toString(),
                        //     dose_2.text.toString(),
                        //     qty_2.text.toString(),
                        //     medi_name.text.toString(),
                        //     dose.text.toString(),
                        //     qty.text.toString(),
                        //     medi_name_2.text.toString(),
                        //     intermedia.toString());
                        //   //Get.to(Form1());
                        // }
                        // signup_Form4_edit_user_api.loader_fa();
                        //signup_api.view_change(4);
                        //Get.to(Form5());
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                )),
        ],
      ),
    ));
  }

  TextEditingController dose = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController medi_name = TextEditingController();
  TextEditingController dose_2 = TextEditingController();
  TextEditingController qty_2 = TextEditingController();
  TextEditingController medi_name_2 = TextEditingController();

  String? short;

  // List<String> itemsr = [
  //   'none',
  //   'actrapid',
  //   'fiasp',
  //   'humalog',
  //   'humulin',
  // ];
  String? intermedia;
// List<String> itemsm = [
//   'none',
//   'humalog mix50/50',
//   'humulin mix 70/30',
//   'lantus',
//   'levemir',
// ];
}
