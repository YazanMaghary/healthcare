import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/view/components/shimmer_wdget.dart';
import '../../components/custom_card.dart';
import 'main_app_screen.dart';

// ignore: must_be_immutable
class DoctorSpeciality extends StatelessWidget {
  DoctorSpeciality({super.key});
  DoctorsController doctorsController = Get.put(DoctorsController());
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
                  const MainAppScreen(),
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
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 16.w,
        ),
        child: GetBuilder(
            init: doctorsController,
            initState: (state) async {
              doctorsController.getCategories();
            },
            builder: (controller) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.h,
                    mainAxisSpacing: 8.h),
                itemCount: doctorsController.categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (doctorsController.isCategoriesLoading) {
                    return SpecialityShimmer();
                  } else {
                    return Column(
                      children: [
                        MySpeciailtyCard(
                          speciailtyImagePath:
                              doctorsController.categoriesList[index].image!,
                          speciailtyType:
                              doctorsController.categoriesList[index].name!,
                        ),
                      ],
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}
