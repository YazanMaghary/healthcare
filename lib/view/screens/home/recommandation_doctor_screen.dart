import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/screens/home/sort_screen.dart';

class RecommandationDoctorScreen extends StatefulWidget {
  const RecommandationDoctorScreen({super.key});

  @override
  State<RecommandationDoctorScreen> createState() =>
      _RecommandationDoctorScreenState();
}

class _RecommandationDoctorScreenState
    extends State<RecommandationDoctorScreen> {
  List<String> imagesPath = [
    'assets/images/listviewItem1.png',
    'assets/images/listviewItem2.png',
    'assets/images/listviewItem3.png',
    'assets/images/listviewItem1.png',
    'assets/images/listviewItem2.png',
    'assets/images/listviewItem3.png',
    'assets/images/listviewItem1.png',
    'assets/images/listviewItem2.png',
    'assets/images/listviewItem3.png',
  ];
  List<String> doctorName = [
    'Dr.Randy Morton',
    'Dr.YazanM',
    'Dr.Hamdan Khattab',
    'Dr.Jameel Awoda',
    'Dr.Solimann Rami',
    'Dr.Mike Ahmed',
    'Dr.Jehad ELTaweel',
    'Dr.YazanR',
    'Dr.Anas Khrad',
  ];

  final TextEditingController _controller = TextEditingController();
  List<String> resultName = [];
  List<String> resultImage = [];
  void handleSearch(String input) {
    resultName.clear();
    resultImage.clear();
    for (var i = 0; i < doctorName.length; i++) {
      if (doctorName[i].toLowerCase().contains(input.toLowerCase())) {
        resultName.add(doctorName[i]);
        resultImage.add(imagesPath[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        surfaceTintColor: scaffoldBackgroundColor,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed('/MainAppScreen');
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
        title: Text('Recommendation Doctor', style: semiBoldBlack18),
        actions: [
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
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            mediumSpace20,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: handleSearch,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: Image.asset(searchImage),
                      fillColor: Colors.grey[100],
                      filled: true,
                      hintStyle: const TextStyle(
                          color: searchBackground, fontSize: 18),
                      hintText: 'search',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      size: 30,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color(0xffF5F5F5),
                        context: context,
                        builder: (BuildContext context) {
                          return SortScreen(
                            onPressed: () {
                              Get.back();
                            },
                          );
                        },
                      );
                    }),
              ],
            ),
            mediumSpace20,
            Expanded(
              child: resultName.isEmpty && resultImage.isEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      itemCount: imagesPath.length,
                      separatorBuilder: (context, index) {
                        return mediumSpace20;
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.offNamed('/Doctordetails');
                          },
                          child: Material(
                            shadowColor: greyBackground,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(imagesPath[index]),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctorName[index],
                                        style: semiBoldBlack18,
                                      ),
                                      smallSpace,
                                      Row(
                                        children: [
                                          Text(
                                            'General',
                                            style: smallNormalGrey,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            '|',
                                            style: smallNormalGrey,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            'RSUD Gatot Subroto',
                                            style: smallNormalGrey,
                                          )
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
                                            width: 4.w,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      itemCount: resultName.length,
                      separatorBuilder: (context, index) {
                        return mediumSpace20;
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.offNamed('/Doctordetails');
                          },
                          child: Material(
                            shadowColor: greyBackground,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(resultImage[index]),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        resultName[index],
                                        style: semiBoldBlack18,
                                      ),
                                      smallSpace,
                                      Row(
                                        children: [
                                          Text(
                                            'General',
                                            style: smallNormalGrey,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            '|',
                                            style: smallNormalGrey,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            'RSUD Gatot Subroto',
                                            style: smallNormalGrey,
                                          )
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
                                            width: 4.w,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // Shimmer(child: Container(width: 200,height: 50,color: Colors.black,child: Text("data"),),enabled: true, gradient: LinearGradient(colors: [
            //   Colors.red,
            //   Colors.black,
            // ]))
          ],
        ),
      ),
    );
  }
}
