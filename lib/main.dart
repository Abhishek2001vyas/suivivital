import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:suivivital/view/common/fcm_dart.dart';
import 'package:suivivital/view/common/notifivationbyfirebase.dart';
import 'package:suivivital/view/common/splash%20scrren.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:suivivital/view/user/video_call.dart';
import 'firebase_options.dart';
import 'language_constant.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:shared_preferences/shared_preferences.dart ';

// var poi;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // var notificationService = NotificationService;

  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseApi().isDeviceTokenRefresh();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseApi().initNotification();
  runApp(const MyApp());

}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.notification!.title.toString());
  if(message.data["call"] !=null){
    var shared_preferences = await SharedPreferences.getInstance();
    var user_id = shared_preferences.setString("imcominguserid",message.data["user_id"]);
    var doctorid = shared_preferences.setString("imcomingdoctorid",message.data["doctor_id"]);
   call(message.data["temp_channel_name"],message.data["int_uid"],
   );
    await Firebase.initializeApp();
  }
  else{
    await Firebase.initializeApp();

}


}

call(channelname,token)async{
  var shared_preferences = await SharedPreferences.getInstance();
  var isLogedIn = shared_preferences.getString('user_id');
  CallKitParams callKitParams = CallKitParams(
    id:isLogedIn.toString() ,
    nameCaller: 'Doctor',
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    notification().firebaseinit(context as BuildContext );
    // var qwet = await SharedPreferences.getInstance();
    // var poi=qwet.getString("lang");
    return GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        debugShowCheckedModeBanner: false,
        home: const Splash());
  }


}
