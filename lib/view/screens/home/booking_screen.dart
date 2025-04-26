import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';

import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/text_button.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final appointmentController =
      Get.put<AppoinmentController>(AppoinmentController());
  String date = "";
  @override
  Widget build(BuildContext context) {
    appointmentController.availableDate();
    appointmentController.availableTime("4:00");
    return Scaffold(
      appBar: appBar(
          tranparent: true,
          title: "Book Appointment",
          leadingWidget: AppBarButton(
              onTap: () {
                Get.back();
              },
              icon: Icons.chevron_left,
              margin: EdgeInsets.only(left: 16.w))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          buttonText: 'Continue',
          onPressed: () async {
            Get.offNamed("BookingPay", arguments: {
              "doctorId": Get.arguments["doctorId"],
              "dateTime": appointmentController
                  .allweekDays[appointmentController.selectedDay]
                  .toString(),
              "time": appointmentController
                  .availableTimes[appointmentController.selectedTimes],
              "type": appointmentController.typeSelected
            });
          },
        ),
      ),
      body: GetBuilder(
          init: appointmentController,
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Date',
                          style: semiBoldBlack16,
                        ),
                        CustumTextButton(
                          title: 'Set Manual',
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2050))
                                .then(
                              (value) {
                                if (value != null) {
                                  DateTime dateTime = DateTime.parse("$value");
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(dateTime);
                                  //get Date Formated as 2025-04-10
                                  date = formattedDate;
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    mediumSpace24,
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: 65.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                appointmentController.scrolLeft();
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: 24.w,
                              )),
                          Expanded(
                            child: ListView.builder(
                              itemCount: appointmentController.weekDays.length,
                              controller:
                                  appointmentController.scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // if _selectedIndex == index then isSelected true
                                bool isSelected =
                                    appointmentController.selectedDay == index;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        appointmentController.selectedIndex =
                                            index;
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.r)),
                                          color: isSelected
                                              ? primaryColor
                                              : searchBackground,
                                        ),
                                        width: isSelected ? 60.w : 45.w,
                                        height: isSelected ? 75.h : 60.h,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.w, horizontal: 8.h),
                                        child: Text(
                                          "${appointmentController.weekDays[index]}\n${appointmentController.weekDaysDate[index]}",
                                          textAlign: TextAlign.center,
                                          style: isSelected
                                              ? semiBoldWhite14
                                              : smallboldGrey12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                appointmentController.scrolRight();
                              },
                              child: Icon(
                                Icons.chevron_right,
                                size: 24.w,
                              ))
                        ],
                      ),
                    ),
                    largeSpace,
                    Text(
                      'Available time',
                      style: semiBoldBlack16,
                    ),
                    mediumSpace20,
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: appointmentController.availableTimes.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            appointmentController.sellectTime(index);
                          },
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color:
                                    appointmentController.selectedTimes != index
                                        ? silverColor
                                        : primaryColor,
                                borderRadius: BorderRadius.circular(20.r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 16.w),
                            child: Text(
                              appointmentController.availableTimes[index],
                              style:
                                  appointmentController.selectedTimes != index
                                      ? semiBoldGrey14
                                      : semiBoldWhite14,
                            ),
                          ),
                        );
                      },
                    ),
                    largeSpace,
                    Text(
                      'Appointment Type',
                      style: semiBoldBlack16,
                    ),
                    mediumSpace20,
                    RadioListTile(
                      activeColor: primaryColor,
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: appointmentController.selectedIndex,
                      title: Row(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/inPerson.png')),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(appointmentController.type[0]),
                        ],
                      ),
                      groupValue: 1,
                      onChanged: (value) {
                        appointmentController.selectedIndex = 1;
                        appointmentController.typeSelected =
                            appointmentController.type[0];
                        appointmentController.update();
                      },
                    ),
                    Divider(
                      indent: 20.w,
                      endIndent: 20.w,
                    ),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: primaryColor,
                      value: appointmentController.selectedIndex,
                      title: Row(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/vedioCall.png')),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(appointmentController.type[1]),
                        ],
                      ),
                      groupValue: 2,
                      onChanged: (value) {
                        appointmentController.selectedIndex = 2;
                        appointmentController.typeSelected =
                            appointmentController.type[1];
                        appointmentController.update();
                      },
                    ),
                    Divider(
                      indent: 20.w,
                      endIndent: 20.w,
                    ),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: primaryColor,
                      value: appointmentController.selectedIndex,
                      title: Row(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/phoneCall.png')),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(appointmentController.type[2]),
                        ],
                      ),
                      groupValue: 3,
                      onChanged: (value) {
                        appointmentController.selectedIndex = 3;
                        appointmentController.typeSelected =
                            appointmentController.type[2];

                        appointmentController.update();
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
