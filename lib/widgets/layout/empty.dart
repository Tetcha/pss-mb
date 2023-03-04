import 'package:flutter/material.dart';

class EmptyLayout extends StatelessWidget {
  final Widget children;
  final String title;
  final double layoutPadding;
  const EmptyLayout(
      {super.key,
      required this.children,
      this.title = 'Psych System',
      this.layoutPadding = 10});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: RepaintBoundary(
          key: const Key("global key"),
          child: Container(
            padding: EdgeInsets.all(layoutPadding),
            child: SingleChildScrollView(
              child: children,
            ),
          ),
        ),
      ),
    );
  }
}
