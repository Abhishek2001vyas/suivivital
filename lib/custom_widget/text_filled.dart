import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color.dart';

Widget TextFilled({
  int? limitno,
  required controller,
  validator,
  required keyType,
  required String hindtext,
  required String labeltext,
}) {
  return TextFormField(
    // initialValue: initialval,
    inputFormatters: [LengthLimitingTextInputFormatter(limitno)],
    controller: controller,
    validator: validator,
    keyboardType: keyType,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colors.geryq1, width: 1)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: colors.geryq1)),
        hintText: hindtext,
        labelText: labeltext,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  );
}

Widget TextFilled2({
  required controller,
  required validator,
  required keyType,
  required String hindtext,
  required String labeltext,
}) {
  return Container(
    child: TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      controller: controller,
      validator: validator,
      keyboardType: keyType,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colors.geryq1, width: 1)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: colors.geryq1)),
          hintText: hindtext,
          labelText: labeltext,
          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Widget TextFilled3({
  String? initialval,
  // required controller,
  // validator,
  // required keyType,
  // required String hindtext,
  String? labeltext,
}) {
  return TextFormField(
    // enabled: false,
    readOnly: true,
    initialValue: initialval,
    enableInteractiveSelection: false,
    inputFormatters: [LengthLimitingTextInputFormatter(50)],
    // controller: controller,
    // validator: validator,
    // keyboardType: keyType,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colors.geryq1, width: 1)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: colors.geryq1)),
        // hintText: hindtext,
        labelText: labeltext,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  );
}

class resizetextfilled extends StatelessWidget {
  const resizetextfilled({
    super.key,
    this.wi,
    this.dose,
    this.hinttext,
    this.labeltext,
    this.keyType,
  });

  final double? wi;
  final TextEditingController? dose;
  final String? hinttext;
  final String? labeltext;
  final keyType;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w / wi!,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        controller: dose,
        //validator: validator,
        keyboardType: keyType,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.geryq1, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.geryq1)),
            hintText: "medicines dose",
            labelText: "medicines dose",
            labelStyle: TextStyle()),
      ),
    );
  }
}
