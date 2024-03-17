import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/Doctor_review.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../api_controller_user/doctor_detatil.dart';
import '../api_controller_user/review_api.dart';

class Review extends StatefulWidget {
  final doctor_id;

  const Review({super.key, this.doctor_id});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final reviewcontroller = Get.put(doctor_review());
  final detailcontroller = Get.put(Review_detail());

  var rev = 4.0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Doctor_review());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: colors.hinttext,
              )),
          elevation: 0,
          title: const Text(
            "Review",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: colors.hinttext),
          )),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: h / 50,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: SizedBox(
                  height: h / 10,
                  width: w / 4.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                        fit: BoxFit.fill,
                        "${doctor_image_url.toString()}${details_review.elementAt(0)[0]["profile_image"]}"),
                  ),
                ),
              ),
              SizedBox(width: w / 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${details_review.elementAt(0)[0]["name"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: h / 200),
                    Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xfffeba0c),
                      ),
                      SizedBox(width: w / 80),
                      Text(
                        details_review.elementAt(0)[0]["rating"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "(${details_review.elementAt(0)[0]["rating_count"]})",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(height: h / 200),
                  Row(
                    children: [
                      Icon(
                        Icons.business_center_sharp,
                        size: 16,
                        color: Colors.black26,
                      ),
                      SizedBox(width: w / 80),
                      Text(
                        "${details_review.elementAt(0)[0]["experience"]} exp",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: h / 20),
        Center(
          child: RatingBar.builder(
            initialRating: 2,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
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
        SizedBox(
          height: h / 80,
        ),
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              rev.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
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
              decoration: InputDecoration(
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
          () => reviewcontroller.isloading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Container(
                    width: w / 1.9,
                    height: h / 20,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff4c5df4))),
                        onPressed: () async {
                          reviewcontroller.review_doctor_api(
                            widget.doctor_id.toString(),
                            rev.toString(),
                            dre.text.toString(),
                          );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
        ),
      ])),
    );
  }

  final TextEditingController dre = TextEditingController();
}
