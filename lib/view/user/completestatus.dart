import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/color.dart';
import 'api_controller_user/completeraingvideocall.dart';

class Completestatus extends StatefulWidget {
  const Completestatus({super.key});

  @override
  State<Completestatus> createState() => _CompletestatusState();
}

class _CompletestatusState extends State<Completestatus> {
  final completeapi=Get.put(Completerating());
  var rev = 4.0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h / 80,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    rev = rating;
                  });
                  print(rating);
                },
              ),
            ),
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  rev.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(
              height: h / 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: w,
                child: TextFormField(
                  controller: dre,
                  decoration: const InputDecoration(
                      hintText: "Write your thoughts...",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colors.geryq1, width: 1))),
                  maxLines: 5,
                ),
              ),
            ),
            SizedBox(
              height: h / 30,
            ),

            Obx(
                  () => completeapi.isloading == true
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  :
                  Center(
                child: SizedBox(
                  width: w / 1.9,
                  height: h / 20,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0xff4c5df4))),
                      onPressed: () async {
                        completeapi.completerating_api();
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
  final TextEditingController dre = TextEditingController();
}
