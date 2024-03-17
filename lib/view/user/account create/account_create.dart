import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/account%20create/account_create_controller.dart';

class AccountCre extends StatefulWidget {
  const AccountCre({super.key});

  @override
  State<AccountCre> createState() => _AccountCreState();
}

class _AccountCreState extends State<AccountCre> {
  final splash_controller = Get.put(Account_splash_user());

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
}
