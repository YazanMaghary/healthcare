import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/screens/home/recommandation_doctor_screen.dart';

import '../../../core/utils/app_images.dart';
import '../../components/custom_appBar_icon.dart';

class Doctordetails extends StatefulWidget {
  const Doctordetails({super.key});

  @override
  State<Doctordetails> createState() => _DoctordetailsState();
}

class _DoctordetailsState extends State<Doctordetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Get.offAll(
                  const RecommandationDoctorScreen(),
                  transition: Transition.leftToRight,
                );
              },
            ),
            Text(
              'Dr. Randy Wigham',
              style: semiBold2,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
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
                      style: semiBold3,
                    ),
                    smallSpace,
                     Row(
                      children: [
                        Text('General' , style:  smallNormal2),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('|' , style: smallNormal2, ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('RSUD Gatot Subroto' , style: smallNormal2,)
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
                          style: smallNormal2,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '(4,279 reviews)',
                          style: smallNormal2,
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16),
                  child: Image.asset(messageText),
                )
              ],
            ),
          ),
          TabBar(
            unselectedLabelColor: greyColor,
            unselectedLabelStyle: semiBold8,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            labelStyle: semiBold8,
            indicatorSize: TabBarIndicatorSize.values.first,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'About'
              ),
              Tab(text: 'Review'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
                Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32.h , vertical: 8.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      mediumSpace,
                      Text('About me' , style: semiBold6,),
                      smallSpace,
                       Text(
                        'Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London.',
                        style: semiBold7,
                      ),
                      mediumSpace,
                       Text('Working Time' , style: semiBold6,),
                       smallSpace,
                       Text(
                        'Monday - Friday, 08.00 AM - 20.00 PM',
                        style: semiBold7
                      ),
                      mediumSpace,
                      Text('STR' , style: semiBold6,),
                      smallSpace,
                       Text(
                        '4726482464',
                        style: semiBold7),
                      
                      mediumSpace,
                      Text('Pengalaman Praktik' , style: semiBold6,),                    
                      mediumSpace,
                       const Text('RSPAD Gatot Soebroto' ,                      
                      style: TextStyle(fontSize: 14 ),),
                      smallSpace,
                       Text('2017 - sekarang' ,                      
                      style: semiBold7,),
                    ],),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 32.h),
                  child: ListView.builder(itemBuilder: (context, index) {
                    return  Column(children: [
                      mediumSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const CircleAvatar(
                             radius: 20,
                             backgroundImage:AssetImage('assets/images/reviewPicture.png'),),
                          const SizedBox(width: 8,),
                          Column(
                            children: [
                              Text('Jane Cooper' , style: semiBold3,),
                              smallSpace,
                              const Row(children: [
                                Icon(Icons.star , color: starsColor),
                                Icon(Icons.star , color: starsColor),
                                Icon(Icons.star , color: starsColor),
                                Icon(Icons.star , color: starsColor),
                                Icon(Icons.star , color: starsColor),
                              ],)
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(left: 8.w),
                            child: Text('Today' , style: smallNormal2,),
                          )
                          ],),
                      smallSpace,
                      Padding(
                        padding:  EdgeInsets.only(left: 48.w),
                        child: Text('As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.'
                        ,style: semiBold9,
                        ),
                      )
                    ],);
                  },
                   itemCount: 4),
                )
              ],
            ),
          ),
          mediumSpace,
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.h),
            child: PrimaryButton(buttonText: 'Make An Appointment', onPressed: () {
              
            },),
          ),
          mediumSpace
        ],
      ),
    );
  }
}
