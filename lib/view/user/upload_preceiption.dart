import 'package:flutter/material.dart';

import '../../custom_widget/drawer.dart';
import '../../utils/color.dart';

class Upload_pre extends StatefulWidget {
  const Upload_pre({super.key});

  @override
  State<Upload_pre> createState() => _Upload_preState();
}

class _Upload_preState extends State<Upload_pre> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.logosec,
        elevation: 0,

        title: Text("Upload Prescrption",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18)),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: h / 20,
              ),
              Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Upload Prescription",
                                style: TextStyle(color: colors.logosec),
                              ))
                        ],
                      ),
                      height: h / 15,
                      width: w / 1)),
              SizedBox(
                height: h / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
