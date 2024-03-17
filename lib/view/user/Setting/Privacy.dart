import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/utils/color.dart';

class privacy extends StatefulWidget {
  const privacy({super.key});

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700)),
        backgroundColor: colors.logosec,
      ),
    );
  }
}
