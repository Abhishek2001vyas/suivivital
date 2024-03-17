import 'package:flutter/material.dart';

class Button_widget extends StatefulWidget {
  final button_width;
  final button_height;
  final String buttontext;
  final VoidCallback? onpressed;

  const Button_widget(
      {super.key,
      this.button_width,
      this.button_height,
      required this.buttontext,
      this.onpressed});

  @override
  State<Button_widget> createState() => _Button_widgetState();
}

class _Button_widgetState extends State<Button_widget> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w / widget.button_width,
      height: h / widget.button_height,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(Color(0xff4c5df4))),
          onPressed: widget.onpressed,
          //     () {
          //   Get.to(Signup2());
          // },
          child: Text(
            widget.buttontext,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
