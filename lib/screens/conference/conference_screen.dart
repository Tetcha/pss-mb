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

  Widget _buildMyVideo(ParticipantData? me, bool isEnabled) {
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

  Widget _buildParticipants(List<ParticipantData> participants) {
    if (participants.isEmpty) return Container();
    if (participants[0].isCameraEnabled == false) {
      return Stack(children: const [
        Expanded(
          child: Center(
            child: Icon(Icons.people),
          ),
        )
      ]);
    }

    return Stack(children: [participants[0].child]);
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
