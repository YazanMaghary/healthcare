import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/screens/home/booking_summary.dart';

class AppointmentRescheduleScreen extends StatefulWidget {
  const AppointmentRescheduleScreen({super.key});

  @override
  State<AppointmentRescheduleScreen> createState() => _AppointmentRescheduleScreenState();
}

class _AppointmentRescheduleScreenState extends State<AppointmentRescheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                 Get.offAll(
                 const BookingSummary(),
                  transition: Transition.leftToRight,
          );
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
        centerTitle: true,
        title:  Text(
          'Details',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(buttonText: 'Done', onPressed: () {
          Get.back();
        },),
      ),
     body: Padding(
       padding: mainPagePading,
       child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
         child: Column(
          children: [
            Column(children: [
               mediumSpace20,
            const Image(image: AssetImage('assets/images/confermdBook.png')),
            mediumSpace20,
            Text(
              'Booking Confirmed' , 
              style: GoogleFonts.inter(fontSize: 20 , fontWeight: FontWeight.w500),),
              largeSpace,
              
            ],),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              Text('Booking has been rescheduled' ,style: semiBoldBlack20, ),
              mediumSpace20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Image(image: AssetImage('assets/images/Date&Time.png')),
                SizedBox(width: 8.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date & Time' ,style: semiBoldBlack14,),
                    Text('Wednesday, 08 May 2023' ,style: smallNormalGrey12,),
                    Text('08.30 AM' ,style: smallNormalGrey12,),
                  ]),
              ],),
              smallSpace,
              const Divider(indent: 10,endIndent: 10,),
              smallSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage('assets/images/AppointmentType.png')),
                  SizedBox(width: 8.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Appointment Type' ,style: semiBoldBlack14,),
                      Text('In Person' ,style: smallNormalGrey12,),
                    ],), 
                    ],),
              smallSpace,
              const Divider(indent: 10,endIndent: 10,),
              mediumSpace20,
              Text('Doctor Information' , style: semiBoldBlack16,),
              smallSpace,
              Padding(
              padding:  EdgeInsets.symmetric(horizontal:  32.h , vertical: 18.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      listviewItem1,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Randy Wigham',
                        style: semiBoldBlack16,
                      ),
                      smallSpace,
                       Row(
                        children: [
                          Text('General' , style:  smallNormalGrey),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('|' , style: smallNormalGrey, ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('RSUD Gatot Subroto' , style: smallNormalGrey,)
                        ],
                      ),
                      smallSpace,
                       Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: starsColor,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4.w
                            ,
                          ),
                          Text(
                            '4.8',
                            style: smallNormalGrey,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '(4,279 reviews)',
                            style: smallNormalGrey,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            
              ],),
            
          ],
         ),
       ),
     ),
    );
  }
}