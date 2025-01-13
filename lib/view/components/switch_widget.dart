import 'package:flutter/material.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class SwitchWidget extends StatelessWidget {
  final void Function(bool)? onChanged;
  const SwitchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: scaffoldBackgroundColor,
      inactiveThumbColor: scaffoldBackgroundColor,
      activeTrackColor: primaryColor,
      inactiveTrackColor: inactiveThumbColor,
      value: false, // Set the initial value as needed
      onChanged:onChanged,
    );
  }
}
