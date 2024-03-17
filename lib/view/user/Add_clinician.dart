import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../custom_widget/button.dart';
import '../../custom_widget/drawer.dart';
import '../../custom_widget/text_filled.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'api_controller_user/addclini.dart';
import 'api_controller_user/doctor_detatil.dart';
import 'api_controller_user/onlinedoctor_list_api.dart';
import 'api_controller_user/popualrdoctor_api.dart';
import 'book appointment/book_appoiment.dart';

class Addclinican extends StatefulWidget {
  const Addclinican({super.key});

  @override
  State<Addclinican> createState() => _AddclinicanState();
}

class _AddclinicanState extends State<Addclinican> {
  final doctor_Details_api = Get.put(doctor_Details());
  final adddclin = Get.put(Addclini());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(

      drawer: const Drawer(backgroundColor: colors.logosec, child: Drawer1()),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        // automaticallyImplyLeading: false,
        backgroundColor: colors.logosec,
        elevation: 0,
        title: Text(
          "Add Clinican",
          style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
          child: Column(
            children: [
              Material(
                elevation: 1,borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: w/1,height: h/5,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFilled(

                          controller: national_doctor,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "please National Doctor reference";
                          //   }
                          //   return null;
                          // },
                          keyType: TextInputType.name,
                          hindtext: 'Entre National Doctor reference',
                          labeltext: 'National Doctor reference',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Obx( (){ return
                           adddclin.isloading==true?
                              Center(child: CircularProgressIndicator()):
                          Button_widget(
                            buttontext: "Add",
                            button_height: 15,
                            button_width: 1,
                            onpressed: ()async{
                              await  adddclin.Addcclin_api(national_doctor.text.toString());
                            },
                          );
                        })

                      )
                    ],
                  ),),
              ),
              SizedBox(height: h/50),
              FutureBuilder(future:adddclin.show_refernce_doctor() ,
                builder: (context, snapshot) =>
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.horizontal,
                    itemCount: listdocotorrefer.elementAt(0).length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10.0, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            // doctor_Details_api.detail_doctor_api(popualr_doctor
                            //     .elementAt(0)
                            //     .data!
                            //     .elementAt(index)
                            //     .id
                            //     .toString());
                          },
                          child: Material(
                            elevation: 2,
                            shadowColor: Color(0xfff8f8fc),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: h / 4.5,
                              width: w / 1.3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: SizedBox(height: h/10,width: w/4.5,
                                              child:ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                child: Image.network(
                                                    fit: BoxFit.fill,
                                                    "${doctor_image_url.toString()}${listdocotorrefer.elementAt(0)[index]["profile_image"].toString()}"),
                                              ),

                                            ),
                                          )
                                          ,
                                          SizedBox(
                                            width: w / 30,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width: w/2,
                                                child: Text(
                                                  overflow:  TextOverflow.ellipsis,
                                                  // maxLines: 2,
                                                  "Dr.${listdocotorrefer.elementAt(0)[index]["name"].toString()}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                listdocotorrefer.elementAt(0)[index]["profession"].toString(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: colors.geryq1),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.location_solid,
                                                    size: 16,
                                                    color: Colors.grey,
                                                  ),SizedBox(width: w/80),
                                                  SizedBox(width: w/2.1,
                                                    child: Text(overflow: TextOverflow.ellipsis,
                                                      listdocotorrefer.elementAt(0)[index]["state"].toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(0xff6e7682)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.business_center_sharp,
                                                    size: 15,
                                                    color: Colors.black26,
                                                  ),SizedBox(width: w/80),
                                                  Text(
                                                    listdocotorrefer.elementAt(0)[index]["experience"].toString(),
                                                    style: TextStyle(
                                                      color: Color(0xff777f8a),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    " Exp  ",
                                                    style: TextStyle( fontSize: 13,
                                                        color: Color(0xff777f8a)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                    Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: h / 20,
                                          width: w / 4.5,
                                          decoration: BoxDecoration(
                                              color: Color(0xfffff5db),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // SizedBox(width: w/20,),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Color(0xfffeba0c),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  "${online_doctor
                                                      .elementAt(0)
                                                      .data!
                                                      .elementAt(index)
                                                      .rating
                                                      .toString()}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                "(${online_doctor.elementAt(0).data!.elementAt(index).ratingCount.toString()})",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xff777f8a)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: w/40,),
                                        Container(
                                          width: w / 1.7,
                                          height: h / 20,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(10))),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xff4c5df4))),
                                              onPressed: () {
                                                Get.to(Book_appointment());
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .booknow,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),),

            ],
          ),
        ),
      ),
    );
  }
  TextEditingController national_doctor = TextEditingController();


}
