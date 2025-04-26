import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appointment_status_card.dart';
import 'package:intl/intl.dart';

import '../../../controller/appoinment_controller.dart';

class AppointmentCompleted extends StatelessWidget {
  AppointmentCompleted({super.key});
  final appointmentController = Get.find<AppoinmentController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: appointmentController,
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 24.h),
            itemCount: appointmentController.getCompletedList.length,
            itemBuilder: (BuildContext context, int index) {
              return AppointmentStatusCard(
                  image: appointmentController.getCompletedList[index].doctor?.user?.image ??
                      "",
                  appointmentStatues: "Appointment done",
                  specializationName: appointmentController
                          .getCompletedList[index]
                          .doctor
                          ?.specialization
                          ?.name ??
                      "",
                  doctorName: appointmentController.getCompletedList[index].doctor?.user?.name ??
                      "",
                  statusColor: smallnormallgreen12,
                  date: DateFormat('EEE, d MMMM ').format(
                      appointmentController.getCompletedList[index].dateTime!.date ??
                          DateTime.now()),
                  time: appointmentController.getCompletedList[index].dateTime!.time ??
                      "8:00 AM",
                  review: appointmentController.getCompletedList[index].doctor
                          ?.rating?.numberOfReviews
                          .toString() ??
                      "4,724",
                  rating: appointmentController.getCompletedList[index].doctor?.rating?.averageRating.toString() ?? "4.5");
            },
          );
        });
  }
}
