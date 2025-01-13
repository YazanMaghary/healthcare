import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/search_widget.dart';

//refactor widget
class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(
          title: 'Message',
          leadingWidget: AppBarButton(
            margin: EdgeInsets.only(left: 16.w),
            onTap: () {},
            icon: Icons.chevron_left,
          ),
          actions: [
            
              AppBarButton(
                  onTap: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      backgroundColor: scaffoldBackgroundColor,
                      SizedBox(
                        height: Get.height * 0.95,
                        child: Column(
                          children: [
                            const SearchWidget(
                              hintText: "Search Message",
                            ),
                            mediumSpace,
                            Expanded(
                              child: ListView.builder(
                                itemCount: 10,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: lightgreyColor))),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 16.w),
                                            child: SizedBox(
                                              width: 50.w,
                                              height: 50.w,
                                              child: const CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(listviewItem1),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Dr. Randy Wigham",
                                                style: semiBoldBlack14,
                                              ),
                                              Text(
                                                "General Doctor | RSUD Gatot Subroto",
                                                style: smallNormalGrey,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            // ... existing body content ...
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Icons.add_box_outlined,
                  margin: EdgeInsets.only(right: 16.w))
            ],
          ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchWidget(
              hintText: "Search Message",
            ),
            mediumSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: lightgreyColor))),
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
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(listviewItem1),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Randy Wigham",
                                style: semiBoldBlack14,
                              ),
                              Text(
                                "General Doctor | RSUD Gatot Subroto",
                                style: smallNormalGrey,
                              ),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  "Fine, I'll do a check. Does the patient have a history of certain diseases?",
                                  style: mediumNormalGrey,
                                ),
                              ),
                              mediumSpace
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "7:11 PM",
                                  style: smallNormalGrey,
                                ),
                                largeSpace,
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "2",
                                    style: smallNormalWhite,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
            // ... existing body content ...
          ],
        ),
      ),
    );
  }

}