import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:intl/intl.dart';

class AppointmentUpcoming extends StatelessWidget {
  AppointmentUpcoming({super.key});
  final appoinmentController =
      Get.put<AppoinmentController>(AppoinmentController());
  final doctorController = Get.find<DoctorsController>();
  //Here Set Data For Upcoming
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: appoinmentController,
      builder: (GetxController controller) {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 24.h),
          itemCount: appoinmentController.getUpComingList.length,
          itemBuilder: (BuildContext context, int index) {

            return Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(bottom: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //doctor image and  doctor deetails
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            child: Image.network(
                              "${ApiConstances.baseUrl}/${appoinmentController.getUpComingList[index].doctor?.user?.image}",
                              width: 80.w,
                              height: 80.w,
                              errorBuilder: (context, errorrz, stackTrace) {
                                return Image.asset(
                                  defaultProfile,
                                  width: 80.w,
                                  height: 80.w,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                height: 20.h,
                                child: Text(
                                  "${appoinmentController.getUpComingList[index].doctor?.user?.name}",
                                  style: semiBoldBlack16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              smallSpace4,
                              Text(
                                "${appoinmentController.getUpComingList[index].doctor?.specialization?.name}",
                                style: smallNormalGrey12,
                              ),
                              smallSpace4,
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: DateFormat('EEE, d MMMM ').format(
                                          appoinmentController
                                              .getUpComingList[index]
                                              .dateTime!
                                              .date!),
                                      style: smallNormalGrey12,
                                    ),
                                    TextSpan(
                                      text:
                                          " | ${appoinmentController.getUpComingList[index].dateTime!.time!}",
                                      style: smallNormalGrey12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      //icons messages
                      InkWell(onTap: () {}, child: Image.asset(messageText))
                    ],
                  ),

                  smallSpace16,
                  divider,
                  smallSpace16,
                  // buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appoinmentController.isButtonEnabled
                          ? SizedBox(
                              width: 140.w,
                              height: 38.h,
                              child: MaterialButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.w),
                                  side: const BorderSide(color: primaryColor),
                                ),
                                onPressed: () async {
                                 
                                  appoinmentController
                                      .changeCancelledButtonState();
                                  await appoinmentController
                                      .changeAppointmentStatus(
                                          "${appoinmentController.getUpComingList[index].id}",
                                          "CANCELLED")
                                      .whenComplete(
                                    () async {
                                      appoinmentController.getUpComingList
                                          .removeAt(index);
                                      await appoinmentController
                                          .fetchAppoinments();
                                      appoinmentController
                                          .changeCancelledButtonState();
                                    },
                                  );
                                },
                                child: Text(
                                  "Cancel Appointment",
                                  overflow: TextOverflow.ellipsis,
                                  style: smallboldblue12,
                                ),
                              ))
                          : SizedBox(
                              width: 140.w,
                              height: 35.h,
                              child: const Center(
                                  child: CircularProgressIndicator())),
                      SizedBox(
                        width: 140.w,
                        height: 38.h,
                        child: MaterialButton(
                          color: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.w),
                            side: const BorderSide(color: primaryColor),
                          ),
                          onPressed: () async {
                            await doctorController.getDoctorById(
                                appoinmentController
                                    .getUpComingList[index].doctor!.id!);
                            Get.toNamed('/RescheduleScreen', arguments: {
                              "id": appoinmentController
                                  .getUpComingList[index].id,
                              "doctorId": appoinmentController
                                      .getUpComingList[index].doctor?.id ??
                                  ""
                            });
                          },
                          child: Text(
                            "Reschedule",
                            style: semiBoldWhite12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
