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
      return Positioned.fill(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Expanded(
            child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.videocam_off,
                size: 100,
                color: Colors.white,
              ),
              Text(
                'Doctor camera is off',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )),
      );
    }
    print("[ APPDEBUG ] render child");
    return Container(
      child: child,
    );
  }
}
