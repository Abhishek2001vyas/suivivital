import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suivivital/custom_widget/button.dart';
import 'package:suivivital/view/Doctoe/signup/signup_controller.dart';
import '../../../custom_widget/text_filled.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../api_controller/getdropdwon.dart';
import '../api_controller/signup_api.dart';
import '../login.dart';

class Signupd extends StatefulWidget {
  const Signupd({super.key});

  @override
  State<Signupd> createState() => _SignupdState();
}

class _SignupdState extends State<Signupd> {
  String countryCode = '';
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool? value1 = false;
  final signup_con = Get.put(Signup_controller());
  final api_con = Get.put(Signup_doctor_api());
  var p;
  String? pp;
  int ll= 8;
var  countrycode="226";
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return
      Scaffold(
      appBar: AppBar(
          backgroundColor: colors.logosec,
          leading:
          IconButton(
              onPressed: () {
                print(signup_con.view.runtimeType);

                  signup_con.view == 0 ?
                  Get.to(const Logind()) :
                  signup_con.view_change(0);
                },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.signup,
            style:
                TextStyle(
                   fontSize: 18,
                    fontWeight: FontWeight.w700, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Obx(
            () => signup_con.view == 0
                ? Form(
                    key: formKey,
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
                                          signup_con.bottomshet();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<Signup_controller>(
                                builder: (controller) {
                              return signup_con.image_type.value == "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(
                                            File(signup_con.image.toString())),
                                      ),
                                    )
                                  : const Center(
                                      child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/th-_1_.jpg",
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
                                          signup_con.image_null();
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
                            if (email.text.isEmpty) {
                              return null;
                            }
                            else {
                                if (
                                RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return null;
                                }

                                else {
                                  return "Please entre email correct";
                                }
                              }
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
                                onChanged: (phone){
                                },
                                validator: (value) {
                                  if (mobile.text.isEmpty) {
                                    return "please mobile";
                                  }
                                  return null;
                                },
                                onCountryChanged:  (value) {
                                  setState(() {
                                    countrycode=value.dialCode.toString();
                                    ll=value.maxLength;
                                    print(ll);
                                  });
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                invalidNumberMessage: "please entre correct number",
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
                                signup_con.gender_change(0);
                              },
                              child: Obx(
                                () => Container(
                                  width: w / 2.8,
                                  height: h / 15,
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: signup_con.gender == 0
                                          ? colors.logosec
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Female",style: TextStyle(
                                      color: signup_con.gender == 0
                                          ? Colors.white
                                          : Colors.black,)),
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
                                signup_con.gender_change(1);
                              },
                              child: Obx(
                                () => Container(
                                  width: w / 2.8,
                                  height: h / 15,
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: signup_con.gender == 1
                                          ? colors.logosec
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: Text("Male",style: TextStyle(
                                    color: signup_con.gender == 1
                                        ? Colors.white
                                        : Colors.black,)),
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
                            Icon(
                              Icons.school,
                              color: colors.geryq1,
                              size: 24,
                            ),
                            Container(
                              width: w / 1.23,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child:
                              DropdownButton(
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
                            Icon(
                              Icons.person_pin,
                              color: colors.geryq1,
                              size: 24,
                            ),
                            Container(
                              width: w / 1.23,
                              padding: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                value: profess,
                                hint: const Text('professional'),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: colors.primary),
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
                            const Icon(
                              Icons.business_center,
                              color: colors.geryq1,
                              size: 24,
                            ),
                            Container(
                              width: w / 1.23,
                              padding: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colors.geryq1, width: 1)),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                value: experciencess,
                                hint: const Text('experciences'),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: colors.primary),
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
                        Row(children: [
                          Checkbox(
                            side: const BorderSide(color: colors.geryq1, width: 2),
                            value: value1,
                            onChanged: (value) {
                              setState(() {
                                value1 = value;
                              });
                            },
                          ),
                          const Text(
                            "I have read term & policy",
                          )
                        ]),
                        SizedBox(
                          height: h / 20,
                        ),
                        Button_widget(
                          buttontext: "Next",
                          button_height: 15,
                          button_width: 1,
                          onpressed: () {
                              if (formKey.currentState!.validate() &&
                                  mobile.text.toString().length == ll &&
                                   qualifications != null &&
                                  experciencess != null &&
                                  profess != null) {
                                signup_con.view_change(1);
                              }
                              else if(mobile.text.isEmpty){
                                Utils().alertbox(
                                    ' Please fill all field & all photo');
                              }
                              else
                                {
                                  Utils().alertbox(
                                      ' Please fill all field & all photo');
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
                    key: formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: colors.geryq1,
                              size: 24,
                            ),
                            Container(
                              width: w / 1.23,
                              padding: const EdgeInsets.only(
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
                                    searchController: textEditingController,
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
                                        controller: textEditingController,
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
                                      textEditingController.clear();
                                    }
                                  },
                                ),
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
                            const Icon(
                              Icons.location_on_outlined,
                              color: colors.geryq1,
                              size: 24,
                            ),
                            GestureDetector(
                              onTap: () async {
                                const kGoogleApiKey =
                                    "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
                                p = await PlacesAutocomplete.show(
                                  context: context,
                                  apiKey: kGoogleApiKey,
                                  mode: Mode.fullscreen,
                                  // Mode.fullscreen

                                  language: "BF",
                                  hint: "select address",
                                );

                                setState(() {
                                  pp = "${p.description}".toString();
                                });
                                print(pp.runtimeType);
                                print(p!.description);
                              },
                              child: Container(
                                  width: w / 1.23,
                                  height: h / 13,
                                  padding: EdgeInsets.only(
                                      top: 19, bottom: 5, left: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colors.geryq1, width: 1)),
                                  child: p == null
                                      ? Text(
                                          "Select Address",
                                        )
                                      : Text(p!.description.toString())
                                  // GooglePlaceAutoCompleteFlutterTextField(
                                  //     textEditingController: address,
                                  //     googleAPIKey: "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM",
                                  //      inputDecoration: InputDecoration(hintText: "Select address",
                                  //          border: OutlineInputBorder(
                                  //              borderRadius: BorderRadius.circular(10),
                                  //              borderSide: BorderSide(color: colors.geryq1,width: 1))),
                                  //     debounceTime: 800, // default 600 ms,
                                  //     countries: ["BF"],// optional by default null is set
                                  //     //isLatLngRequired:true,// if you required coordinates from place detail
                                  //     //autcompleteBaseUrl: "", // if provided will use it as a base url for loading autocomplate data
                                  //     placesBaseUrl: "https://maps.googleapis.com/maps/api/place/autocomplete/json ?input=Paris &types=geocode &key=AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM", // if provided will use it as a base url for loading place details
                                  //     getPlaceDetailWithLatLng: (Prediction prediction) {
                                  //       // this method will return latlng with place detail
                                  //       print("placeDetails" + prediction.lng.toString());
                                  //     }, // this callback is called when isLatLngRequired is true
                                  //     itmClick: (Prediction prediction) {
                                  //       address.text=prediction.description!;
                                  //       address.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                                  //     }
                                  // )

                                  // SearchGooglePlacesWidget(
                                  //   placeType: PlaceType.address, // PlaceType.cities, PlaceType.geocode, PlaceType.region etc
                                  //   placeholder: 'Enter the address',
                                  //   apiKey:
                                  //   'AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM',
                                  //
                                  //   //onSearch: (Place place) {},
                                  //   onSelected: (Place place) async {
                                  //     print('address ${place.description}');
                                  //
                                  //   },
                                  // ),
                                  // TextFormField(
                                  //   onTap:  ()async{
                                  //   const kGoogleApiKey = "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
                                  //   var p = await PlacesAutocomplete.show(
                                  //     context: context,
                                  //     apiKey: kGoogleApiKey,
                                  //     mode: Mode.fullscreen , // Mode.fullscreen
                                  //     language: "in",hint: "select address",
                                  //
                                  //
                                  //   );
                                  // },
                                  //
                                  //   inputFormatters: [LengthLimitingTextInputFormatter(50)],
                                  //   controller: address,
                                  //   //validator: validator,
                                  //   keyboardType: TextInputType.text,
                                  //   decoration: InputDecoration(
                                  //       border: OutlineInputBorder(),
                                  //       enabledBorder: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(10),
                                  //           borderSide: BorderSide(color: colors.geryq1, width: 1)),
                                  //       focusedBorder:
                                  //       OutlineInputBorder(borderSide: BorderSide(color: colors.geryq1)),
                                  //       hintText: "Select address",
                                  //       labelText: "Select address",
                                  //       labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                                  // )
                                  ),
                            ),
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
                                          signup_con.showBottomSheet1();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<Signup_controller>(
                                builder: (controller) {
                              return signup_con.image_type2.value == "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(File(
                                              signup_con.image2.toString()))
                                          ),
                                    )
                                  : const Center(
                                      child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/th-_1_.jpg",
                                      ),
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
                                          signup_con.image_null2();
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
                        const Text(
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
                                          signup_con.showBottomSheet2();
                                          print("nmmml");
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: colors.geryq1,
                                        )))),
                            GetBuilder<Signup_controller>(
                                builder: (controller) {
                              return signup_con.image_type3.value == "FileImage"
                                  ? Center(
                                      child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(File(
                                              signup_con.image3.toString()))
                                          ),
                                    )
                                  : Center(
                                      child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/th-_1_.jpg",
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
                                          signup_con.image_null3();
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
                                  if (formKey2.currentState!.validate()
                                  && states!.isNotEmpty && pp!.isNotEmpty
                                  && signup_con.image3.isNotEmpty && signup_con.image2.isNotEmpty
                                  ) {
                                    await api_con.signup_api(
                                      name.text.toString(),
                                      email.text.toString(),
                                      mobile.text.toString(),
                                      qualifications.toString(),
                                      profess.toString(),
                                      experciencess.toString(),
                                      states.toString(),
                                      fee.text.toString(),
                                      signup_con.image.toString(),
                                      signup_con.image2.toString(),
                                      signup_con.image3.toString(),
                                      pp.toString(),
                                      signup_con.gender_name.toString(),
                                      about.text.toString(),
                                      national_doctor.text.toString(),
                                        countrycode.toString()
                                    );

                                    signup_con.view_change(0);
                                    signup_con.image_null();
                                    signup_con.image_null2();
                                    signup_con.image_null3();

                                  }
                                  else{
                                    Utils().alertbox(
                                        ' Please fill all field & all photo');
                                  }

                                  api_con.loader_fa();

                                },
                              )),
                        SizedBox(
                          height: h / 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.geryq1,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextButton(
                              child: Text('sign in',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: colors.primary,
                                      fontWeight: FontWeight.w600)),
                              onPressed: () {
                                Get.to(Logind());
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  final TextEditingController textEditingController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController national_doctor = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController about = TextEditingController();

  String? qualifications;
  String? profess;
  String? experciencess;

  // var state=dropstate;

  // List<String> state1 = [
  //   'M.P',
  //   'Gujrat',
  //   'Delhi',
  //   'Maharashtra',
  //   'U.p',
  // ];
  String? states;

// Future<void> displayPrediction( p, BuildContext context) async {
//   if (p != null) {
//     // get detail (lat/lng)
//     GoogleMapsPlaces _places = GoogleMapsPlaces(
//       apiKey: "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM",
//       apiHeaders: await const GoogleApiHeaders().getHeaders(),
//     );
//     PlacesDetailsResponse detail =
//     await _places.getDetailsByPlaceId(p.placeId!);
//     final addresss= detail.result.formattedAddress.toString();
//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("${p.description} - $lat/$lng")),
//     );
//   }
// }
//
}
