import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Setting",
          leadingWidget: AppBarButton(
              onTap: () {
                Get.back();
              },
              icon: Icons.chevron_left,
              margin: EdgeInsets.only(left: 16.w))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            SettingWidget(
                onTap: () {
                  Get.toNamed("/notificationSettingScreen");
                },
                imageString: notification,
                title: "Notification",style: smallNormalBlack14,
                trailingWidget:const Icon(Icons.chevron_right)),
            divider,
            SettingWidget(
                onTap: () {},
                imageString: messageQuestion,
                title: "FAQ",style: smallNormalBlack14,
                trailingWidget:const Icon(Icons.chevron_right)),
            divider,
            SettingWidget(
                onTap: () {
                    Get.toNamed("/SecurityScreen");
                },
                imageString: lock,style: smallNormalBlack14,
                title: "Security",
                trailingWidget:const Icon(Icons.chevron_right)),
            divider,
            SettingWidget(
                onTap: () {},
                imageString: languageSquare,style: smallNormalBlack14,
                title: "Language",
                trailingWidget:const Icon(Icons.chevron_right)),
            divider,
            SettingWidget(
                onTap: () {
                  // Show confirmation dialog using GetX
                  Get.dialog(
                    AlertDialog(
                      title: Text("Logout",style: verylargeNormalBlack,),
                      content: Text("You'll need to enter your username \n and password next time \n you want to login.",textAlign: TextAlign.center,style: mediumNormalBlack,),
                      actions: [
                        TextButton(
                          child: Text("Cancel",style: verylargeNormalBlue,),
                          onPressed: () {
                            Get.back(); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: Text("Logout", style: verylargeNormalRed16),
                          onPressed: () {
                            // Add your logout logic here
                            Get.back(); // Close the dialog
                            // Example: Get.offAllNamed("/loginScreen");
                          },
                        ),
                      ],
                    ),
                  );
                },
                imageString: logout, style: largeNormalRed14,
                title: "Logout",
                trailingWidget: const Icon(Icons.chevron_right)),
            divider,
          ],
        ),
      ),
    );
  }
}
