import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const AppBarButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.margin, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40.w,
        height: 40.w,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: const Color(0xffEDEDED))),
        child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,color: color,
            size: 24,
          ),
        ));
  }
}
