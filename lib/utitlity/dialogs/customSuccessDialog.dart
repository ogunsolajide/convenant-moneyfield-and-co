import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../colors.dart';
import '../textWidget.dart';
import '../widgets.dart';





class CustomSuccessDialog extends StatelessWidget {
  final String title , description;
  final bool showActionBtn;
  const CustomSuccessDialog({super.key, required this.title, required this.description, required this.showActionBtn});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: double.infinity,height: 472.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: AppColors.white,
        ),
        padding: screenPad(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH(10.h),
            Lottie.asset('assets/json/success.json', height: 250.w, width: 250.h),
            ctmTxtCrtB(title,22.sp),
            ctmTxtAct(description,AppColors.neutral100,14.sp,maxLines: 2,),
            showActionBtn?
            Expanded(
              child: Column(children: [
                const Spacer(),
                ctaBtn3(title: "Proceed", tap:(){
                  Navigator.pop(context,true);
                },),
                const Spacer(),
              ],),
            ):gapH(20.h),
          ],
        ),
      ),
    );
  }
}
