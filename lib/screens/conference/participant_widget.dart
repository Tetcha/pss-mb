import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final Widget child;
  final String? id;
  final bool isCameraEnabled;
  const ParticipantWidget({
    super.key,
    required this.child,
    required this.id,
    required this.isCameraEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
