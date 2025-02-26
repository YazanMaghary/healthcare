import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/datasource/user_data_source.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  File? image;
 

  final UserDataSource userDataSource = UserDataSource();
  final ImagePicker _picker = ImagePicker();
  

  Future<void> updateUserProfile({String? name, String? phone}) async {
    final result = await userDataSource.updateUserProfile({
      "name": name!,
      "phone": phone!,
    });
    result.fold((failure) {
      failureWidget('Error', failure);
    }, (success) {
      successfullyWidget("Done", "User updated successfully");
      Get.offAllNamed("/MainAppScreen");
    });
  }
  // Future<User> getUserData() async {
  //   final result = await AuthDataSource().getMe();
  //   User? user;

  //   result.fold((failure) {
  //     failureWidget('Error', failure);
  //   }, (success) {
  //     user = success;
  //   });
  //   return user!;
  // }
  // Future<void> updateUserData(String? name, String? phone) async {
  //   UserDataSource userDataSource = UserDataSource();
  //   final result =
  //       await userDataSource.updateUserData({"name": name, "phone": phone ,"image" : null});
  //   result.fold((failure){
  //     failureWidget("Error", failure);
  //   },(success){
  //     print("User updated Successfully");
  //   });
  // }

  void pickImage() async {
    Get.bottomSheet(
      backgroundColor: scaffoldBackgroundColor,
      Container(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Choose From", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: primaryColor,
              ),
              title: const Text("Camera"),
              onTap: () async {
                await _pickImageFrom(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo,
                color: primaryColor,
              ),
              title: const Text("Gallery"),
              onTap: () async {
                await _pickImageFrom(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFrom(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1024.h, // Reduce image size
        maxHeight: 1024.h,
        imageQuality: 85, // Compress image
      );

      if (pickedFile != null) {
        image = File(pickedFile.path);
        // print('Image picked successfully');
        // print('Image path: ${image?.path}');
        // print('Image size: ${await image?.length()} bytes');
      }
      Get.back(); // Close the bottom sheet
      update();
    } catch (e) {
      print('Error picking image: $e');
      failureWidget("Error", e.toString());
    }
  }

  Future<void> updateUserProfileWithImage(
      String? name, String? phone, File? file, bool logedIn) async {
    if (file == null) {
      failureWidget("Error", "Please select an image");
      return;
    }

    try {
      // Only pass name and phone in the data map
      final Map<String, dynamic> userData = {
        if (name != null && name.isNotEmpty) 'name': name,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
      };

      // print('Updating profile with:');
      // print('Name: $name');
      // print('Phone: $phone');
      // print('Image path: ${file.path}');
      // print('Image exists: ${await file.exists()}');
      // print('Image size: ${await file.length()} bytes');

      final result = await userDataSource.updateUserProfileWithImage(
          userData, file.path, logedIn);

      result.fold(
        (failed) {
          failureWidget("Error", failed);
        },
        (success) {
          successfullyWidget(
            'Success',
            'Profile updated successfully',
          );
          if (logedIn == true) {
            Get.offAllNamed("/MainAppScreen");
          } else {
            Get.offAllNamed("/LoginScreen");
          }
        },
      );
    } catch (e) {
      print('Error in updateUserProfile: $e');
      failureWidget("Error", "An unexpected error occurred");
    }
  }

  @override
  void onClose() {
    image = null;
    super.onClose();
  }
}
