import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/model/appoinment_model.dart';
import 'package:intl/intl.dart';
import '../../components/custom_appBar_icon.dart';

// ignore: must_be_immutable
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final AppoinmentController appoinmentController =
      Get.put<AppoinmentController>(AppoinmentController());
  List<Appoinment> dateFilter = [];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppoinmentController>(
        init: appoinmentController,
        initState: (state) async {
          dateFilter.clear();
          if (dateFilter.length != 0) {
            dateFilter.clear();
          }
          await appoinmentController.fetchAppoinments();

          appoinmentController.getUpComingList.forEach(
            (element) {
              if (element.dateTime?.date != null &&
                  element.dateTime!.date!.difference(DateTime.now()).inDays >=
                      0) {
                dateFilter.add(element);
              } else {}
            },
          );

          dateFilter.sort((a, b) {
            if (a.dateTime?.date != null && b.dateTime?.date != null) {
              return a.dateTime!.date!.compareTo(b.dateTime!.date!);
            }
            if (a.dateTime?.date == null) return 1;
            if (b.dateTime?.date == null) return -1;
            return 0;
          });
        },
        builder: (context) {
          return Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: scaffoldBackgroundColor,
              surfaceTintColor: scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarIcon(
                    onTap: () {
                      Get.offNamed('/MainAppScreen');
                    },
                  ),
                  Text(
                    'Notification',
                    style: semiBoldBlack18,
                  ),
                ],
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: dateFilter.length,
              itemBuilder: (context, index) {
                final item = dateFilter[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upcoming Appointment',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Your next appointment is in\t\t${item.dateTime?.date?.difference(DateTime.now()).inDays}\tdays",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        DateFormat('d, MMM, yyyy')
                            .format(DateTime.parse("${item.dateTime?.date}")),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}

// Future<void> showNot() async {
//     List<Appoinment> dateFilter = [];
//     final AppoinmentController appoinmentController =
//         Get.put<AppoinmentController>(AppoinmentController());
//     await appoinmentController.fetchAppoinments();
//     for (var index = 0;
//         index < appoinmentController.getUpComingList.length;
//         index++) {
//       if (appoinmentController.getUpComingList[index].dateTime?.date != null &&
//           appoinmentController.getUpComingList[index].dateTime!.date!
//                   .difference(DateTime.now())
//                   .inDays >=
//               0) {
//         dateFilter.add(appoinmentController.getUpComingList[index]);
//       } else {}
//     }
//     dateFilter.sort(
//       (a, b) {
//         if (a.dateTime?.date != null && b.dateTime?.date != null) {
//           return a.dateTime!.date!.compareTo(b.dateTime!.date!);
//         }
//         if (a.dateTime?.date == null) return 1;
//         if (b.dateTime?.date == null) return -1;
//         return 0;
//       },
//     );
//     NotificationServices().showNotification(
//         id: 1,
//         title: "Upcoming Notification",
//         body:
//             "Remaining ${dateFilter.first.dateTime!.date!.difference(DateTime.now()).inDays} days for you next appointmnet");
//   }
