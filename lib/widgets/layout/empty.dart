import 'package:flutter/material.dart';

class EmptyLayout extends StatelessWidget {
  final Widget children;
  const EmptyLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Psych System'),
      ),
      body: SafeArea(
        child: RepaintBoundary(
          key: const Key("global key"),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: children,
            ),
          ),
        ),
      ),
    );
  }
}
