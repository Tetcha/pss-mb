import 'package:flutter/material.dart';

class CBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChangeTab;

  const CBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onChangeTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Doctor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Treatment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: onChangeTab,
    );
  }
}
