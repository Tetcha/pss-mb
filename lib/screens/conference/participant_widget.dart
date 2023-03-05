import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final Widget child;
  final String? id;
  final bool isCameraEnabled;
  const ParticipantWidget({
    required this.child,
    required this.id,
    required this.isCameraEnabled,
  });

  ParticipantWidget copyWith({
    Widget? child,
    String? id,
    bool? isCameraEnabled,
  }) {
    return ParticipantWidget(
      id: id ?? this.id,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      child: child ?? this.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isCameraEnabled == false) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: const [
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
            Text("Camera is disabled"),
          ],
        ),
      );
    }
    return Container(
      child: child,
    );
  }
}
