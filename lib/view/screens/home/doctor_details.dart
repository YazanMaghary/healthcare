import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/startRating_widget.dart';

import '../../../core/utils/app_images.dart';
import '../../components/custom_appBar_icon.dart';

//Here replace GetDoctors by GetDoctorByID
class Doctordetails extends StatefulWidget {
  const Doctordetails({
    super.key,
  });

  @override
  State<Doctordetails> createState() => _DoctordetailsState();
}

class _DoctordetailsState extends State<Doctordetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  DoctorsController doctorsController = Get.put(
    DoctorsController(),
  );
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorsController>(
        init: doctorsController,
        initState: (state) async {
          await doctorsController.getDoctorById(box?.read("doctorId"));
        },
        builder: (controller) {
          if (doctorsController.doctor == null) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: scaffoldBackgroundColor,
              surfaceTintColor: scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarIcon(
                    onTap: () {
                      box?.remove("doctorId");
                      Get.back();
                    },
                  ),
                  Text(
                    doctorsController.doctor!.user!.name!,
                    style: semiBoldBlack18,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.more_horiz,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:doctorsController.doctor!.user?.image!=null ? NetworkImage(
                                    "${ApiConstances.baseUrl}/${doctorsController.doctor!.user?.image}"):const AssetImage(defaultProfile))),
                        width: 80.w,
                        height: 80.w,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorsController.doctor!.user!.name!,
                            style: semiBoldBlack18,
                          ),
                          smallSpace4,
                          Row(
                            children: [
                              Text(
                                  doctorsController
                                      .doctor!.specialization!.name!,
                                  style: smallNormalGrey),
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
                                doctorsController.doctor!.hospital!,
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
                                "${doctorsController.doctor!.rating?.averageRating}",
                                style: smallNormalGrey,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "${doctorsController.doctor!.rating?.numberOfReviews}",
                                style: smallNormalGrey,
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, left: 16),
                        child: Image.asset(messageText),
                      )
                    ],
                  ),
                ),
                TabBar(
                  unselectedLabelColor: greyColor,
                  unselectedLabelStyle: semiBoldBlack16,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  labelStyle: semiBoldBlack16,
                  indicatorSize: TabBarIndicatorSize.values.first,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 24.w),
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'About'),
                    Tab(text: 'Review'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 8.h),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mediumSpace20,
                              Text(
                                'About me',
                                style: semiBoldBlack16,
                              ),
                              smallSpace4,
                              Text(
                                style: semiBoldGrey14,
                                '${doctorsController.doctor!.aboutMe}',
                              ),
                              mediumSpace20,
                              Text(
                                'Working Time',
                                style: semiBoldBlack16,
                              ),
                              smallSpace4,
                              Text(
                                  '${doctorsController.doctor!.workingDays?.from} - ${doctorsController.doctor!.workingDays?.to}, ${doctorsController.doctor!.workingHours?.startTime} - ${doctorsController.doctor!.workingHours?.endTime}',
                                  style: semiBoldGrey14),
                              mediumSpace20,
                              Text(
                                'STR',
                                style: semiBoldBlack16,
                              ),
                              smallSpace4,
                              Text(
                                  '${doctorsController.doctor!.registrationNumber}',
                                  style: semiBoldGrey14),
                              mediumSpace20,
                              Text(
                                'Pengalaman Praktik',
                                style: semiBoldBlack16,
                              ),
                              mediumSpace20,
                              GetBuilder(
                                  init: doctorsController,
                                  builder: (controller) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: doctorsController
                                          .doctor!.experience!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${doctorsController.doctor!.experience![index].hospital}',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            smallSpace4,
                                            Text(
                                              '${doctorsController.doctor!.experience![index].endYear} - ${doctorsController.doctor!.experience![index].experienceId}',
                                              style: semiBoldGrey14,
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return mediumSpace20;
                                      },
                                    );
                                  })
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  mediumSpace20,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: doctorsController
                                                    .doctor!
                                                    .reviews?[index]
                                                    .user
                                                    ?.image !=
                                                null
                                            ? NetworkImage(
                                                "${ApiConstances.baseUrl}/${doctorsController.doctor!.reviews?[index].user?.image}")
                                            : const AssetImage(defaultProfile),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${doctorsController.doctor!.reviews![index].user?.name}",
                                            style: semiBoldBlack16,
                                          ),
                                          smallSpace4,
                                          StartRating(
                                            doctorsController:
                                                doctorsController,
                                            startRating: doctorsController
                                                .doctor!.rating!.averageRating!
                                                .toDouble(),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: Text(
                                          'Today',
                                          style: smallNormalGrey,
                                        ),
                                      )
                                    ],
                                  ),
                                  smallSpace4,
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 48.w),
                                    child: Text(
                                      '${doctorsController.doctor!.reviews?[index].comment}',
                                      style: semiBoldGrey12,
                                    ),
                                  )
                                ],
                              );
                            },
                            itemCount:
                                doctorsController.doctor!.reviews?.length),
                      )
                    ],
                  ),
                ),
                mediumSpace20,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: PrimaryButton(
                    buttonText: 'Make An Appointment',
                    onPressed: () {
                      Get.toNamed('/BookingScreen');
                    },
                  ),
                ),
                mediumSpace20
              ],
            ),
          );
        });
  }
}
