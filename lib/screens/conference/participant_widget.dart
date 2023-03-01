import 'package:flutter/material.dart';

class ParticipantData {
  final Widget child;
  final String? id;
  final bool isCameraEnabled;
  const ParticipantData({
    required this.child,
    required this.id,
    required this.isCameraEnabled,
  });

  ParticipantData copyWith({
    Widget? child,
    String? id,
    bool? isCameraEnabled,
  }) {
    return ParticipantData(
      id: id ?? this.id,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      child: child ?? this.child,
    );
  }
}
