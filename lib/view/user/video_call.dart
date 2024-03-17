import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import '../../utils/constant.dart';
import '../../utils/roundedbtn.dart';
import '../Doctoe/api_controller/video_call_token_get.dart';
import 'completestatus.dart';
import 'Nav_bar_usser.dart';
import 'home/home1.dart';
import 'dart:developer';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';





class Videos_call extends StatefulWidget {
  final channelname;
  final token;

  const Videos_call({
    super.key, this.channelname, this.token,
  });

  @override
  State<Videos_call> createState() => _Videos_callState();
}

class _Videos_callState extends State<Videos_call> {
  // final token = Get.put(Get_token());
  final _stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  @override
  void dispose() async{
    // TODO: implement dispose
    setState(() {
      _localUserJoined = false;
      userlist = null;
    });

    _engine.leaveChannel();
    _engine.release();
    await _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _stopWatchTimer.onStartTimer();
    startagora();
    super.initState();
  }

  int? userlist;
  final infostring = <String>[];
  bool muted = false;
  bool viewpanel = false;
  late RtcEngine _engine;

  startagora() async {
    _engine = await createAgoraRtcEngine();

    await _engine.initialize(const RtcEngineContext(
      appId: appid,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _addagorahandler();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.joinChannel(
        token: widget.token,
        channelId: widget.channelname,
        uid: 0,
        options: ChannelMediaOptions());
  }

  _addagorahandler() {
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onRequestToken: (connection) {
          print("@@@@${connection.localUid}");
        },
        onRejoinChannelSuccess: (connection, elapsed) {
          setState(() {
            _localUserJoined = true;
            final info = "join channel : $connection";
            infostring.add(info);
          });
        },
        onError: (ErrorCodeType err, String msg) {
          print('[onError] err: $err, msg: $msg');
        },
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            _localUserJoined = true;
            final info = "join channel : $connection";
            infostring.add(info);
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            final info = "user channel :$remoteUid";
            infostring.add(info);
            userlist = remoteUid;
          });
        },
        onLeaveChannel: (connection, stats) {
          setState(() {
            infostring.add("leave channel");
            userlist = null;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          setState(() {
            final info = "user offline : $remoteUid";
            infostring.add(info);
            userlist = null;
          });
        },

        onFirstRemoteVideoFrame:
            (connection, remoteUid, width, height, elapsed) {
          setState(() {
            var jj = width * height;
            final info = "first remote video: $remoteUid ${jj} ";
            infostring.add(info);
          });
        },

        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) async{
          debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
          await leave();
          },
      ),
    );
  }

  Widget _remoteVideo() {
    if (userlist != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: userlist),
          connection:  RtcConnection(channelId:  widget.channelname),
        ),
      );
    } else {
      return const Text(
        'Please wait for Doctor to join',
        textAlign: TextAlign.center,
      );
    }
  }

  leave() {
    setState(() {
      _localUserJoined = false;
      userlist = null;
    });
    _engine.leaveChannel();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0, backgroundColor: colors.logosec,
        title:
        StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: 0,
        builder: (context, snapshot) {
          final value2 = snapshot.data;
          final displayTime = StopWatchTimer.getDisplayTime(value2!);
          return Row(
            children: [
              Text(
                  "${StopWatchTimer.getDisplayTimeHours(value2!)}:${StopWatchTimer.getDisplayTimeMinute(value2!)}:${StopWatchTimer.getDisplayTimeSecond(value2!)}"

              ,style: const TextStyle(
                color: Colors.white
              ),

              ),
            ],
          );
        },),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      muted == true
                          ? RoundedButton(
                              press: () {
                                _engine.muteLocalVideoStream(false);
                                setState(() {
                                  muted = false;
                                });
                              },
                              color: kPrimaryColor,
                              iconColor: Colors.grey.shade100,
                              iconSrc: Icons.mic_outlined,
                            )
                          : RoundedButton(
                              press: () {
                                _engine.muteLocalVideoStream(true);
                                setState(() {
                                  muted = true;
                                });
                              },
                              color: kPrimaryColor,
                              iconColor: Colors.grey.shade100,
                              iconSrc: Icons.mic_off_outlined,
                            ),
                      RoundedButton(
                        press: () async {
                          await leave();
                          Get.to(() => Home1());
                        },
                        color: Color(0xFFFF1E46),
                        iconColor: Colors.grey.shade100,
                        iconSrc: Icons.call_end_outlined,
                      ),
                      RoundedButton(
                        press: () {
                          _engine.switchCamera();
                        },
                        color: kPrimaryColor,
                        iconColor: Colors.grey.shade100,
                        iconSrc: Icons.cameraswitch_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _localUserJoined = false;


}
