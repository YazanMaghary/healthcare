import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/custom_card.dart';
import 'package:healthcare/view/screens/home/doctor_speciaity.dart';
import 'package:healthcare/view/screens/home/notifications_screen.dart';
import 'package:healthcare/view/screens/home/recommandation_doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagesPath = [
    'assets/images/listviewItem1.png',
    'assets/images/listviewItem2.png',
    'assets/images/listviewItem3.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: scaffoldBackgroundColor,
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Momon!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'How Are you Today?',
                style: smallNormal1,
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.off(
                () => const NotificationsScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: greyBackground,
                shape: BoxShape.circle,
              ),
              child: Stack(children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                ),
                Positioned(
                  left: 16,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                )
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
          
              box?.remove("Token");
              Get.offNamed(
                '/LoginScreen',
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: greyBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout_rounded,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 250,
                child: Stack(children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 30,
                    bottom: 0,
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Book and \nschedule with \nnearest doctor',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              mediumSpace,
                              ElevatedButton(
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16),
                                  child: Text(
                                    'Find Nearby',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      nurseImage,
                      fit: BoxFit.contain,
                    ),
                  )
                ]),
              ),
              mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Doctor Speciality',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'See All',
                            style: const TextStyle(
                                color: primaryColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.off(
                                  () => const DoctorSpeciality(),
                                  transition: Transition.rightToLeft,
                                );
                              }),
                      ],
                    ),
                  ),
                ],
              ),
              smallSpace,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  mySpeciailtyCard(
                    speciailtyImagePath: 'assets/images/General.png',
                    speciailtyType: 'General',
                  ),
                  mySpeciailtyCard(
                    speciailtyImagePath: 'assets/images/ENT.png',
                    speciailtyType: 'Neurologic',
                  ),
                  mySpeciailtyCard(
                    speciailtyImagePath: 'assets/images/Pediatric.png',
                    speciailtyType: 'Pediatric',
                  ),
                  mySpeciailtyCard(
                    speciailtyImagePath: 'assets/images/Urologist.png',
                    speciailtyType: 'Radiology',
                  ),
                ],
              ),
              mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommendation Doctor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'See All',
                            style: const TextStyle(
                                color: primaryColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.off(
                                  () => const RecommandationDoctorScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              }),
                      ],
                    ),
                  ),
                ],
              ),
              smallSpace,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                itemCount: imagesPath.length,
                separatorBuilder: (context, index) {
                  return smallSpace;
                },
                itemBuilder: (context, index) {
                  return Row(
                    key: ValueKey(index),
                    children: [
                      Image.asset(imagesPath[index]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dr. Randy Wigham',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          smallSpace,
                          const Row(
                            children: [
                              Text('General'),
                              SizedBox(
                                width: 8,
                              ),
                              Text('|'),
                              SizedBox(
                                width: 8,
                              ),
                              Text('RSUD Gatot Subroto')
                            ],
                          ),
                          smallSpace,
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: starsColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.8',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '(4,279 reviews)',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
