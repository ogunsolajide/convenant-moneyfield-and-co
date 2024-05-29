import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textWidget.dart';
import '../widgets.dart';

class SignUpTypeBottomSheet extends StatefulWidget {
  const SignUpTypeBottomSheet({super.key});

  @override
  State<SignUpTypeBottomSheet> createState() => _SignUpTypeBottomSheetState();
}

class _SignUpTypeBottomSheetState extends State<SignUpTypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236.h,width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(7.h),
          ctmTxtCrtB("Options",18.sp),
          gapH(12.h),
          Expanded(child: SingleChildScrollView(child: Column(children: [
            optionWidget(title: 'Sign up mobile banking', tap: () {
              Navigator.pop(context,1);
            }),
            gapH(12.h),
            optionWidget(title: 'Create a covenantMFB account', tap: () {
              Navigator.pop(context,2);
            }),
            gapH(20.h),
          ],),))
        ],),
    );
  }

  Widget optionWidget({required String title, required Function()tap}) {
    return GestureDetector(
      onTap: tap,
      child: Container(width: double.infinity,height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.neutral100.withOpacity(0.05)
        ),
        padding:EdgeInsets.symmetric(horizontal: 12.w,vertical: 0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // Container(width: 34.h,height: 34.h,
            //   decoration: const BoxDecoration(
            //       shape: BoxShape.circle,color: AppColors.green25
            //   ),
            //   child: Center(child: Image.asset(image,width: 18.h,height: 18.h,)),
            // ),
            // gapW(12.w),
            SizedBox(width: 237.w,
              child: ctmTxtAct(title,AppColors.black1f,14.sp,weight: FontWeight.w500,maxLines: 1),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward,color: AppColors.neutral500,size: 18.w,)
          ],),
      ),
    );
  }
}
