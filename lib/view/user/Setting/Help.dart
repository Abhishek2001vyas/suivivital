import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/utils/color.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: colors.logosec,
      ),
    );
  }
}
