import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login.dart';
import 'account_create_controller.dart';

class Account_cr_doc extends StatefulWidget {
  const Account_cr_doc({super.key});

  @override
  State<Account_cr_doc> createState() => _Account_cr_docState();
}

class _Account_cr_docState extends State<Account_cr_doc> {
//  final splash1_controller = Get.put(Account_splash);

  @override
  void initState() {
    // TODO: implement initState
    navigtohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: h / 5,
                ),
                Image.asset("assets/images/09 Sign up (account created).png"),
                Text(
                  "Account Created!",
                  style: TextStyle(
                      color: Color(0xff0c1037),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Text("your account had been created",
                    style: TextStyle(
                      color: Color(0xff898f99),
                      fontSize: 15,
                    )),
                SizedBox(
                  height: h / 50,
                ),
                Text("Successfully",
                    style: TextStyle(
                      color: Color(0xff898f99),
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Get.to(() => Logind());
  }
}
