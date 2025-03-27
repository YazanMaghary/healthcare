import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class ChatController extends GetxController {
  final db = FirebaseFirestore.instance;
  final TextEditingController textFieldController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  // final String doctorId = Get.arguments["doctorId"];
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> lastChat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> lastChatFilter = <Map<String, dynamic>>[].obs;
  // List<String> name = [];
  bool isEmojiPickerVisible = false; // To toggle emoji keyboard

  void scrollDown() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> fetchData(String doctorId) async {
    // print("Fetch Data");

    db
        .collection("users")
        .doc(box?.read("User").email)
        .collection(doctorId)
        .orderBy("time", descending: false)
        .snapshots()
        .listen(
      (snapshots) {
        messages.value = snapshots.docs.map(
          (doc) {
            return doc.data();
          },
        ).toList();

        if (messages.isNotEmpty) {
          messages.removeLast();
        }

        // print("Fetch Data");
        // print("${messages.value}");
        // print("Data Fetched successfully");
        scrollDown();
      },
    );
  }

  Future<void> fetchData3(List doctorsList) async {
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
          // print("object");

          lastChat.add(value.data()!);
          lastChatFilter.add(value.data()!);
          // print(lastChat[0]);
          // Prints the document data
        } else {
          print("Document 'lastChat' does not exist.");
        }
      });
      lastChat.sort(
          (a, b) => (b["time"] as Timestamp).compareTo(a["time"] as Timestamp));

      update();
      // print(lastChat.length);
    }
  }

  void handleSearch(String input) {
    lastChatFilter.clear();
    print("object");
    for (var i = 0; i < lastChat.length; i++) {
      if (lastChat[i]['doctorName']
          .toLowerCase()
          .contains(input.toLowerCase())) {
        lastChatFilter.add(lastChat[i]);
        print("Result");
        print(lastChatFilter);
      } else {
        // doctorsListFilter.clear();
      }
    }
    update();
  }
  // void fetchData2(List<String> doctorsId) async {
  //   print("Fetch Data");
  //   for (String doctorId in doctorsId) {
  //     db
  //         .collection("users")
  //         .doc(box?.read("User").email)
  //         .collection(doctorId)
  //         .orderBy("time", descending: false)
  //         .snapshots()
  //         .listen(
  //       (snapshots) {
  //         messages.value = snapshots.docs.map(
  //           (doc) {
  //             print(doc.data());
  //             return doc.data();
  //           },
  //         ).toList();
  //         messages.value.removeLast();
  //         // print("Fetch Data");
  //         // print("${messages.value}");
  //         // print("Data Fetched successfully");
  //         // scrollDown();
  //       },
  //     );
  //   }
  // }

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
