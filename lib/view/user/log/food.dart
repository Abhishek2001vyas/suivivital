import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.logosec,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.grid_view,
                color: Colors.white,
                size: 25,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Food", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Column(children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: h / 15,
                width: w / 1,
                decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total bolus :- 0"),
                      Text(
                        "+",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            GestureDetector(
              onTap: () {
                Cal_alert();
              },
              child: Container(
                height: h / 15,
                width: w / 1,
                decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cal :0 , Fat ; 0 , carbs :0 , Prot :0  "),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Search Food...",
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: h / 50,
            ),
          ]),
        ),
      ),
    );
  }

  void Cal_alert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Selected food'),
            content: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Roti")),
                    TextButton(onPressed: () {}, child: Text("vegetable")),
                    TextButton(onPressed: () {}, child: Text("rice")),
                    TextButton(onPressed: () {}, child: Text("dal")),
                  ],
                )),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                // textColor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }
}
