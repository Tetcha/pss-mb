import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/screens/conference/participant_widget.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'package:uuid/uuid.dart';

enum ConferenceStatus {
  initial,
  loaded,
}

class ConferenceController extends GetxController {
  final String name;
  final String token;
  final String identity;
  // for control function during the conference
  bool isMuted = false;
  bool isShareCamera = true;
  // for control participants video
  final List<ParticipantWidget> participants = [];
  // user's video
  late ParticipantWidget? myVideoInfo;

  // status for checking the room is loading or not
  late ConferenceStatus conferenceStatus;

  var trackId;
  late Room _room;
  late VideoCapturer _cameraCapturer;
  late final List<StreamSubscription> _streamSubscriptions = [];

  ConferenceController({
    required this.name,
    required this.token,
    required this.identity,
  }) {
    conferenceStatus = ConferenceStatus.initial;
    connect();
  }

  ParticipantWidget _buildParticipant({
    required Widget child,
    required String? id,
  }) {
    return ParticipantWidget(
      id: id,
      child: child,
    );
  }

  void onHandleDisconnect() {
    disconnect();
    Get.back();
  }

  void onHandleToggleMute() async {
    final tracks = _room.localParticipant?.localAudioTracks ?? [];
    final localAudioTrack = tracks.isEmpty ? null : tracks[0].localAudioTrack;
    if (localAudioTrack == null) {
      print('ConferenceRoom.toggleAudio() Track is not available yet!');
      return;
    }
    await localAudioTrack.enable(!localAudioTrack.isEnabled);

    isMuted = !localAudioTrack.isEnabled;
    update();
  }

  void onHandleToggleShareCamera() async {
    final tracks = _room.localParticipant?.localVideoTracks ?? [];
    final localVideoTrack = tracks.isEmpty ? null : tracks[0].localVideoTrack;
    if (localVideoTrack == null) {
      print('ConferenceRoom.toggleVideo() Track is not available yet!');
      return;
    }
    await localVideoTrack.enable(!localVideoTrack.isEnabled);

    isShareCamera = !isShareCamera;
    update();
  }

  connect() async {
    try {
      await TwilioProgrammableVideo.setAudioSettings(
          speakerphoneEnabled: true, bluetoothPreferred: false);

      final sources = await CameraSource.getSources();
      _cameraCapturer = CameraCapturer(
        sources.firstWhere((source) => source.isFrontFacing),
      );
      trackId = const Uuid().v4();

      var connectOptions = ConnectOptions(
        token,
        roomName: name,
        preferredAudioCodecs: [OpusCodec()],
        audioTracks: [LocalAudioTrack(true, 'audio_track-$trackId')],
        dataTracks: [
          LocalDataTrack(
            DataTrackOptions(name: 'data_track-$trackId'),
          )
        ],
        videoTracks: [LocalVideoTrack(true, _cameraCapturer)],
        enableNetworkQuality: true,
        networkQualityConfiguration: NetworkQualityConfiguration(
          remote: NetworkQualityVerbosity.NETWORK_QUALITY_VERBOSITY_MINIMAL,
        ),
        enableDominantSpeaker: true,
      );

      _room = await TwilioProgrammableVideo.connect(connectOptions);

      _streamSubscriptions.add(_room.onConnected.listen(_onConnected));
      _streamSubscriptions.add(_room.onDisconnected.listen(_onDisconnected));
      _streamSubscriptions.add(_room.onReconnecting.listen(_onReconnecting));
      _streamSubscriptions
          .add(_room.onConnectFailure.listen(_onConnectFailure));
    } catch (err) {
      print('[ APPDEBUG ] $err');
      rethrow;
    }
  }

  Future<void> disconnect() async {
    await _room.disconnect();
  }

  void _onDisconnected(RoomDisconnectedEvent event) {}

  void _onReconnecting(RoomReconnectingEvent room) {}

  void _onConnected(Room room) {
    // When connected for the first time, add remote participant listeners
    _streamSubscriptions
        .add(_room.onParticipantConnected.listen(_onParticipantConnected));
    _streamSubscriptions.add(
        _room.onParticipantDisconnected.listen(_onParticipantDisconnected));
    final localParticipant = room.localParticipant;
    if (localParticipant == null) {
      return;
    }

    // Only add ourselves when connected for the first time too.
    myVideoInfo = _buildParticipant(
      child: localParticipant.localVideoTracks[0].localVideoTrack.widget(),
      id: identity,
    );

    for (final remoteParticipant in room.remoteParticipants) {
      bool isParticipantAlreadyPresent = participants
          .any((participant) => participant.id == remoteParticipant.sid);

      if (isParticipantAlreadyPresent == false) {
        _addRemoteParticipantListeners(remoteParticipant);
      }
    }
    conferenceStatus = ConferenceStatus.loaded;
    update();
  }

  void _onConnectFailure(RoomConnectFailureEvent event) {}

  void _onParticipantConnected(RoomParticipantConnectedEvent event) {
    _addRemoteParticipantListeners(event.remoteParticipant);
    update();
  }

  void _onParticipantDisconnected(RoomParticipantDisconnectedEvent event) {
    participants.removeWhere(
        (ParticipantWidget p) => p.id == event.remoteParticipant.sid);
    update();
  }

  void _addRemoteParticipantListeners(RemoteParticipant remoteParticipant) {
    _streamSubscriptions.add(remoteParticipant.onVideoTrackSubscribed
        .listen(_addOrUpdateParticipant));
    _streamSubscriptions.add(remoteParticipant.onAudioTrackSubscribed
        .listen(_addOrUpdateParticipant));
  }

  void _addOrUpdateParticipant(RemoteParticipantEvent event) {
    final participant = participants
        .any((element) => element.id == event.remoteParticipant.sid);

    if (participant == true) {
    } else {
      if (event is RemoteVideoTrackSubscriptionEvent) {
        participants.insert(
          0,
          _buildParticipant(
            child: event.remoteVideoTrack.widget(),
            id: event.remoteParticipant.sid,
          ),
        );
        update();
      }
    }
  }

  reload() {
    conferenceStatus = ConferenceStatus.initial;
    conferenceStatus = ConferenceStatus.loaded;

    update();
  }
}
