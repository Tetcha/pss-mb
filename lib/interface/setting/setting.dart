import 'package:flutter/material.dart';

class ISettingItem {
  String title;
  IconData icon;
  VoidCallback onTap;

  ISettingItem({required this.title, required this.icon, required this.onTap});
}
