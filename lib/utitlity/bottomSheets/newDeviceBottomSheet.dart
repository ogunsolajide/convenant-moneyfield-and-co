import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';

import '../textWidget.dart';
import '../widgets.dart';

class NewDeviceBottomSheet extends StatefulWidget {
  const NewDeviceBottomSheet({super.key});

  @override
  State<NewDeviceBottomSheet> createState() => _NewDeviceBottomSheetState();
}

class _NewDeviceBottomSheetState extends State<NewDeviceBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:376.h,width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(12.h),
          Image.asset(AppImages.newDeviceIcon,width: 56.h,height: 56.h,),
          const Spacer(),
          ctmTxtCrtB("New device authorisation?",22.sp),
          gapH(12.h),
          ctmTxtAct("Heads up! We noticed you're logging in from a new device. "
              "To keep your account secure, we'll send a"
              " verification code to your phone number ending in "
              "[35]. Enter the code to confirm it's you.",
              AppColors.neutral200,14.sp,maxLines: 5),
          const Spacer(),
          ctaBtn(title: "Proceed", tap: (){
            Navigator.pop(context,1);
          }),
          gapH(12.h),
        ],),
    );
  }
}
