import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suivivital/utils/color.dart';
import 'package:suivivital/view/Doctoe/navgation_bar.dart';
import '../../utils/constant.dart';
import '../../utils/roundedbtn.dart';
import 'api_controller/video_call_token_get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';



//final StopWatchTimer _stopWatchTimer = StopWatchTimer();

class Video_call_doctor extends StatefulWidget {
  final token;
  final channelname;

  const Video_call_doctor({super.key, this.token, this.channelname});

  @override
  State<Video_call_doctor> createState() => _Video_call_doctorState();
}

class _Video_call_doctorState extends State<Video_call_doctor> {
  bool _localUserJoined = false;
  final token = Get.put(Get_token());
  late final displayTime;


  @override
  void dispose() async{
    // TODO: implement dispose
    setState(() {
      _localUserJoined = false;
      userlist = null;
    });

    _engine1.leaveChannel();
    _engine1.release();
    await _stopWatchTimer1.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
  _stopWatchTimer1.onStartTimer();
    startagora();
    super.initState();
  }


  int? userlist;
  final infostring = <String>[];
  bool muted = false;
  bool viewpanel = false;
  late final RtcEngine _engine1;

  startagora() async {
    _engine1 = await createAgoraRtcEngine();

    await _engine1.initialize(const RtcEngineContext(
      appId: appid,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    await _engine1.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _addagorahandler();
    await _engine1.enableVideo();
    await _engine1.startPreview();
    await _engine1.joinChannel(
        token: widget.token,
        channelId: widget.channelname,
        uid: 0,
        options: ChannelMediaOptions());
  }

  _addagorahandler() {
    _engine1.registerEventHandler(
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
          debugPrint("************local user ${connection.localUid} joined");
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
        onTokenPrivilegeWillExpire:
            (RtcConnection connection, String token) async {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
          await leave();
        },
      ),
    );
  }

  Widget _remoteVideo() {
    if (userlist != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine1,
          canvas: VideoCanvas(uid: userlist),
          connection: RtcConnection(channelId: widget.channelname),
        ),
      );
    } else {
      return const Text(
        'Please wait for user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  leave() {
    setState(() {
      _localUserJoined = false;
      userlist = null;
    });
    _engine1.leaveChannel();
  }
  final _stopWatchTimer1 = StopWatchTimer(mode: StopWatchMode.countUp);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0, backgroundColor: colors.logosec,
        title:
        StreamBuilder<int>(
          stream: _stopWatchTimer1.rawTime,
          initialData: 0,
          builder: (context, snapshot) {
            final value8 = snapshot.data;
            final displayTime = StopWatchTimer.getDisplayTime(value8!);
            return Row(
              children: [
                Text(
                  StopWatchTimer.getDisplayTimeHours(value8!).toString() +
                      ":" +
                      StopWatchTimer.getDisplayTimeMinute(value8!).toString() +
                      ":" +
                      StopWatchTimer.getDisplayTimeSecond(value8!).toString(),
                  style: TextStyle(color: Colors.white,fontSize: 13),
                ),
              ],
            );
          },
        ),
// leading: Text(displayTime),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned(child: _stopWatchTimer.get),
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
                                _engine1.muteLocalVideoStream(false);
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
                                _engine1.muteLocalVideoStream(true);
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
                          Get.to(() => const Nav_bar());
                          // leave();
                        },
                        color: Color(0xFFFF1E46),
                        iconColor: Colors.grey.shade100,
                        iconSrc: Icons.call_end_outlined,
                      ),
                      RoundedButton(
                        press: () {
                          _engine1.switchCamera();
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
                          rtcEngine: _engine1,
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
}
