import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingWidget extends StatelessWidget {
  final String? imageString;  
  final Widget? trailingWidget;  
  final TextStyle? style;  
  final void Function()? onTap;  

  final String title;  
  const SettingWidget({super.key,  this.imageString, required this.title,  this.trailingWidget, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Row(
          children: [
           
            imageString != null && imageString!.isNotEmpty 
                ? Image.asset(imageString!) 
                : const SizedBox.shrink(),
            Container(
                margin: EdgeInsets.only(left:imageString != null && imageString!.isNotEmpty ? 12.w : 0),
                child: Text(
                  title,
                  style:style ,
                )),
            const Spacer(),
            InkWell(
              onTap:onTap ,
              child: trailingWidget,
            )
          ],
        ));
  }
}
