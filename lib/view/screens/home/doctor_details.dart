import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
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
              style: semiBoldBlack18,
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
            padding: const EdgeInsets.all(32.0),
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
                      style: semiBoldBlack18,
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
            unselectedLabelStyle: semiBoldBlack16,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            labelStyle: semiBoldBlack16,
            indicatorSize: TabBarIndicatorSize.values.first,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Placeholder',
              ),
              Tab(text: 'Placeholder'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(
                  child: Text('Content of Page 1'),
                ),
                Center(
                  child: Text('Content of Page 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
