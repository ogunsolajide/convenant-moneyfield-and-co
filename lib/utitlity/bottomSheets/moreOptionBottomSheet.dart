import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../iconsImages.dart';



class MoreOptionBottomSheet extends StatelessWidget {
  const MoreOptionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236.h,width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        gapH(7.h),
        ctmTxtCrtB("More actions",18.sp),
        gapH(12.h),
        Expanded(child: SingleChildScrollView(child: Column(children: [
          optionWidget(title: 'Schedule payment', description: 'Initiate re-occurring transactions with ease',
              image: AppImages.repeat, tap: () {  }),
          gapH(12.h),
          optionWidget(title: 'Account statement', description: 'Generate your bank account statement',
              image: AppImages.receipt, tap: () {  }),
          gapH(20.h),
        ],),))
      ],),
    );
  }

  Widget optionWidget({required String title, required String description,
    required String image, required Function()tap}) {
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
          Container(width: 34.h,height: 34.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,color: AppColors.green25
          ),
          child: Center(child: Image.asset(image,width: 18.h,height: 18.h,)),
          ),
          gapW(12.w),
          SizedBox(width: 237.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ctmTxtAct(title,AppColors.black1f,14.sp,weight: FontWeight.bold,maxLines: 1),
              gapH(2.h),
              ctmTxtAct(description,AppColors.color9E,12.sp,maxLines: 1),
            ],),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward,color: AppColors.neutral500,size: 18.w,)
        ],),
        ),
    );
  }
}
