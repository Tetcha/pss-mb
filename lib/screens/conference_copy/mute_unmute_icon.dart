import 'package:flutter/material.dart';

class MuteUnmuteIconButton extends StatelessWidget {
  final bool isMuted;
  final void Function()? onPressed;

  const MuteUnmuteIconButton(
      {super.key, required this.isMuted, required this.onPressed});

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
              isMuted ? Icons.mic_off : Icons.mic,
              color: isMuted ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
