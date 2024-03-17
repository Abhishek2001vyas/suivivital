// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../utils/color.dart';
// import 'home/home1.dart';
//
// class Voice_call extends StatefulWidget {
//   const Voice_call({super.key});
//
//   @override
//   State<Voice_call> createState() => _Voice_callState();
// }
//
// class _Voice_callState extends State<Voice_call> {
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           width: w / 1,
//           height: h / 1,
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(height: h / 5.5),
//                 Container(
//                   width: w / 3,
//                   height: h / 3,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: colors.primary)),
//                   child: Image.asset(
//                     "assets/images/th-_1_.jpg",
//                     scale: 3,
//                   ),
//                 ),
//                 Text(
//                   " Dr.Yash.V.S.S",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "calling",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 SizedBox(height: h / 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Material(
//                         elevation: 2,
//                         shape: CircleBorder(),
//                         child: Container(
//                           height: h / 6.5,
//                           width: w / 6.5,
//                           decoration: BoxDecoration(
//                               color: Colors.white, shape: BoxShape.circle),
//                           child: Icon(Icons.keyboard_voice,
//                               color: colors.primary, size: 30),
//                         )),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(Home1());
//                       },
//                       child: Material(
//                           elevation: 2,
//                           shape: CircleBorder(),
//                           child: Container(
//                             height: h / 6,
//                             width: w / 6,
//                             decoration: BoxDecoration(
//                                 color: Colors.red, shape: BoxShape.circle),
//                             child: Icon(Icons.call_end,
//                                 color: Colors.white, size: 30),
//                           )),
//                     ),
//                     Material(
//                         elevation: 2,
//                         shape: CircleBorder(),
//                         child: Container(
//                           height: h / 6.5,
//                           width: w / 6.5,
//                           decoration: BoxDecoration(
//                               color: Colors.white, shape: BoxShape.circle),
//                           child: Icon(CupertinoIcons.speaker_2_fill,
//                               color: colors.primary, size: 30),
//                         )),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
