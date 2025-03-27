import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/chat_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:intl/intl.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({super.key});
  final chatController = Get.put<ChatController>(ChatController());
  final doctorController = Get.find<DoctorsController>();
  // List<String> chats = [];
  // To toggle emoji keyboard
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      initState: (state) async {
        await chatController.fetchData(Get.arguments['doctorId']);
      },
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xffF8F9FD),
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                Text(
                    Get.arguments != null &&
                            Get.arguments.containsKey("doctorName")
                        ? Get.arguments["doctorName"]
                        : "Unknown",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Text("Online",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(child: Obx(
                // Stram Builder replacing
                () {
                  print("test");
                  return ListView.separated(
                    controller: controller.scrollController,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.messages.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemBuilder: (BuildContext context, int index) {
                      var msg = controller.messages[index];
                      // chats = msg['message'];
                      print(msg);
                      Timestamp timestamp = msg["time"];
                      DateTime dateTime = timestamp.toDate();
                      String formattedDate = DateFormat.jm().format(dateTime);
                      return Column(
                        crossAxisAlignment:
                            box?.read("User").name == msg['name']
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    bottomLeft: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                                color: box?.read("User").name == msg['name']
                                    ? primaryColor
                                    : scaffoldBackgroundColor),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 10.w),
                            child: Text(
                              "${msg["message"]}",
                              style: box?.read("User").name == msg['name']
                                  ? smallNormalWhite14
                                  : smallNormalBlack14,
                            ),
                          ),
                          smallSpace4,
                          Text(
                            formattedDate,
                            style: smallNormalGrey12,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 12.h),
                  );
                },
              )),

              // Emoji Picker
              if (controller.isEmojiPickerVisible)
                SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      controller.textFieldController.text += emoji.emoji;
                    },
                  ),
                ),

              // Chat Input Field
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.emoji_emotions_outlined, size: 24),
                      onPressed: () {
                        if (FocusNode().hasFocus) {
                          FocusScope.of(context).unfocus();
                        } else {
                          // FocusNode().attach(context).p
                        }
                        // Hide keyboard

                        controller.isEmojiPickerVisible =
                            !controller.isEmojiPickerVisible;
                        (context as Element).markNeedsBuild(); // Refresh UI
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.textFieldController,
                        onTap: () {
                          controller.isEmojiPickerVisible =
                              false; // Hide emoji picker when typing
                          // (context as Element).markNeedsBuild();
                        },
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () async {
                        if (controller.textFieldController.text.isNotEmpty) {
                          // chatController.scrollDown();

                          await controller
                              .sendMessage(
                                  hospitalName: Get.arguments['hospitalName'],
                                  imagePath: Get.arguments["imagePath"],
                                  doctorId: Get.arguments["doctorId"],
                                  name: box?.read("User").name,
                                  specilaizationName:
                                      Get.arguments["specilaizationName"],
                                  doctorName: Get.arguments["doctorName"],
                                  message: controller.textFieldController.text,
                                  time: Timestamp.now())
                              .whenComplete(
                            () {
                              controller.textFieldController.clear();
                            },
                          );

                          await controller
                              .fetchData3(doctorController.doctorsList);
                          // controller.lastChat[Get.arguments["index"]] = {
                          //   "message": controller.textFieldController.text,
                          //   "time": Timestamp.now(),
                          //   "name": box?.read("User").name,
                          //   "doctorName": Get.arguments["doctorName"],
                          //   "imagePath": Get.arguments["imagePath"],
                          //   "specilaizationName": Get.arguments["specilaizationName"],
                          //   "hospitalName":Get.arguments['hospitalName'],
                          //   "doctorId": Get.arguments["doctorId"],
                          // };
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
