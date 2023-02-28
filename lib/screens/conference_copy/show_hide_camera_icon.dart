import 'package:flutter/material.dart';

class ShowHideCameraIconButton extends StatelessWidget {
  final bool isCameraOn;
  final void Function()? onPressed;

  const ShowHideCameraIconButton(
      {super.key, required this.isCameraOn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white, // button color
        child: InkWell(
          splashColor: Colors.grey, // splash color
          onTap: onPressed,
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              isCameraOn ? Icons.videocam : Icons.videocam_off,
              color: isCameraOn ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
