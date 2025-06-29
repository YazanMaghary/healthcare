import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class ChatController extends GetxController {
  final db = FirebaseFirestore.instance;
  final TextEditingController textFieldController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Color sendIconColor = greyColor;
  // final String doctorId = Get.arguments["doctorId"];
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> lastChat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> lastChatFilter = <Map<String, dynamic>>[].obs;
  // List<String> name = [];
  bool isEmojiPickerVisible = false; // To toggle emoji keyboard
  void sendIconColorState() {
    if (textFieldController.text.removeAllWhitespace.isNotEmpty) {
      sendIconColor = primaryColor;
    } else {
      sendIconColor = greyColor;
    }
    update();
  }

  void scrollDown() {
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
      // duration: const Duration(milliseconds: 0),
      // curve: Curves.easeOut,
    );
    // Future.delayed(const Duration(milliseconds: 300), () {
    //   if (scrollController.hasClients) {}
    // });
  }

  Future<void> fetchData(String doctorId) async {
    db
        .collection("users")
        .doc(box?.read("User").email)
        .collection(doctorId)
        .orderBy("time", descending: false)
        .snapshots()
        .listen(
      (snapshots) {
        messages.value = snapshots.docs.where(
          (element) {
            if (element.id == "lastChat") {
              return false;
            } else {
              return true;
            }
          },
        ).map(
          (doc) {
            return doc.data();
          },
        ).toList();

        scrollDown();
      },
    );
  }

  Future<void> lastChatDataFetch(List doctorsList) async {
    lastChat.clear();
    lastChatFilter.clear();

    for (var doctor in doctorsList) {
      await db
          .collection("users")
          .doc(box?.read("User").email)
          .collection(doctor.id!)
          .doc("lastChat")
          .get()
          .then((value) {
        if (value.exists) {
          lastChat.add(value.data()!);
          lastChatFilter.add(value.data()!);
        } else {}
      });
      lastChat.sort(
          (a, b) => (b["time"] as Timestamp).compareTo(a["time"] as Timestamp));
      lastChatFilter.sort(
          (a, b) => (b["time"] as Timestamp).compareTo(a["time"] as Timestamp));

      update();
    }
  }

  void handleSearch(String input) {
    lastChatFilter.clear();

    for (var i = 0; i < lastChat.length; i++) {
      if (lastChat[i]['doctorName']
          .toLowerCase()
          .contains(input.toLowerCase())) {
        lastChatFilter.add(lastChat[i]);
      } else {
        // doctorsListFilter.clear();
      }
    }
    update();
  }

  Future<void> sendMessage(
      {required String doctorId,
      required String name,
      required String doctorName,
      required String message,
      required String hospitalName,
      required String specilaizationName,
      required String imagePath,
      required Timestamp time}) async {
    if (message.isNotEmpty) {
      await db
          .collection("users")
          .doc(box?.read("User").email)
          .collection(doctorId)
          .add({
        "message": message,
        "name": name,
        "time": Timestamp.now(),
      });
      await db
          .collection("users")
          .doc(box?.read("User").email)
          .collection(doctorId)
          .doc("lastChat")
          .set({
        "message": message,
        "name": name,
        "doctorName": doctorName,
        "time": Timestamp.now(),
        "imagePath": imagePath,
        "specilaizationName": specilaizationName,
        "hospitalName": hospitalName,
        "doctorId": doctorId,
      });
    }
  }
}
