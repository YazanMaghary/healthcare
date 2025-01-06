import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../../core/utils/app_constanses.dart';
import '../screens/home/doctor_speciaity.dart';

class myTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const myTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  color: primaryColor, fontSize: 16),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap),
        ],
      ),
    );
  }
}
