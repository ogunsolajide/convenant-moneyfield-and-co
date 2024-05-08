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
    return Container(
      width: double.infinity,height: 472.h,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH(10.h),
          Lottie.asset('assets/json/success.json', height: 250, width: 250),
           ctmTxtCrtB("OTP Resent",22.sp),
           ctmTxtAct("Your OTP has been sent again",AppColors.neutral100,14.sp),
          Spacer(),
          ctaBtn2(title: "Enter OTP", tap:(){}, active:true),
          Spacer(),
        ],
      ),
    );
  }
  
}
