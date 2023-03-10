import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/screens/conference/participant_widget.dart';
import 'package:pss_m/screens/conference/conference.controller.dart';
import 'package:pss_m/screens/conference/disconnect_icon.dart';
import 'package:pss_m/screens/conference/mute_unmute_icon.dart';
import 'package:pss_m/screens/conference/show_hide_camera_icon.dart';

class ConferenceScreen extends StatelessWidget {
  final String name;
  final String token;
  final String identify;
  const ConferenceScreen({
    super.key,
    required this.name,
    required this.token,
    required this.identify,
  });

  Widget _buildMyVideo(ParticipantWidget? me, bool isEnabled) {
    if (me == null) return Container();

    if (isEnabled == false) return Container();
    return Positioned(
      top: 10,
      right: 10,
      child: SizedBox(
        width: 140,
        height: 180,
        child: Card(
          child: me.child,
        ),
      ),
    );
  }

  Widget _buildParticipants(List<ParticipantWidget> participants) {
    if (participants.isEmpty) {
      return Positioned.fill(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(color: Colors.white),
                Text('Waiting for doctor to join...',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      );
    }

    return Positioned.fill(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Card(
        child: participants[0],
      ),
    );
  }

  Widget showProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 10,
        ),
        Text(
          'Connecting to the room...',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<ConferenceController>(
        init: ConferenceController(
          name: name,
          token: token,
          identity: identify,
        ),
        builder: (_) {
          if (_.conferenceStatus == ConferenceStatus.initial) {
            return showProgress();
          }
          if (_.conferenceStatus == ConferenceStatus.loaded) {
            return Stack(
              children: <Widget>[
                _buildParticipants(_.participants),
                _buildMyVideo(_.myVideoInfo, _.isShareCamera),
                Positioned(
                  bottom: 20,
                  left: 10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MuteUnmuteIconButton(
                        isMuted: _.isMuted,
                        onPressed: _.onHandleToggleMute,
                      ),
                      const SizedBox(width: 13),
                      ShowHideCameraIconButton(
                        isCameraOn: _.isShareCamera,
                        onPressed: _.onHandleToggleShareCamera,
                      ),
                      const SizedBox(width: 13),
                      DisconnectIcon(
                        onTap: _.onHandleDisconnect,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
