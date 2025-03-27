import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/text_button.dart';

class RescheduleScreen extends StatefulWidget {
  const RescheduleScreen({super.key});

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  int _selectedIndex = 1;
  int _selectedDay = 1;

  List<String> days = [
    "Sat\n08",
    "Sun\n09",
    "Mon\n10",
    "Tue\n11",
    "Wed\n12",
    "Thu\n12",
    "Fri\n12",
  ];

  final ScrollController _scrollController = ScrollController();
  void scrolLeft() {
    if (_selectedDay > 0) {
      setState(() {
        _selectedDay--;
      });
      _scrollToIndex(_selectedDay);
    }
  }

  void scrolRight() {
    if (_selectedDay < days.length - 1) {
      setState(() {
        _selectedDay++;
      });

      _scrollToIndex(_selectedDay);
    }
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 80.0, // Adjust based on item width
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          tranparent: true,
          title: "Reschedule",
          leadingWidget: AppBarButton(
              onTap: () {
                Get.back();
              },
              icon: Icons.chevron_left,
              margin: EdgeInsets.only(left: 16.w))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          buttonText: 'Reschedule',
          onPressed: () {
            Get.toNamed("/AppointmentRescheduleScreen");
          },
        ),
      ),
      body: Padding(
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
                          lastDate: DateTime(2050));
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
                          scrolLeft();
                          print(_selectedDay);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 24.w,
                        )),
                    Expanded(
                      child: ListView.builder(
                        itemCount: days.length,
                        controller: _scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // if _selectedIndex == index then isSelected true
                          bool isSelected = _selectedDay == index;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectedIndex = index;
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    color: isSelected
                                        ? primaryColor
                                        : searchBackground,
                                  ),
                                  width: isSelected ? 60.w : 45.w,
                                  height: isSelected ? 75.h : 60.h,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.w, horizontal: 8.h),
                                  child: Text(
                                    days[index],
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
                          scrolRight();
                          print(_selectedDay);
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
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3),
                itemBuilder: (context, index) {
                  return Container(
                    height: 20.h,
                    width: 20.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: index != 1 ? silverColor : primaryColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                    child: Text(
                      '08:00 AM',
                      style: index != 1 ? semiBoldGrey14 : semiBoldWhite14,
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
                value: _selectedIndex,
                title: Row(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/inPerson.png')),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('In Person'),
                  ],
                ),
                groupValue: 1,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              Divider(
                indent: 20.w,
                endIndent: 20.w,
              ),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: primaryColor,
                value: _selectedIndex,
                title: Row(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/vedioCall.png')),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('Vedio Call'),
                  ],
                ),
                groupValue: 2,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              Divider(
                indent: 20.w,
                endIndent: 20.w,
              ),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: primaryColor,
                value: _selectedIndex,
                title: Row(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/phoneCall.png')),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('Phone Call'),
                  ],
                ),
                groupValue: 3,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
