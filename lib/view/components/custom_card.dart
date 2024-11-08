import 'package:flutter/material.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class mySpeciailtyCard extends StatelessWidget {
  final String speciailtyImagePath;
  final String speciailtyType;

  const mySpeciailtyCard({
    super.key,
    required this.speciailtyImagePath,
    required this.speciailtyType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: greyBackground),
          padding: const EdgeInsets.all(24),
          child: Image.asset(
            speciailtyImagePath,
            fit: BoxFit.cover,
            width: 30,
            height: 30,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(speciailtyType)
      ],
    );
  }
}
