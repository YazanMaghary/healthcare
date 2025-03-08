import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/custom_card.dart';
import 'package:healthcare/view/components/shimmer_wdget.dart';
import 'package:healthcare/view/components/text_button.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DoctorsController doctorsController = Get.put(DoctorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: scaffoldBackgroundColor,
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Yazan Maghary",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'How Are you Today?',
                style: smallNormalGrey,
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.offNamed('/NotificationsScreen');
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: greyBackground,
                shape: BoxShape.circle,
              ),
              child: Stack(children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                ),
                Positioned(
                  left: 16,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                )
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              box?.remove("Token");
              Get.offNamed(
                '/LoginScreen',
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: greyBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout_rounded,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 250.h,
                child: Stack(children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 35.w,
                    bottom: 0,
                    child: Container(
                      height: 250.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Book and \nschedule with \nnearest doctor',
                                  style: semiBoldWhite18),
                              mediumSpace20,
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 16.w),
                                  child: const Text(
                                    'Find Nearby',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 180.h,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      nurseImage,
                      fit: BoxFit.contain,
                    ),
                  )
                ]),
              ),
              mediumSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Doctor Speciality',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CustumTextButton(
                      title: 'See All',
                      onTap: () {
                        Get.offNamed('/DoctorSpeciality');
                      }),
                ],
              ),
              smallSpace,
              GetBuilder(
                  init: doctorsController,
                  builder: (controller) {
                    if (doctorsController.isCategoriesLoading ==true) {
                      return SpecialityShimmer();
                    }else {
                      return ListView.separated(
                      shrinkWrap: true,
                      itemCount: doctorsController.categoriesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return mySpeciailtyCard(
                          speciailtyImagePath:
                              "${doctorsController.categoriesList[index].image}",
                          speciailtyType:
                              doctorsController.categoriesList[index].name!,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5.w,
                        );
                      },
                    );
                
                    }
                    }),
              mediumSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommendation Doctor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustumTextButton(
                      title: 'See All',
                      onTap: () {
                        Get.offNamed('/RecommandationDoctorScreen');
                      }),
                ],
              ),
              smallSpace,
              GetBuilder<DoctorsController>(
                init: doctorsController,
                builder: (GetxController controller) {
                  if (doctorsController.isDoctorsLoading) {
                    //GradiantColor
                    //Here
                    return doctorCardShimmer();
                  } else {
                    return ListView.separated(
                      key: UniqueKey(),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      itemCount: doctorsController.doctorsList.length,
                      separatorBuilder: (context, index) {
                        return smallSpace;
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.offNamed('/Doctordetails');
                          },
                          child: Row(
                            key: ValueKey(index),
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "${ApiConstances.baseUrl}/${doctorsController.doctorsList[index].user?.image}")),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.r))),
                                width: 110.w,
                                height: 110.w,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctorsController
                                        .doctorsList[index].user!.name!,
                                    style: semiBoldBlack16,
                                  ),
                                  smallSpace,
                                  Row(
                                    children: [
                                      Text(
                                        doctorsController.doctorsList[index]
                                            .specialization!.name!,
                                        style: smallNormalGrey,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        '|',
                                        style: smallNormalGrey,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        doctorsController
                                            .doctorsList[index].hospital!,
                                        style: smallNormalGrey,
                                      )
                                    ],
                                  ),
                                  smallSpace,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: starsColor,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        doctorsController.doctorsList[index]
                                            .rating!.averageRating
                                            .toString(),
                                        style: smallNormalGrey,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        doctorsController.doctorsList[index]
                                            .rating!.numberOfReviews
                                            .toString(),
                                        style: smallNormalGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
