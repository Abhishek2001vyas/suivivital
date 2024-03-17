import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/utils/color.dart';

class user_name_change extends StatefulWidget {
  const user_name_change({super.key});

  @override
  State<user_name_change> createState() => _user_name_changeState();
}

class _user_name_changeState extends State<user_name_change> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change user_name"),
        backgroundColor: colors.logosec,
      ),
    );
  }
}
