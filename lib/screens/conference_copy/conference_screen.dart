import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/screens/conference/participant_widget.dart';
import 'package:pss_m/screens/conference_copy/conference.controller.dart';
import 'package:pss_m/screens/conference_copy/disconnect_icon.dart';
import 'package:pss_m/screens/conference_copy/mute_unmute_icon.dart';
import 'package:pss_m/screens/conference_copy/show_hide_camera_icon.dart';

class ConferenceScreen extends StatelessWidget {
  const ConferenceScreen({super.key});

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
          child: me,
        ),
      ),
    );
  }

  Widget _buildParticipants(List<ParticipantWidget> participants) {
    if (participants.isEmpty) return Container();

    return Stack(children: [Expanded(child: participants[0])]);
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
          name: "frc",
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzkxY2IzNjYxMDAxZDM2YWE3NTNlZjU1OTgwNWE1NjIwLTE2Nzc1OTg2OTEiLCJncmFudHMiOnsiaWRlbnRpdHkiOiJ5ZXllIiwidmlkZW8iOnsicm9vbSI6InRlc3Qtcm9vbSJ9fSwiaWF0IjoxNjc3NTk4NjkxLCJleHAiOjE2Nzc2MDIyOTEsImlzcyI6IlNLOTFjYjM2NjEwMDFkMzZhYTc1M2VmNTU5ODA1YTU2MjAiLCJzdWIiOiJBQ2YzMTdhYWYwMGExNTkyNjVjZjJlOWRlNGE2NzY1MDEzIn0.QBEvikEr-RpkrBueovFKlqbHUwdAcTeNC5UUn-tUjpA",
          identity: "user",
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
