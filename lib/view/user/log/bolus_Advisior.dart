import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class Bolus_Advisior extends StatefulWidget {
  const Bolus_Advisior({super.key});

  @override
  State<Bolus_Advisior> createState() => _Bolus_AdvisiorState();
}

class _Bolus_AdvisiorState extends State<Bolus_Advisior> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fastfood_sharp,
                color: Colors.white,
                size: 25,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Bolus Advisior", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: h / 15,
                  width: w / 1,
                  decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total bolus :- 0"),
                        Text(
                          "+",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              GestureDetector(
                onTap: () {
                  Cal_alert();
                },
                child: Container(
                  height: h / 15,
                  width: w / 1,
                  decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cal :0 , Fat ; 0 , carbs :0 , Prot :0  "),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  Icon(
                    Icons.water_drop,
                    color: Colors.grey,
                    size: 24,
                  ),
                  SizedBox(
                    width: w / 50,
                  ),
                  Container(
                    height: h / 20,
                    width: w / 7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: colors.logosec)
                    ),
                    child: Center(child: Text('Glucose')),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  Row(
                    children: [
                      Container(
                          width: w / 9,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4)
                            ],
                            keyboardType: TextInputType.number,
                          )),
                      Text("  mmol/l")
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
                    Icons.water_drop,
                    color: colors.geryq1,
                    size: 25,
                  )),
                  Container(
                    width: w / 1.23,
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      // Initial Value
                      value: CGM,
                      hint: Text('CGM'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),

                      // Array list of items
                      items: Cgm.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          CGM = newValue ?? '';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.grey,
                    size: 24,
                  ),
                  SizedBox(
                    width: w / 50,
                  ),
                  Container(
                    height: h / 20,
                    width: w / 7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: colors.logosec)
                    ),
                    child: Center(child: Text('Carbs')),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  Row(
                    children: [
                      Container(
                          width: w / 9,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4)
                            ],
                            keyboardType: TextInputType.number,
                          )),
                      Text("  grams")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 0;
                      });
                    },
                    child: Container(
                      height: h / 20,
                      width: w / 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: unit == 0 ? colors.logosec : colors.geryq1,
                              width: 2)),
                      child: unit == 0
                          ? Icon(
                              Icons.done,
                              color: colors.logosec,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 0;
                      });
                    },
                    child: Container(
                      width: w / 1.24,
                      height: h / 15,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: unit == 0 ? colors.logosec : Color(0xffececec),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Extened Bolus"),
                    ),
                  )
                ],
              ),
              unit == 0
                  ? Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Proteins')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  grams")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Fats')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  grams")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Calories')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  Kcal")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Correction')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  %")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                    ])
                  : Text(""),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 1;
                      });
                    },
                    child: Container(
                      height: h / 20,
                      width: w / 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: unit == 1 ? colors.logosec : colors.geryq1,
                              width: 2)),
                      child: unit == 1
                          ? Icon(
                              Icons.done,
                              color: colors.logosec,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 1;
                      });
                    },
                    child: Container(
                      width: w / 1.24,
                      height: h / 15,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: unit == 1 ? colors.logosec : Color(0xffececec),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Metric (kg,gram,ml,cm)"),
                    ),
                  )
                ],
              ),
              unit == 1
                  ? Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Time')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          SizedBox(
                            width: w / 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: w / 2.6,
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffececec),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    // Initial Value
                                    value: tim,
                                    hint: Text('select'),
                                    isExpanded: true,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black),

                                    // Array list of items
                                    items: Time.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        tim = newValue ?? '';
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Intensity')),
                          ),
                          SizedBox(
                            width: w / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: w / 2.6,
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffececec),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    // Initial Value
                                    value: Inten,
                                    hint: Text('select'),
                                    isExpanded: true,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black),

                                    // Array list of items
                                    items: Intensity.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        Inten = newValue ?? '';
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Duration')),
                          ),
                          SizedBox(
                            width: w / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: w / 2.6,
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffececec),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    // Initial Value
                                    value: Dura,
                                    hint: Text('select'),
                                    isExpanded: true,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black),

                                    // Array list of items
                                    items: Duration.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        Dura = newValue ?? '';
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('Reduction')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  %")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                    ])
                  : Text(""),
              SizedBox(
                height: h / 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 2;
                      });
                    },
                    child: Container(
                      height: h / 20,
                      width: w / 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: unit == 2 ? colors.logosec : colors.geryq1,
                              width: 2)),
                      child: unit == 2
                          ? Icon(
                              Icons.done,
                              color: colors.logosec,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: w / 40,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        unit = null;
                      });
                    },
                    onTap: () {
                      setState(() {
                        unit = 2;
                      });
                    },
                    child: Container(
                      width: w / 1.24,
                      height: h / 15,
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: unit == 2 ? colors.logosec : Color(0xffececec),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Sickness Adjustment"),
                    ),
                  )
                ],
              ),
              unit == 2
                  ? Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w / 010,
                          ),
                          Container(
                            height: h / 20,
                            width: w / 5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: colors.logosec)
                            ),
                            child: Center(child: Text('increase')),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: w / 9,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    keyboardType: TextInputType.number,
                                  )),
                              Text("  %")
                            ],
                          )
                        ],
                      ),
                    ])
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }

  var unit;

  void Cal_alert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Filter'),
            content: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: () {}, child: Text("lunch")),
                    TextButton(onPressed: () {}, child: Text("lunch")),
                    TextButton(onPressed: () {}, child: Text("lunch")),
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> catea = [
    'night',
    'dinner',
    'lunch',
    'lunch',
    'snack',
  ];
  String? Dura;
  String? Inten;
  String? tim;
  String? CGM;
  List<String> Duration = [
    '15 min',
    '30 min',
    '1 hour',
    '1 1/2 hours',
    '2 hours',
  ];
  List<String> Intensity = [
    'Low',
    'Moderate',
    'High',
  ];
  List<String> Time = [
    'Before Exercise',
    'After Exercise',
  ];

  List<String> Cgm = [
    'None',
    'Abbott',
    'Eversense',
    'dexcom g6@',
    'other',
  ];
}
