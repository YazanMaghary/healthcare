import 'package:flutter/material.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/register_title.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: mainPagePading,child: Column(
        children: [
          largeSpace,
          RegisterTitle(text: '')
        ],
      ),)),
    );
  }
}
