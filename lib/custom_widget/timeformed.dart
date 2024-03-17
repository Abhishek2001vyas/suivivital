import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../view/Doctoe/add_prescription/add_prescription_controller.dart';
import '../view/Doctoe/api_controller/doc_time_api.dart';
import '../view/Doctoe/doc_time/doc_time_controller.dart';

class time_for_med extends StatelessWidget {
  time_for_med({
    super.key,
    // this.controller,
    this.hi,
    this.wi,
    this.tap,
    this.changeno,
    this.text,
  });

  // final TextEditingController ?controller;
  final double? hi;
  final double? wi;
  final VoidCallback? tap;
  final changeno;
  final String? text;
  final add_prescription_controller = Get.put(Add_prescription_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: tap,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: Obx(
              () =>
              Container(
                decoration: BoxDecoration(
                  color: add_prescription_controller.mae == changeno
                      ? Color(0xff6e7bf6)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: h / hi!,
                width: w / wi!,
                child: Center(
                  child: Text(text!,
                      style: TextStyle(
                        color: add_prescription_controller.mae == changeno
                            ? Colors.white
                            : Colors.grey,
                      )),
                ),
              ),
        ),
      ),
    );
  }
}

class days_time_add extends StatelessWidget {
  days_time_add({
    super.key,
    this.ontap,
    required this.hi,
    required this.wi,
    required this.text,
    this.changeno,
  });

  final String text;
  final double hi;
  final double wi;
  final VoidCallback ?ontap;
  final int ?changeno;
  final add_day_cont = Get.put(Doc_time_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: ontap,
      child: Obx(
            () =>
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Container(
                height: h / hi,
                width: w / wi,
                decoration: BoxDecoration(
                  color: add_day_cont.shift == changeno
                      ? Color(0xff6e7bf6)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(text,
                        style: TextStyle(
                            fontSize: 13,
                            color: add_day_cont.shift == changeno
                                ? Colors.white
                                : Colors.black))),
              ),
            ),
      ),
    );
  }
}

class timelistwidget extends StatefulWidget {
  final String changeno;
  // final VoidCallback ontap;
  // final VoidCallback longpress;
  final String text;
  final removeindex;
  final enterindex;
  const timelistwidget({super.key, required this.changeno, required this.text, this.removeindex, this.enterindex});

  @override
  State<timelistwidget> createState() => _timelistwidgetState();
}

class _timelistwidgetState extends State<timelistwidget> {
  final add_day_cont = Get.put(Doc_time_controller());
  final doc_time_api = Get.put(Doc_time_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return
      Obx(() =>
      GestureDetector(
      // onLongPress: () {
      //   add_day_cont.rtime(widget.removeindex);
      //   print(add_day_cont.multiple_select);
      // },
      onTap: () {
        String input =widget.enterindex ;
        int num = int.parse(input);

        print(num.runtimeType);

        if (add_day_cont.multiple_select.contains(widget.changeno)) {
          add_day_cont.rtime(widget.removeindex);
          // Utils().sendMassage('Already added');
        } else {
          add_day_cont.mtime(widget.enterindex);
        }
        print(add_day_cont.multiple_select);
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: Container(
          height: h / 19,
          width: w / 5,
          decoration: BoxDecoration(
            color: add_day_cont.multiple_select
                .contains(widget.changeno)
                ? Color(0xff6e7bf6)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(widget.text,
                  style: TextStyle(
                      fontSize: 13,
                      color: add_day_cont.multiple_select
                          .contains(widget.changeno)
                          ? Colors.white
                          : Colors.black))),
        ),
      ),
    ));
  }
}
