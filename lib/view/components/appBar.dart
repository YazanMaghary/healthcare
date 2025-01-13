import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

PreferredSize appBar(
    { required String title,
    bool ? tranparent,
    Color? foregroundColor,
     Widget? leadingWidget,
     List<Widget>? actions}) {
  return PreferredSize(
     preferredSize: Size.fromHeight(80.h),
    child: Padding(
      padding:  EdgeInsets.only(top:  16.w),
      child: AppBar(
          forceMaterialTransparency: tranparent ?? false,
          foregroundColor: foregroundColor,
          title: Text(
            title,
            style: semiBoldBlack18,
          ),
          centerTitle: true,
          toolbarHeight: 40.w,
          leadingWidth: 56.w,
          leading: leadingWidget,
          actions: actions),
    ),
  );
}
