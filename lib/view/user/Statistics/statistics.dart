import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/custom_widget/drawer.dart';
import 'package:suivivital/utils/color.dart';

class statistics_01 extends StatefulWidget {
  const statistics_01({super.key});

  @override
  State<statistics_01> createState() => _statistics_01State();
}

class _statistics_01State extends State<statistics_01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        title: Text("Statistics"),
        backgroundColor: colors.logosec,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
      ),
    );
  }
}
