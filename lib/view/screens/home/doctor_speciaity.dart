import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_images.dart';
import '../../components/custom_card.dart';
import 'main_app_screen.dart';

class DoctorSpeciality extends StatefulWidget {
  const DoctorSpeciality({super.key});

  @override
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  final List<String> specialities = [
    'Optometry',
    'ENT',
    'Pediatric',
    'Urologist',
    'Dentistry',
    'Intestine',
    'Histologist',
    'Hepatology',
    'Cardiologist',
    'Neurologic',
    'Pulmonary',
    'Optometry',
  ];

  final List<String> icons = [
    optometryImage,
    eNTImage,
    pediatricImage,
    urologistImage,
    dentistryImage,
    intestineImage,
    histologistImage,
    hepatologyImage,
    cardiologistImage,
    neurologicImage,
    pulmonaryImage,
    optometryImage,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(
                  const myMain(),
                  transition: Transition.leftToRight,
                );
              },
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
        ),
        title: const Text(
          'Doctor Speciality',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 25.0, mainAxisSpacing: 25.0),
          itemCount: specialities.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                mySpeciailtyCard(
                  speciailtyImagePath: icons[index],
                  speciailtyType: specialities[index],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
