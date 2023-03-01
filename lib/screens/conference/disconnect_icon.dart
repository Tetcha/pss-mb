import 'package:flutter/material.dart';

class DisconnectIcon extends StatelessWidget {
  final void Function()? onTap;
  const DisconnectIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.red, // button color
        child: InkWell(
          splashColor: Colors.redAccent, // splash color
          onTap: onTap,
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.call_end,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
