import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/screens/appointment/appointment_cancelled.dart';
import 'package:healthcare/view/screens/appointment/appointment_completed.dart';
import 'package:healthcare/view/screens/appointment/appointment_upcoming.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
  final appoinmetnController =
      Get.put<AppoinmentController>(AppoinmentController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(
          title: "My Appointment",
          tranparent: true,
         
          
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              mediumSpace20,
              TabBar(
                  unselectedLabelColor: greyColor,
                  labelStyle: largeBoldBlue14,
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      child: const Text(
                        "Upcoming",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      child: const Text(
                        "Completed",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      child: const Text(
                        "Cancelled",
                      ),
                    ),
                    //make color change when enabled and disabled
                  ]),
              largeSpace,
              Expanded(
                child: TabBarView(children: [
                  AppointmentUpcoming(), //make each widget in seprated class
                  AppointmentCompleted(),
                  AppointmentCancelled(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
