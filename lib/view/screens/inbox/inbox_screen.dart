import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/chat_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/message_card_widget.dart';
import 'package:healthcare/view/components/search_widget.dart';
import 'package:healthcare/view/components/shimmer_wdget.dart';
import 'package:intl/intl.dart';

//refactor widget
// ignore: must_be_immutable
class InboxScreen extends GetView {
  InboxScreen({super.key});
  // final db = FirebaseFirestore.instance;
  final chatController = Get.put<ChatController>(ChatController());
  final doctorsController = Get.put<DoctorsController>(DoctorsController());
  final sheetTextController = TextEditingController();
  final textController = TextEditingController();
  final db = FirebaseFirestore.instance;
  List<String> ids = [];
  @override
  Widget build(BuildContext context) {
    // chatController.fetchData("${box?.read("doctorId")}");
    // chatController.fetchData3(doctorsController.doctorsList);
    // doctorsController.doctorsListFilter.forEach((element) {
    //       chatController.fetchData3(element.id!);
    // },);

    // doctorsController.doctorsListFilter.forEach(
    //   (element) {
    //     ids.add(element.id!);
    //   },
    // );
    // chatController.fetchData2(ids);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(
        title: 'Message',
        actions: [
          GetBuilder<DoctorsController>(
              init: doctorsController,
              builder: (controller) {
                return AppBarButton(
                    onTap: () async {
                      // textController.clear();
              
                      Get.bottomSheet(
                        isScrollControlled: true,
                        backgroundColor: scaffoldBackgroundColor,
                        SizedBox(
                          height: Get.height * 0.95,
                          child: Column(
                            children: [
                              SearchWidget(
                                hintText: "Search Message",
                                onChanged: controller.handleSearch2,
                                textController: sheetTextController,
                                // onChanged: contr,
                              ),
                              mediumSpace20,
                              controller.doctorsListFilter2.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemCount: controller
                                            .doctorsListFilter2.length,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                box?.write(
                                                    "doctorId",
                                                    controller
                                                        .doctorsListFilter2[
                                                            index]
                                                        .id);
                                                Get.toNamed("/ChatScreen",
                                                    arguments: {
                                                      "doctorName": controller
                                                          .doctorsListFilter2[
                                                              index]
                                                          .user
                                                          ?.name,
                                                      "doctorId": controller
                                                          .doctorsListFilter2[
                                                              index]
                                                          .id,
                                                      "imagePath": controller
                                                              .doctorsListFilter2[
                                                                  index]
                                                              .user
                                                              ?.image ??
                                                          "",
                                                      "specilaizationName":
                                                          controller
                                                              .doctorsListFilter2[
                                                                  index]
                                                              .specialization
                                                              ?.name,
                                                      "hospitalName": controller
                                                          .doctorsListFilter2[
                                                              index]
                                                          .hospital,
                                                      "index": index,
                                                    });
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color:
                                                                lightgreyColor))),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w,
                                                              vertical: 16.w),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12.r)),
                                                        child: Image.network(
                                                          "${ApiConstances.baseUrl}/${doctorsController.doctorsListFilter2[index].user?.image}",
                                                          width: 50.h,
                                                          height: 50.h,
                                                          errorBuilder:
                                                              (context, errorrz,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              defaultProfile,
                                                              width: 50.h,
                                                              height: 50.h,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .doctorsListFilter2[
                                                                  index]
                                                              .user!
                                                              .name!,
                                                          style:
                                                              semiBoldBlack14,
                                                        ),
                                                        Text(
                                                          "${controller.doctorsListFilter2[index].specialization?.name} | ${controller.doctorsListFilter2[index].hospital}",
                                                          style:
                                                              smallNormalGrey,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator())
                              // ... existing body content ...
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icons.add_box_outlined,
                    margin: EdgeInsets.only(right: 16.w));
              })
        ],
      ),
      body: SafeArea(
        child: GetBuilder<ChatController>(
            init: chatController,
            initState: (state) async {
              await chatController
                  .lastChatDataFetch(doctorsController.doctorsList);
            },
            builder: (controller) {
              return Column(
                children: [
                  SearchWidget(
                    hintText: "Search Message",
                    onChanged: controller.handleSearch,
                    textController: textController,
                  ),
                  mediumSpace20,
                  ListView.builder(
                    itemCount: chatController.lastChatFilter.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: () async {
                        box?.write("doctorId",
                            chatController.lastChatFilter[index]["doctorId"]);
                        Get.toNamed("/ChatScreen", arguments: {
                          "doctorName": chatController.lastChatFilter[index]
                              ["doctorName"],
                          "doctorId": chatController.lastChatFilter[index]
                              ["doctorId"],
                          "imagePath": chatController.lastChatFilter[index]
                                  ["imagePath"] ??
                              "",
                          "specilaizationName": chatController
                              .lastChatFilter[index]["specilaizationName"],
                          "hospitalName": chatController.lastChatFilter[index]
                              ['hospitalName'],
                          "index": index,
                        });
                      }, child: Obx(
                        () {
                          if (chatController.lastChatFilter.isEmpty ||
                              index >= chatController.lastChatFilter.length) {
                            return Center(child: chatShimmerWidgeth());
                          } else {
                            return ChatCardWidget(
                              imagePath: chatController.lastChatFilter[index]
                                          ["imagePath"] !=
                                      ""
                                  ? "${ApiConstances.baseUrl}/${chatController.lastChatFilter[index]["imagePath"]}"
                                  : "",
                              doctorName: chatController.lastChatFilter[index]
                                  ["doctorName"],
                              lastChat:
                                  "${chatController.lastChatFilter[index]['message']}",
                              time: DateFormat.jm().format(chatController
                                  .lastChatFilter[index]['time']
                                  .toDate()),
                              specilaizationName:
                                  "${chatController.lastChatFilter[index]["specilaizationName"]}",
                              hospitalName:
                                  '${chatController.lastChatFilter[index]["hospitalName"]}',
                              drCheck: chatController.lastChatFilter[index]
                                          ['name'] ==
                                      doctorsController
                                          .doctorsListFilter[index].user!.name!
                                  ? true
                                  : false,
                            );
                          }
                        },
                      ));
                    },
                  )

                  // ... existing body content ...
                ],
              );
            }),
      ),
    );
  }
}
