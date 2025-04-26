import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/custom_card.dart';
import 'package:healthcare/view/components/shimmer_wdget.dart';
import 'package:healthcare/view/components/text_button.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});
  final DoctorsController doctorsController =
      Get.put<DoctorsController>(DoctorsController());
  final authController = Get.put<AuthController>(AuthController());

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
              GetBuilder<AuthController>(
                init: authController,
                initState: (state) {
                  authController.tookenExpired();
                },
                builder: (GetxController controller) {
                  return Text(
                    authController.user?.name ?? "",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
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
            onTap: () async {
              box?.remove("Token");
              //for testing onBoardingPage routing setting
              // box?.remove("firstTime");
              box?.remove(
                "email",
              );
              box?.remove("password");
              box?.remove("remmeberPassword");
              box?.remove("User");
              box?.remove("register");
              // box?.erase();
              Get.offNamed(
                '/OnBoardingScreen',
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
                      child: Container(alignment: Alignment.centerLeft,
                        child: Text('Book and \nschedule with \nnearest doctor',
                            style: semiBoldWhite18),
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
              smallSpace4,
              GetBuilder<DoctorsController>(
                  init: doctorsController,
                  initState: (state) async {
                    await doctorsController.getCategories();
                  },
                  builder: (controller) {
                    if (doctorsController.isCategoriesLoading == true) {
                      return SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          padding:
                              EdgeInsets.only(left: 8.w, right: 8.w, top: 16.h),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SpecialityShimmer();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 20.w);
                          },
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          padding:
                              EdgeInsets.only(left: 8.w, right: 8.w, top: 16.h),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: doctorsController.categoriesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MySpeciailtyCard(
                              speciailtyImagePath:
                                  "${doctorsController.categoriesList[index].image}",
                              speciailtyType:
                                  doctorsController.categoriesList[index].name!,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 20.w,
                            );
                          },
                        ),
                      );
                    }
                  }),
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
              smallSpace4,
              GetBuilder<DoctorsController>(
                init: doctorsController,
                initState: (state) async {
                  await doctorsController.getDoctors();
                },
                builder: (GetxController controller) {
                  if (doctorsController.isDoctorsLoading) {
                    //GradiantColor
                    //Here
                    return ListView.separated(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      itemBuilder: (context, index) {
                        return doctorCardShimmer();
                      },
                      separatorBuilder: (context, index) {
                        return smallSpace4;
                      },
                      itemCount: 4,
                    );
                  } else {
                    return ListView.separated(
                      key: UniqueKey(),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      itemCount: 3,
                      separatorBuilder: (context, index) {
                        return mediumSpace24;
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            //Here
                            // Here  to make a good performance ui and fetch data faster fetch only one doctor from ppassing doctor id useing getDoctorById
                            box?.write("doctorId",
                                doctorsController.doctorsList[index].id);

                            Get.toNamed('/Doctordetails', arguments: {
                              "index": index,
                              "doctorId":
                                  doctorsController.doctorsList[index].id
                            });
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r)),
                                child: Image.network(
                                  "${ApiConstances.baseUrl}/${doctorsController.doctorsList[index].user?.image}",
                                  width: 110.h,
                                  height: 110.h,
                                  errorBuilder: (context, errorrz, stackTrace) {
                                    return Image.asset(
                                      defaultProfile,
                                      width: 110.h,
                                      height: 110.h,
                                    );
                                  },
                                ),
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
                                  smallSpace4,
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
                                  smallSpace4,
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
                                            .rating!.averageRating!
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
