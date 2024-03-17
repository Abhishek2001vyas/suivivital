// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;
// //
// //
// // class notification {
// //   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   final AndroidInitializationSettings _androidInitializationSettings =
// //   AndroidInitializationSettings('qwe');
// //
// //   void initialiseNotification() async {
// //     InitializationSettings initializationSettings =
// //     InitializationSettings(android: _androidInitializationSettings);
// //     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }
// //
// //   void sendNotification(String title, String body) async {
// //     AndroidNotificationDetails androidNotificationDetails =
// //     AndroidNotificationDetails('channelId', 'channelName',
// //         playSound: false,
// //         importance: Importance.max,
// //         priority: Priority.high);
// //     NotificationDetails notificationDetails = NotificationDetails(
// //       android: androidNotificationDetails,
// //     );
// //     await _flutterLocalNotificationsPlugin.show(
// //         0, title, body, notificationDetails);
// //   }
// //
// //   void scheduleNotification(String title, String body) async {
// //     AndroidNotificationDetails androidNotificationDetails =
// //     AndroidNotificationDetails('channelId', 'channelName',
// //         importance: Importance.max, priority: Priority.high);
// //     NotificationDetails notificationDetails = NotificationDetails(
// //       android: androidNotificationDetails,
// //     );
// //     await _flutterLocalNotificationsPlugin.periodicallyShow(
// //         1, title, body, RepeatInterval.everyMinute, notificationDetails);
// //   }
// //
// //   void canelnotifications() async {
// //     _flutterLocalNotificationsPlugin.cancel(0);
// //   }
// //
// //   Future qwe(
// //       {int id = 0,
// //         String? title,
// //         String? body,
// //         required TimeOfDay timepicker}) async {
// //     AndroidNotificationDetails androidNotificationDetails =
// //     AndroidNotificationDetails('channelId', 'channelName',
// //         importance: Importance.max, priority: Priority.high);
// //     NotificationDetails notificationDetails = NotificationDetails(
// //       android: androidNotificationDetails,
// //     );
// //     return _flutterLocalNotificationsPlugin.zonedSchedule(
// //         id, title, body,  tz.TZDateTime.from(
// //       timepicker as DateTime,
// //       tz.local,
// //     ), notificationDetails,androidAllowWhileIdle: true,
// //         uiLocalNotificationDateInterpretation:
// //         UILocalNotificationDateInterpretation.absoluteTime);
// //   }
// // }
// //
// import 'dart:math';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   void requrstNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true);
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("user granted permission");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user granted provisional permission");
//     } else {
//       print("user denied permission");
//     }
//   }
//
//   void initLocalNotifications(
//       BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSetting = InitializationSettings(
//       android: androidInitializationSettings,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
//         onDidReceiveNotificationResponse: (payload) {
//       handleMessage(context, message);
//     });
//   }
//
//   void firebaseinit(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((message) {
//       print(message.notification!.title.toString());
//       print(message.notification!.body.toString());
//       initLocalNotifications(context, message);
//       showNotification(message);
//     });
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         Random.secure().nextInt(100000).toString(),
//         "High Importance Notification ",
//         importance: Importance.max);
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//             channel.id.toString(), channel.name.toString(),
//             channelDescription: "Your Channel Description",
//             importance: Importance.high,
//             priority: Priority.high,
//             ticker: "ticker");
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     Future.delayed(Duration.zero, () {
//       _flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title.toString(),
//           message.notification!.body.toString(),
//           notificationDetails);
//     });
//   }
//
//   // Future<String> getDeviceToken() async {
//   //   String? token = await messaging.getToken();
//   //
//   //   return token!;
//   // }
//
//   // void isDeviceTokenRefresh() async {
//   //   messaging.onTokenRefresh.listen((event) {
//   //     event.toString();
//   //   });
//   // }
//
// // Future<void> setupIntractMessage(BuildContext context) async {
// //   RemoteMessage? initialMessage =
// //   await FirebaseMessaging.instance.getInitialMessage();
// //   if (initialMessage != null) {
// //     handleMessage(context, initialMessage);
// //   }
// //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
// //     handleMessage(context, event);
// //   });
// // }
// //
//   void handleMessage(BuildContext context, RemoteMessage message) {
//     if (message.data['type'] == 'assign') {}
//   }
// }
