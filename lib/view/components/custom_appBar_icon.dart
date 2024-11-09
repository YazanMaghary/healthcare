import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final Function() onTap;
  const AppBarIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
