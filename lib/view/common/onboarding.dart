import 'package:flutter/material.dart';

class Onbroading extends StatefulWidget {
  const Onbroading({super.key});

  @override
  State<Onbroading> createState() => _OnbroadingState();
}

class _OnbroadingState extends State<Onbroading> {
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Image.asset("assets/images/Onboarding_1.png");
        },
      ),
    );
  }
}
