// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:google_places_flutter_api/google_places_flutter_api.dart';
// //
// // class LocationSearchScreen extends StatefulWidget {
// //   @override
// //   LocationSearchScreenState createState() => LocationSearchScreenState();
// // }
// //
// // class _LocationSearchScreenState extends State<LocationSearchScreen> {
// //   TextEditingController addressController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //       Scaffold(
// //       appBar: AppBar(
// //         title: Text('Location Search'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             Container(
// //               child: Icon(
// //                 Icons.location_on_outlined,
// //                 color: Colors.grey,
// //                 size: 24,
// //               ),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 1.23,
// //               height: MediaQuery.of(context).size.height / 13,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10),
// //                 border: Border.all(color: Colors.grey, width: 1),
// //               ),
// //               child: TextFormField(
// //                 onTap: () async {
// //                   final prediction = await PlacesAutocomplete.show(
// //                     context: context,
// //                     apiKey: "YOUR_GOOGLE_API_KEY",
// //                     mode: Mode.fullscreen,
// //                     language: "in",
// //                     hint: "Select address",
// //                   );
// //
// //                   if (prediction != null) {
// //                     setState(() {
// //                       addressController.text = prediction.description!;
// //                     });
// //                   }
// //                 },
// //                 controller: addressController,
// //                 inputFormatters: [LengthLimitingTextInputFormatter(50)],
// //                 keyboardType: TextInputType.text,
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                     borderSide: BorderSide(color: Colors.grey, width: 1),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.grey),
// //                   ),
// //                   hintText: "Select address",
// //                   labelText: "Select address",
// //                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_autocomplete/flutter_google_places_autocomplete.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LocationSearchAutocomplete(),
//     );
//   }
// }
//
// class LocationSearchAutocomplete extends StatefulWidget {
//   @override
//   _LocationSearchAutocompleteState createState() =>
//       _LocationSearchAutocompleteState();
// }
//
// class _LocationSearchAutocompleteState extends State<LocationSearchAutocomplete> {
//   String selectedPlace = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Search Autocomplete"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: GooglePlacesAutocomplete(
//               apiKey: "YOUR_GOOGLE_PLACES_API_KEY",
//               language: "en",
//               components: [Component(Component.country, "US")], // Optional
//               onPlaceSelected: (Place place) {
//                 setState(() {
//                   selectedPlace = place.description;
//                 });
//               },
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Text(
//             "Selected Place: $selectedPlace",
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
