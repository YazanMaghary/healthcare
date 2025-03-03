import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appointment_status_card.dart';

class AppointmentCompleted extends StatelessWidget {
  const AppointmentCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return AppointmentStatusCard(
          appointmentStatues: "Appointment done",statusColor: smallnormallgreen12,
        );
      },
    );
  }
}
