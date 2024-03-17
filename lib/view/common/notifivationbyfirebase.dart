import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/user/video_call.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:shared_preferences/shared_preferences.dart ';
import 'package:flutter_callkit_incoming/entities/entities.dart';

class notification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
  AndroidInitializationSettings('suivivital');


  void initialiseNotification() async {
    InitializationSettings initializationSettings =
    InitializationSettings(android: _androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message,) async {
    print("load ${message.toString()}");
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context,  message);
        });
  }

  void handleMessage(BuildContext context,RemoteMessage  message) {
    print(" playload ${message.data["temp_channel_name"]}");
 // Get.to( Videos_call());
  }

  Future<void> showNotification( RemoteMessage message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      playSound: true,
        Random.secure().nextInt(100000).toString(),
        "High Importance Notification ",
        importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        channel.id.toString(), channel.name.toString(),
        channelDescription: "Your Channel Description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker");
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  void firebaseinit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if(message.data["call"] !=null){
        call(message.data["temp_channel_name"],message.data["int_uid"]);
      }
      else{
      initLocalNotifications(context,  message);
      showNotification(message);}
    });
  }

   call(channelname,token)async{
     var shared_preferences = await SharedPreferences.getInstance();
     var isLogedIn = shared_preferences.getString('user_id');
     CallKitParams callKitParams = CallKitParams(
       id:isLogedIn.toString() ,
       nameCaller: 'abhishek',
       appName: 'suivivital',
       avatar: 'https://i.pravatar.cc/100',
       handle: '0123456789',
       type: 0,
       textAccept: 'Accept',
       textDecline: 'Decline',
       missedCallNotification: NotificationParams(
         showNotification: true,
         isShowCallback: true,
         subtitle: 'Missed call',
         callbackText: 'Call back',
       ),
       duration: 30000,
       extra: <String, dynamic>{'userId': '1a2b3c4d'},
       headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
       android: const AndroidParams(
           isCustomNotification: true,
           isShowLogo: false,
           ringtonePath: 'system_ringtone_default',
           backgroundColor: '#0955fa',
           backgroundUrl: 'https://i.pravatar.cc/500',
           actionColor: '#4CAF50',
           incomingCallNotificationChannelName: "Incoming Call",
           missedCallNotificationChannelName: "Missed Call"),
       ios: const IOSParams(
         iconName: 'CallKitLogo',
         handleType: 'generic',
         supportsVideo: true,
         maximumCallGroups: 2,
         maximumCallsPerCallGroup: 1,
         audioSessionMode: 'default',
         audioSessionActive: true,
         audioSessionPreferredSampleRate: 44100.0,
         audioSessionPreferredIOBufferDuration: 0.005,
         supportsDTMF: true,
         supportsHolding: true,
         supportsGrouping: false,
         supportsUngrouping: false,
         ringtonePath: 'system_ringtone_default',
       ),
     );
    await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);
     FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
       switch (event!.event) {
         case Event.actionCallIncoming:
         // TODO: received an incoming call
           break;
         case Event.actionCallStart:
         // TODO: started an outgoing call
         // TODO: show screen calling in Flutter
           break;
         case Event.actionCallAccept:
           ifAcceptedThenRedirectToAgora(channelname,token );
           break;
         case Event.actionCallDecline:
         // TODO: declined an incoming call
           break;
         case Event.actionCallEnded:
         // TODO: ended an incoming/outgoing call
           break;
         case Event.actionCallTimeout:
         // TODO: missed an incoming call
           break;
         case Event.actionCallCallback:
         // TODO: only Android - click action `Call back` from missed call notification
           break;
         case Event.actionCallToggleHold:
         // TODO: only iOS
           break;
         case Event.actionCallToggleMute:
         // TODO: only iOS
           break;
         case Event.actionCallToggleDmtf:
         // TODO: only iOS
           break;
         case Event.actionCallToggleGroup:
         // TODO: only iOS
           break;
         case Event.actionCallToggleAudioSession:
         // TODO: only iOS
           break;
         case Event.actionDidUpdateDevicePushTokenVoip:
         // TODO: only iOS
           break;
         case Event.actionCallCustom:
         // TODO: for custom action
           break;
       }
     });
  }

  void ifAcceptedThenRedirectToAgora(channelname,token) {
    Get.to(()=>Videos_call(token: token,channelname: channelname,));
  }

}


