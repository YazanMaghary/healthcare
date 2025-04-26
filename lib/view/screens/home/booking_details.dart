import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:intl/intl.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final doctorController = Get.put<DoctorsController>(DoctorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.offAndToNamed("/MainAppScreen");
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
        centerTitle: true,
        title: Text(
          'Details',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          buttonText: 'Done',
          onPressed: () {
            Get.offAllNamed('/MainAppScreen');
          },
        ),
      ),
      body: Padding(
        padding: mainPagePading,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  mediumSpace20,
                  const Image(
                      image: AssetImage('assets/images/confermdBook.png')),
                  mediumSpace20,
                  Text(
                    'Booking Confirmed',
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  largeSpace,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Information',
                    style: semiBoldBlack16,
                  ),
                  mediumSpace20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                          image: AssetImage('assets/images/Date&Time.png')),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date & Time',
                              style: semiBoldBlack14,
                            ),
                            Text(
                              DateFormat('EEEE, dd MMMM yyyy').format(
                                  DateTime.parse(Get.arguments["dateTime"])),
                              style: semiBoldBlack12,
                            ),
                            Text(
                              Get.arguments['time'],
                              style: semiBoldBlack12,
                            ),
                          ]),
                    ],
                  ),
                  smallSpace4,
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  smallSpace4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                          image:
                              AssetImage('assets/images/AppointmentType.png')),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appointment Type',
                            style: semiBoldBlack14,
                          ),
                          Text(
                            Get.arguments['type'],
                            style: semiBoldBlack12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  smallSpace4,
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  mediumSpace20,
                  Text(
                    'Doctor Information',
                    style: semiBoldBlack16,
                  ),
                  smallSpace4,
                  GetBuilder<DoctorsController>(
                    init: doctorController,
                    initState: (state) async {
                      await doctorController
                          .getDoctorById(Get.arguments["doctorId"]);
                    },
                    builder: (GetxController controller) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.h, vertical: 18.h),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                              child: Image.network(
                                "${ApiConstances.baseUrl}/${doctorController.doctor?.user?.image}",
                                width: 80.h,
                                height: 80.h,
                                errorBuilder: (context, errorrz, stackTrace) {
                                  return Image.asset(
                                    defaultProfile,
                                    width: 80.h,
                                    height: 80.h,
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
                                  doctorController.doctor?.user?.name ?? "",
                                  style: semiBoldBlack16,
                                ),
                                smallSpace4,
                                Row(
                                  children: [
                                    Text(
                                        doctorController
                                                .doctor?.specialization?.name ??
                                            "",
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
                                      doctorController.doctor?.hospital ?? "",
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
                                      doctorController
                                              .doctor?.rating?.averageRating
                                              .toString() ??
                                          "",
                                      style: smallNormalGrey,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      doctorController
                                              .doctor?.rating?.numberOfReviews
                                              .toString() ??
                                          "",
                                      style: smallNormalGrey,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
