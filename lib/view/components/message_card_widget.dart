import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class ChatCardWidget extends StatelessWidget {
  final String doctorName;
  final String lastChat;
  final String time;
  final String specilaizationName;
  final String hospitalName;
  final String imagePath;
  final bool drCheck;
  const ChatCardWidget({
    super.key,
    required this.doctorName,
    required this.lastChat,
    required this.time,
    required this.imagePath,
    required this.specilaizationName,
    required this.hospitalName,
    required this.drCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: lightgreyColor))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              child: SizedBox(
                width: 50.w,
                height: 50.w,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: imagePath != ""
                      ? NetworkImage(imagePath)
                      : const AssetImage(defaultProfile),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: semiBoldBlack14,
                ),
                Text(
                  "$specilaizationName | $hospitalName",
                  style: smallNormalGrey,
                ),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    lastChat,
                    style: smallNormalGrey12,
                  ),
                ),
                mediumSpace20
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    time,
                    style: smallNormalGrey,
                  ),
                  largeSpace,
                  Container(
                    width: 25.w,
                    height: 25.w,
                    // padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: primaryColor),
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      drCheck == true ? "Dr" : "You",
                      style: smallNormalWhite10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
