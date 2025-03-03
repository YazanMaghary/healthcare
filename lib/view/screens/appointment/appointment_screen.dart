import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/screens/appointment/appointment_cancelled.dart';
import 'package:healthcare/view/screens/appointment/appointment_completed.dart';
import 'package:healthcare/view/screens/appointment/appointment_upcoming.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(
          title: "My Appointment",
          tranparent: true,
          leadingWidget: AppBarButton(
              color: Colors.black,
              onTap: () {
                Get.offAllNamed("/MainAppScreen", arguments: 0);
              },
              icon: Icons.chevron_left,
              margin: EdgeInsets.only(left: 16.w)),
          actions: [
            AppBarButton(
                color: Colors.black,
                onTap: () {
                  Get.toNamed("/SettingScreen");
                },
                icon: Icons.search,
                margin: EdgeInsets.only(right: 16.w))
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              mediumSpace20,
              TabBar(unselectedLabelColor: greyColor,labelStyle: largeBoldBlue14,
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
              const Expanded(
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

