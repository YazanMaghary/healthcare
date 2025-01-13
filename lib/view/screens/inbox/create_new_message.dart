// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:healthcare/core/utils/app_constanses.dart';
// import 'package:healthcare/core/utils/app_images.dart';
// import 'package:healthcare/view/components/appbar_button.dart';
// import 'package:healthcare/view/components/search_widget.dart';

// class CreateNewMessage extends StatefulWidget {
//   const CreateNewMessage({super.key});

//   @override
//   State<CreateNewMessage> createState() => _CreateNewMessageState();
// }

// class _CreateNewMessageState extends State<CreateNewMessage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(
//           "Message",
//           style: semiBoldBlack18,
//         ),
//         centerTitle: true,
//         toolbarHeight: 40.w,
//         leadingWidth: 56.w,
//         leading: AppBarButton(
//           margin: EdgeInsets.only(left: 16.w),
//           onTap: () {},
//           icon: Icons.chevron_left,
//         ),
//         actions: [
//           AppBarButton(
//               onTap: () {},
//               icon: Icons.add_box_outlined,
//               margin: EdgeInsets.only(right: 16.w))
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SearchWidget(
//               hintText: "Search Message",
//             ),
//             mediumSpace,
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: Container(decoration: const BoxDecoration(
//                     border: Border(bottom: BorderSide(width: 1,color: lightgreyColor))
//                   ),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.w),
//                             child: SizedBox(
//                               width: 50.w,
//                               height: 50.w,
//                               child: const CircleAvatar(
//                                 backgroundImage: AssetImage(listviewItem1),
//                               ),
//                             ),
//                           ),
//                           Column(crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Dr. Randy Wigham",style: semiBoldBlack14,),
//                               Text("General Doctor | RSUD Gatot Subroto",style: smallNormalGrey,),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//             // ... existing body content ...
//           ],
//         ),
//       ),
//     );
//   }
// }
