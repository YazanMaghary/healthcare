// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';

class StartRating extends GetView {
  const StartRating({
    super.key,
    this.doctorsController,
    required this.index,
    required this.startRating,
  });
  final double startRating;
  final int index;
  final DoctorsController? doctorsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        double fillPercentage = (startRating - index).toDouble().clamp(0, 5);
        return Stack(
          children: [
            Icon(
              Icons.star,
              size: 30,
              color: Colors.grey[300], // Background color
            ),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.amber, Colors.grey.shade400],
                  stops: [fillPercentage, fillPercentage],
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.star_rounded,
                size: 30,
                color: Colors.white, // The star will take the gradient color
              ),
            ),
          ],
        );
      }),
    );
  }
}
