import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suivivital/custom_widget/button.dart';
import '../../../custom_widget/text_filled.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../api_controller/getdropdwon.dart';
import '../api_controller/update_api.dart';
import '../profile/profile.dart';
import '../profile/profile_controller.dart';
import '../signup/signup_controller.dart';
import 'edit_profile_controller.dart';

var p = postList.elementAt(0).data!.address;

class Edit_profile_d extends StatefulWidget {
  const Edit_profile_d({super.key});

  @override
  State<Edit_profile_d> createState() => _Edit_profile_dState();
}

class _Edit_profile_dState extends State<Edit_profile_d> {
  // final show_data = postList;

  String countryCode1 = '';
  final formKey1 = GlobalKey<FormState>();
  final formKey21 = GlobalKey<FormState>();
  bool? value11 = false;
  final signup1_con = Get.put(edit_profile_controller());
  final api_con = Get.put(Update_profile_doctor_api());
  final getprofile = Get.put(Profile_controller());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: colors.logosec,
          leading: IconButton(
              onPressed: () {
                signup1_con.view1 == 0?
                Get.to(Edit_profile()):
                signup1_con.view_change1(0);
              },
              icon: Icon(
                Icons.arrow_back,
              )),
          elevation: 0,
          title: Text(
            "Edit Profile",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Obx(
            () => signup1_con.view1 == 0
                ? Form(
                    key: formKey1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.bottomshet1();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<edit_profile_controller>(
                                builder: (controller) {
                              return signup1_con.image_type1.value ==
                                      "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(File(
                                            signup1_con.image11.toString())),
                                      ),
                                    )
                                  : Center(
                                      child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/" +
                                            postList
                                                .elementAt(0)
                                                .data!
                                                .profileImage
                                                .toString(),
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 60,
                                    ));
                            }),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.image_null1();

                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: colors.geryq1,
                                        ))))
                          ],
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        TextFilled(
                          //initialval: "${postList.elementAt(0).data!.name.toString()}",
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyType: TextInputType.name,
                          hindtext: 'Entre full name',
                          labeltext: 'Full name',
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        TextFilled(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please Email";
                            }
                            return null;
                          },
                          keyType: TextInputType.name,
                          hindtext: 'Entre Email',
                          labeltext: 'Email',
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          children: [
                            Container(
                              width: w / 1.12,
                              child: IntlPhoneField(
                                validator: (value) {
                                  if (value == null) {
                                    return "please mobile";
                                  }
                                  return null;
                                },
                                controller: mobile,
                                flagsButtonPadding: const EdgeInsets.all(8),
                                dropdownIconPosition: IconPosition.trailing,
                                decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                initialCountryCode: 'BF',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        TextFilled(
                          controller: national_doctor,
                          keyType: TextInputType.name,
                          hindtext: 'Entre National Doctor reference',
                          labeltext: 'National Doctor reference',
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.female_outlined,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            GestureDetector(
                              onTap: () {
                                signup1_con.gender_change(0);
                              },
                              child: Obx(
                                () => Container(
                                  width: w / 2.8,
                                  height: h / 15,
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: signup1_con.gender == 0
                                          ? colors.logosec
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Female"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w / 100,
                            ),
                            Container(
                                child: Icon(
                              Icons.male,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            GestureDetector(
                              onTap: () {
                                signup1_con.gender_change(1);
                              },
                              child: Obx(
                                () => Container(
                                  width: w / 2.8,
                                  height: h / 15,
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: signup1_con.gender == 1
                                          ? colors.logosec
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Male"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        TextFilled(
                          controller: about,
                          keyType: TextInputType.name,
                          hindtext: 'Entre about',
                          labeltext: 'about',
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.school,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                // Initial Value
                                value: qualifications,
                                hint: Text('qualification'),
                                isExpanded: true,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: colors.primary),

                                // Array list of items
                                items: qualification.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    qualifications = newValue ?? '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.person_pin,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                // Initial Value
                                value: profess,
                                hint: Text('professional'),
                                isExpanded: true,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: colors.primary),

                                // Array list of items
                                items: profession.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    profess = newValue ?? '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.business_center,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                // Initial Value
                                value: experciencess,
                                hint: Text('experciences'),
                                isExpanded: true,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: colors.primary),

                                // Array list of items
                                items: experciences.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    experciencess = newValue ?? '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 20,
                        ),
                        Button_widget(
                          buttontext: "Next",
                          button_height: 15,
                          button_width: 1,
                          onpressed: () {
                            if (formKey1.currentState!.validate() &&
                                qualifications != null &&
                                experciencess != null &&
                                profess != null) {
                              signup1_con.view_change1(1);
                              // Get.to(Signup2());
                            }
                          },
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                      ],
                    ),
                  )
                : Form(
                    key: formKey21,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.location_on_outlined,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select States',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: dropstate
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: states,
                                  onChanged: (value) {
                                    setState(() {
                                      states = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 50,
                                    width: 200,
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 500,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: textEditingController1,
                                    searchInnerWidgetHeight: 50,
                                    searchInnerWidget: Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        expands: true,
                                        maxLines: null,
                                        controller: textEditingController1,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText: 'Search for an item...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return item.value
                                          .toString()
                                          .contains(searchValue);
                                    },
                                  ),
                                  //This to clear the search value when you close the menu
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      textEditingController1.clear();
                                    }
                                  },
                                ),
                              ),
                              // DropdownButton(
                              //   underline: const SizedBox(),
                              //   // Initial Value
                              //   value: states,
                              //   hint: Text('select state'),
                              //   isExpanded: true,
                              //   // Down Arrow Icon
                              //   icon: const Icon(Icons.keyboard_arrow_down,
                              //       color: colors.primary),
                              //
                              //   // Array list of items
                              //   items: dropstate.map((String items) {
                              //     return DropdownMenuItem(
                              //       value: items,
                              //       child: Text( items),
                              //     );
                              //   }).toList(),
                              //
                              //   onChanged: (String? newValue) {
                              //     setState(() {
                              //       states = newValue ?? '';
                              //     });
                              //   },
                              // ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Icon(
                              Icons.location_on_outlined,
                              color: colors.geryq1,
                              size: 24,
                            )),
                            SizedBox(
                              width: w / 1.25,
                              child: TextFormField(
                                  controller: address,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: colors.geryq1, width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: colors.geryq1)))),
                            )
                            // GestureDetector(
                            //   onTap: () async {
                            //     const kGoogleApiKey =
                            //         "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
                            //      p = await PlacesAutocomplete.show(
                            //       context: context,
                            //       apiKey: kGoogleApiKey,
                            //       mode: Mode.fullscreen,
                            //       // Mode.fullscreen
                            //       language: "BF",
                            //
                            //       hint: "select address",
                            //     );
                            //
                            //     print(p!.description);
                            //   },
                            //   child: Container(
                            //       width: w / 1.23,
                            //       height: h / 13,
                            //       padding: EdgeInsets.only(
                            //           top: 19, bottom: 5, left: 20),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           border: Border.all(
                            //               color: colors.geryq1, width: 1)),
                            //       child: p == null
                            //           ? Text(
                            //         "Select Address",
                            //       )
                            //           : Text(p!.description.toString())
                            //     // GooglePlaceAutoCompleteFlutterTextField(
                            //     //     textEditingController: address,
                            //     //     googleAPIKey: "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM",
                            //     //      inputDecoration: InputDecoration(hintText: "Select address",
                            //     //          border: OutlineInputBorder(
                            //     //              borderRadius: BorderRadius.circular(10),
                            //     //              borderSide: BorderSide(color: colors.geryq1,width: 1))),
                            //     //     debounceTime: 800, // default 600 ms,
                            //     //     countries: ["BF"],// optional by default null is set
                            //     //     //isLatLngRequired:true,// if you required coordinates from place detail
                            //     //     //autcompleteBaseUrl: "", // if provided will use it as a base url for loading autocomplate data
                            //     //     placesBaseUrl: "https://maps.googleapis.com/maps/api/place/autocomplete/json ?input=Paris &types=geocode &key=AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM", // if provided will use it as a base url for loading place details
                            //     //     getPlaceDetailWithLatLng: (Prediction prediction) {
                            //     //       // this method will return latlng with place detail
                            //     //       print("placeDetails" + prediction.lng.toString());
                            //     //     }, // this callback is called when isLatLngRequired is true
                            //     //     itmClick: (Prediction prediction) {
                            //     //       address.text=prediction.description!;
                            //     //       address.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                            //     //     }
                            //     // )
                            //
                            //     // SearchGooglePlacesWidget(
                            //     //   placeType: PlaceType.address, // PlaceType.cities, PlaceType.geocode, PlaceType.region etc
                            //     //   placeholder: 'Enter the address',
                            //     //   apiKey:
                            //     //   'AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM',
                            //     //
                            //     //   //onSearch: (Place place) {},
                            //     //   onSelected: (Place place) async {
                            //     //     print('address ${place.description}');
                            //     //
                            //     //   },
                            //     // ),
                            //     // TextFormField(
                            //     //   onTap:  ()async{
                            //     //   const kGoogleApiKey = "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
                            //     //   var p = await PlacesAutocomplete.show(
                            //     //     context: context,
                            //     //     apiKey: kGoogleApiKey,
                            //     //     mode: Mode.fullscreen , // Mode.fullscreen
                            //     //     language: "in",hint: "select address",
                            //     //
                            //     //
                            //     //   );
                            //     // },
                            //     //
                            //     //   inputFormatters: [LengthLimitingTextInputFormatter(50)],
                            //     //   controller: address,
                            //     //   //validator: validator,
                            //     //   keyboardType: TextInputType.text,
                            //     //   decoration: InputDecoration(
                            //     //       border: OutlineInputBorder(),
                            //     //       enabledBorder: OutlineInputBorder(
                            //     //           borderRadius: BorderRadius.circular(10),
                            //     //           borderSide: BorderSide(color: colors.geryq1, width: 1)),
                            //     //       focusedBorder:
                            //     //       OutlineInputBorder(borderSide: BorderSide(color: colors.geryq1)),
                            //     //       hintText: "Select address",
                            //     //       labelText: "Select address",
                            //     //       labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                            //     // )
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        TextFilled(
                          controller: fee,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please fees";
                            }
                            return null;
                          },
                          keyType: TextInputType.name,
                          hindtext: 'Entre consulting',
                          labeltext: 'consulting fees',
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Text(
                          " Select cerficate image",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.showBottomSheet11();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<edit_profile_controller>(
                                builder: (controller) {
                              return signup1_con.image_type21.value ==
                                      "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(File(
                                              signup1_con.image21.toString()))
                                          // radius: 80,
                                          // AssetImage('assets/images/profile.jpg'),
                                          // backgroundImage:
                                          // child: Image.file(image!,
                                          //     alignment: Alignment.center),
                                          ),
                                    )
                                  : Center(
                                      child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/" +
                                            postList
                                                .elementAt(0)
                                                .data!
                                                .certificateImage
                                                .toString(),
                                      ),
                                      radius: 60,
                                      // child: Image.asset(
                                      //     "assets/images/th-_1_.jpg"),
                                    ));
                            }),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.image_null21();
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: colors.geryq1,
                                        )))),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Text(
                          " Select licence image",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.showBottomSheet21();

                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<edit_profile_controller>(
                                builder: (controller) {
                              return signup1_con.image_type31.value ==
                                      "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(File(
                                              signup1_con.image31.toString()))
                                          // radius: 80,
                                          // AssetImage('assets/images/profile.jpg'),
                                          // backgroundImage:
                                          // child: Image.file(image!,
                                          //     alignment: Alignment.center),
                                          ),
                                    )
                                  : Center(
                                      child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/" +
                                            postList
                                                .elementAt(0)
                                                .data!
                                                .licenseImage
                                                .toString(),
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 60,
                                    ));
                            }),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.geryq1, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          signup1_con.image_null31();
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: colors.geryq1,
                                        )))),
                          ],
                        ),
                        SizedBox(
                          height: h / 35,
                        ),
                        // Obx(() => api_con.isloading.value==true?
                        // Center(child: CircularProgressIndicator(),)
                        // :
                        Obx(() => api_con.isloading.value == true
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Button_widget(
                                buttontext: "Next",
                                button_height: 15,
                                button_width: 1,
                                onpressed: () async {
                                  api_con.loader();
                                  if (formKey21.currentState!.validate()) {
                                    await api_con.updateprofile(
                                      name.text.toString(),
                                      email.text.toString(),
                                      mobile.text.toString(),
                                      qualifications.toString(),
                                      profess.toString(),
                                      experciencess.toString(),
                                      states.toString(),
                                      national_doctor.text.toString(),
                                      fee.text.toString(),
                                      signup1_con.image11.toString(),
                                      signup1_con.image21.toString(),
                                      signup1_con.image31.toString(),
                                      address.text.toString(),
                                      signup1_con.gender_name.toString(),
                                      about.text.toString(),
                                    );
                                    //Get.to(Account_cr_doc());
                                    api_con.loader_fa();
                                    signup1_con.view_change1(0);
                                  }
                                },
                                // )
                              )),
                        SizedBox(
                          height: h / 50,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  TextEditingController name =
      TextEditingController(text: postList.elementAt(0).data!.name.toString());
  TextEditingController address = TextEditingController(
      text: postList.elementAt(0).data!.address.toString());
  TextEditingController email =
      TextEditingController(text: postList.elementAt(0).data!.email.toString());
  TextEditingController mobile = TextEditingController(
      text: postList.elementAt(0).data!.mobile.toString());
  TextEditingController national_doctor = TextEditingController(
      text: postList.elementAt(0).data!.referralCode.toString());
  TextEditingController fee = TextEditingController(
      text: postList.elementAt(0).data!.feesCondition.toString());
  TextEditingController about =
      TextEditingController(text: postList.elementAt(0).data!.about.toString());
  // List<String> experciences = [
  //   'less then 6th month',
  //   'more then 6th month',
  //   '1-3 years',
  //   '3-5 years',
  //   '5+ years',
  // ];
  String qualifications = postList.elementAt(0).data!.qualification.toString();
  String profess = postList.elementAt(0).data!.profession.toString();
  String experciencess = postList.elementAt(0).data!.experience.toString();

  // List<String> state = [
  //   'M.P',
  //   'Gujrat',
  //   'Delhi',
  //   'Maharashtra',
  //   'U.p',
  // ];
  String? states = postList.elementAt(0).data!.state.toString();
  final TextEditingController textEditingController1 = TextEditingController();
}
