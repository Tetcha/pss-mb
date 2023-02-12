import 'package:flutter/material.dart';

class IconLabelWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const IconLabelWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  _IconLabelWidgetState createState() => _IconLabelWidgetState();
}

class _IconLabelWidgetState extends State<IconLabelWidget> {
  bool isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isPressed
                  ? Theme.of(context).primaryColor.withOpacity(0.5)
                  : Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
