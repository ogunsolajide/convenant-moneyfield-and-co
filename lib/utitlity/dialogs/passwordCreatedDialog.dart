import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../colors.dart';
import '../textWidget.dart';
import '../widgets.dart';



class passwordCreatedDialog extends StatelessWidget {
  const passwordCreatedDialog({super.key});

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
            ctmTxtCrtB("Passcode created",22.sp),
            ctmTxtAct("You have created your passcode",AppColors.neutral100,14.sp,maxLines: 2),
            Spacer(),
            ctaBtn3(title: "Enter OTP", tap:(){
              Navigator.pop(context);
            },),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
