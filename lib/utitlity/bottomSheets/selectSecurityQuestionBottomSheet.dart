// import 'package:flutter/material.dart';
//
//
// class SecurityQuestionListBottomSheet extends StatefulWidget {
//   final String title;
//   final List<SecurityQuestion> customList;
//   final int maxLines;
//   final Function(SecurityQuestion) onSelectedOption;
//   const SecurityQuestionListBottomSheet({super.key, required this.customList, required this.maxLines, required this.title, required this.onSelectedOption});
//
//   @override
//   State<SecurityQuestionListBottomSheet> createState() => _SecurityQuestionListBottomSheetState();
// }
//
// class _SecurityQuestionListBottomSheetState extends State<SecurityQuestionListBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 663.h, width: double.infinity,
//       //color: AppColors.white,
//       child: Column(children: [
//         bottomSheetAppBar(widget.title,backTap: () {
//           Navigator.pop(context);
//         }),
//         gapH(10.h),
//         Expanded(
//           child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: widget.customList.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: (){
//                     SecurityQuestion selection = widget.customList[index];
//                     widget.onSelectedOption(selection);
//                     Navigator.pop(context,);
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 7.5.h),
//                     padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: AppColors.whiteFA,
//                         borderRadius: BorderRadius.circular(10.r)
//                     ),
//                     child: ctmTxtGroteskMid(widget.customList[index].secretQuestion, AppColors.black,18.sp,
//                         maxLines: widget.maxLines),
//                   ),
//                 );
//               }
//           ),
//         ),
//         gapH(10.h),
//
//       ],),
//     );
//   }
//
//   Container bottomSheetAppBar(title,{required Function() backTap}) {
//     return Container(height: 86.h,
//       padding:EdgeInsets.symmetric(horizontal: 18.w),
//       color: AppColors.whiteFA,
//       child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           backArrow(backTap,),
//           gapW(10.w),
//           ctmTxtGroteskMid(title,AppColors.black33,18.sp),
//
//         ],),
//     );
//   }
// }