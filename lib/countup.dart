// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
//
// class Countup extends StatefulWidget {
//   const Countup({super.key});
//
//   @override
//   State<Countup> createState() => _CountupState();
// }
//
// class _CountupState extends State<Countup> {
//
//   final _stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
//   /// Get millisecond from hour
//   final value = StopWatchTimer.getMilliSecFromHour(1);
//
//   /// Get millisecond from minute
//   final value1 = StopWatchTimer.getMilliSecFromMinute(60);
//
//   @override
//   void initState() {
//     _stopWatchTimer.onStartTimer();
//     super.initState();
//
//   }
//
//   @override
//   void dispose() async {
//     super.dispose();
//     await _stopWatchTimer.dispose();  // Need to call dispose function.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text("count"),backgroundColor: Colors.red),
//         body: Column(
//           children: [
//             //_stopWatchTimer.rawTime.listen((value) => print('rawTime $value'))
//     //_stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
//           StreamBuilder<int>(
//             stream: _stopWatchTimer.rawTime,
//             initialData: 0,
//               builder: (context, snapshot) {
//                 final value2 = snapshot.data;
//                 final displayTime = StopWatchTimer.getDisplayTime(value2!);
//                 return Text(displayTime.toString());
//               },)
//
//           ],
//         ),
//       ),
//     );
//   }
// }
