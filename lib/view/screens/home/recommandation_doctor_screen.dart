import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/screens/home/sort_screen.dart';

class RecommandationDoctorScreen extends GetView {
  RecommandationDoctorScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  final DoctorsController doctorsController = Get.put(DoctorsController());

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
                    onChanged: doctorsController.handleSearch,
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
            GetBuilder(
              init: doctorsController,
              builder: (GetxController controller) {
                return Expanded(
                    child: ListView.separated(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  itemCount: doctorsController.doctorsListFilter.length,
                  separatorBuilder: (context, index) {
                    return mediumSpace20;
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/Doctordetails',
                            arguments: {"index": index});
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
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: doctorsController
                                                    .doctorsListFilter[index]
                                                    .user
                                                    ?.image !=
                                                null
                                            ? NetworkImage(
                                                "${ApiConstances.baseUrl}/${doctorsController.doctorsListFilter[index].user?.image}")
                                            : const AssetImage(defaultProfile)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.r))),
                                width: 110.w,
                                height: 110.w,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 150.w,height: 25.h,
                                    child: Text(
                                      doctorsController
                                          .doctorsListFilter[index].user!.name!,overflow: TextOverflow.ellipsis,
                                      style: semiBoldBlack18,
                                    ),
                                  ),
                                  smallSpace4,
                                  Row(
                                    children: [
                                      Text(
                                        doctorsController
                                            .doctorsListFilter[index]
                                            .specialization!
                                            .name!,
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
                                        doctorsController
                                            .doctorsListFilter[index].hospital!,
                                        style: smallNormalGrey,
                                      )
                                    ],
                                  ),
                                  smallSpace4,
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
                                        "${doctorsController.doctorsListFilter[index].rating?.averageRating}",
                                        style: smallNormalGrey,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "${doctorsController.doctorsListFilter[index].rating?.numberOfReviews}",
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
                ));
              },
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
