import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appointment_status_card.dart';
import 'package:intl/intl.dart';

class AppointmentCancelled extends StatelessWidget {
  AppointmentCancelled({super.key});
  final appointmentController = Get.find<AppoinmentController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: appointmentController,
        builder: (context) {
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 24.h),
            itemCount: appointmentController.getCancelledList.length,
            itemBuilder: (BuildContext context, int index) {
              return AppointmentStatusCard(
                  appointmentStatues: "Appointment cancelled",
                  specializationName: appointmentController
                          .getCancelledList[index]
                          .doctor
                          ?.specialization
                          ?.name ??
                      "",
                  doctorName: appointmentController.getCancelledList[index].doctor?.user?.name ??
                      "",
                  statusColor: smallNormalRed12,
                  date: DateFormat('EEE, d MMMM ').format(
                      appointmentController.getCancelledList[index].dateTime!.date ??
                          DateTime.now()),
                  time: appointmentController.getCancelledList[index].dateTime!.time ??
                      "8:00 AM",
                  image: appointmentController.getCancelledList[index].doctor?.user?.image ??
                      "",
                  review: appointmentController.getCancelledList[index].doctor
                          ?.rating?.numberOfReviews
                          .toString() ??
                      "4,724",
                  rating: appointmentController.getCancelledList[index].doctor?.rating?.averageRating.toString() ?? "4.5");
            },
          );
        });
  }
}
