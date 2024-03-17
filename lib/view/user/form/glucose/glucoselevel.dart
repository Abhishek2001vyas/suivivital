import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/color.dart';
import '../../api_controller_user/signup_api.dart';
import '../../api_controller_user/signup_form5.dart';
import 'glucoselevel_controller.dart';

class Form5 extends StatefulWidget {
  const Form5({super.key});

  @override
  State<Form5> createState() => _Form5State();
}

class _Form5State extends State<Form5> {
  final signup_api = Get.put(Signup_user());
  final signup_form5_user_api = Get.put(Signup_form_5_api());
  final glucose_con = Get.put(gulcoselevel_controller());
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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("User Profile",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: h / 70,
              ),
              Center(
                child: Text("Glucose level target range(mmol/l)",
                    style: TextStyle(
                        color: colors.primary, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Hyperglycemia", style: TextStyle(fontSize: 12)),
                      SizedBox(height: h / 80),
                      Container(
                        width: w / 3.5,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: colors.geryq1, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.geryq1)),
                          ),
                          controller: hypogly_cemia,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: w / 80),
                  Column(
                    children: [
                      Text("Glucose target", style: TextStyle(fontSize: 12)),
                      SizedBox(height: h / 80),
                      Container(
                        width: w / 3.5,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: colors.geryq1, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.geryq1)),
                          ),
                          controller: glucose_traget,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: w / 80),
                  Column(
                    children: [
                      Text("Glucose hi", style: TextStyle(fontSize: 12)),
                      SizedBox(height: h / 80),
                      Container(
                        width: w / 3.5,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: colors.geryq1, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.geryq1)),
                          ),
                          controller: glucose_hi,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("glucose low", style: TextStyle(fontSize: 12)),
                      SizedBox(height: h / 80),
                      Container(
                        width: w / 3.5,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: colors.geryq1, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.geryq1)),
                          ),
                          controller: glucose,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("hypoglycemia", style: TextStyle(fontSize: 12)),
                      SizedBox(height: h / 80),
                      Container(
                        width: w / 3.5,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: colors.geryq1, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.geryq1)),
                          ),
                          controller: hypoglycemia,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h / 50,
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
                          height: h / 5,
                          child: AlertDialog(
                            title: const Text("insulin senstivity(hourly)"),
                            content: Container(
                              height: h / 5,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Time = "),
                                      SizedBox(width: w / 50),
                                      Text(DateTime.now()
                                          .toString()
                                          .substring(11, 18)),
                                    ],
                                  ),
                                  SizedBox(height: h / 50),
                                  Container(
                                    height: h / 20,
                                    width: w / 1,
                                    child: TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        controller: ratio,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  glucose_con.val11(1);
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
                      () => glucose_con.val1.value == 0
                          ? Container(
                              width: w / 1.23,
                              height: h / 13,
                              padding: EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: Text("insulin senstivity(hourly)"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Time  = "),
                                          SizedBox(
                                            width: w / 50,
                                          ),
                                          Text(DateTime.now()
                                              .toString()
                                              .substring(11, 18)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("ratio   = "),
                                          SizedBox(
                                            width: w / 50,
                                          ),
                                          Text(ratio.text.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: -1,
                                  child: IconButton(
                                      onPressed: () {
                                        glucose_con.val11(0);
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
                height: h / 50,
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
                          height: h / 5,
                          child: AlertDialog(
                            title: const Text("Carbohydrates ratio(hourly)"),
                            content: Container(
                              height: h / 5,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Time = "),
                                      SizedBox(width: w / 50),
                                      Text(DateTime.now()
                                          .toString()
                                          .substring(11, 18)),
                                    ],
                                  ),
                                  SizedBox(height: h / 50),
                                  Container(
                                    height: h / 20,
                                    width: w / 1,
                                    child: TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        controller: ratio_2,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  glucose_con.val22(1);
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
                      () => glucose_con.val2.value == 0
                          ? Container(
                              width: w / 1.23,
                              height: h / 13,
                              padding: EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: Text("Carbohydrates ratio(hourly)"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Time  = "),
                                          SizedBox(
                                            width: w / 50,
                                          ),
                                          Text(DateTime.now()
                                              .toString()
                                              .substring(11, 18)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("ratio   = "),
                                          SizedBox(
                                            width: w / 50,
                                          ),
                                          Text(ratio_2.text.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: -1,
                                  child: IconButton(
                                      onPressed: () {
                                        glucose_con.val22(0);
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
              Obx(
                () => signup_form5_user_api.isloading == true
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff4c5df4))),
                            onPressed: () async {
                              signup_form5_user_api.loader();
                              await signup_form5_user_api.signup_user_form5(
                                  hypogly_cemia.text.toString(),
                                  glucose_traget.text.toString(),
                                  glucose_hi.text.toString(),
                                  glucose.text.toString(),
                                  hypoglycemia.text.toString(),
                                  ratio.text.toString(),
                                  ratio_2.text.toString(),
                                  time.text.toString(),
                                  time2.text.toString());
                              //signup_form5_user_api.loader_fa();
                              //signup_api.view_change(0);
                            },
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController hypogly_cemia = TextEditingController();
  TextEditingController glucose_traget = TextEditingController();
  TextEditingController glucose_hi = TextEditingController();
  TextEditingController glucose = TextEditingController();
  TextEditingController hypoglycemia = TextEditingController();
  TextEditingController ratio = TextEditingController();
  TextEditingController ratio_2 = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController time2 = TextEditingController();
}
