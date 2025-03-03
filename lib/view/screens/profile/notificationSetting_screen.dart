import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/setting_widget.dart';
import 'package:healthcare/view/components/switch_widget.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Notification",
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
                onTap: () {},
                title: "Notification from FIT4U",
                style: largeNormalBlack14,
                trailingWidget: Transform.scale(
                  scale: 0.8,
                  child: SwitchWidget(
                    onChanged: (p0) {
                      p0=true;
                    },
                  ),
                )),
            divider,
            SettingWidget(
                onTap: () {},
                title: "Sound",
                style: largeNormalBlack14,
                trailingWidget:  Transform.scale(scale: 0.8,
                  child: SwitchWidget(
                      onChanged: (p0) {
                        p0=true;
                      },
                    ),
                ),),
            divider,
            SettingWidget(
                onTap: () {},
                style: largeNormalBlack14,
                title: "Vibrate",
                trailingWidget: Transform.scale(scale: 0.8,
                  child: SwitchWidget(
                      onChanged: (p0) {
                        p0=true;
                      },
                    ),
                ),),
            divider,
            SettingWidget(
                onTap: () {},
                style: largeNormalBlack14,
                title: "App Updates",
                trailingWidget: Transform.scale(
                  scale: 0.8,
                  child: SwitchWidget(
                    onChanged: (p0) {
                      p0=true;
                    },
                  ),
                )),
            divider,
            SettingWidget(
                onTap: () {},
                style: largeNormalBlack14,
                title: "Special Offers",
                trailingWidget: Transform.scale(
                  scale: 0.8,
                  child: SwitchWidget(
                    onChanged: (p0) {
                      p0=true;
                    },
                  ),
                )),
            divider,
          ],
        ),
      ),
    );
  }
}
