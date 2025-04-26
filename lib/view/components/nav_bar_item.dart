import 'package:flutter/material.dart';

// ignore: camel_case_types
class buildNavBarItem extends StatelessWidget {
  const buildNavBarItem(
      {super.key,
      required this.icon,
      required this.index,
      required this.onTap,
      required this.color});
  final IconData icon;
  final int index;
  final Color color;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(index),
        child: Icon(
          color: color,
          icon,
          size: 30,
        ));
  }
}
