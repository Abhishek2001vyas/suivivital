import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/utils/color.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: colors.logosec,
      ),
    );
  }
}
