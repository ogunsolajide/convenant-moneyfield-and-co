import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyfield/utitlity/textWidget.dart';

import '../colors.dart';
import '../widgets.dart';


class OtpResentDialog extends StatefulWidget {
  const OtpResentDialog({super.key});

  @override
  State<OtpResentDialog> createState() => _OtpResentDialogState();
}

class _OtpResentDialogState extends State<OtpResentDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: double.infinity,height: 472.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        padding: screenPad(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH(10.h),
            Lottie.asset('assets/json/success.json', height: 250.w, width: 250.h),
            ctmTxtCrtB("OTP Resent",22.sp),
            ctmTxtAct("Your OTP has been sent again",AppColors.neutral100,14.sp,maxLines: 2),
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
