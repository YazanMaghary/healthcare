import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/view/components/booking_stage.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/text_button.dart';

import '../../../core/utils/app_constanses.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),automaticallyImplyLeading: false,
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
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
        title: const Text(
          'Book Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          buttonText: 'Continue',
          onPressed: () {
            Get.offAllNamed('/BookingPay');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mediumSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.h,
                  ),
                  BookingStage(
                    stageName: 'Date & Time',
                    stageNum: '1',
                    style: smallNormal,
                    backgroundColor: primaryColor,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  BookingStage(
                    stageName: 'Payment',
                    stageNum: '2',
                    style: smallNormalGrey,
                    backgroundColor: greyColor2,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  BookingStage(
                    stageName: 'Summary',
                    stageNum: '3',
                    style: smallNormalGrey,
                    backgroundColor: greyColor2,
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                ],
              ),
              largeSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Date',
                    style: semiBoldBlack16,
                  ),
                  CustumTextButton(
                    title: 'Set Manual',
                    onTap: () {},
                  )
                ],
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
