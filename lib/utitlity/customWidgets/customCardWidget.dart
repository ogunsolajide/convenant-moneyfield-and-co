import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../iconsImages.dart';
import '../textWidget.dart';
import '../widgets.dart';



class CardWidget extends StatefulWidget {
  final bool active;
  final String accountNumber;
  final String productName;
  final String balance;
  const CardWidget({super.key, required this.active, required this.accountNumber, required this.productName, required this.balance});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 191.h,
      padding: EdgeInsets.symmetric(horizontal: 10.5.w,vertical: 19.h),

      // width:widget.active? 330.w:250.w,
      // height:  widget.active? 190.h:143.h,
      // padding:  widget.active?
      // EdgeInsets.symmetric(horizontal: 10.5.w,vertical: 20.h):
      // EdgeInsets.symmetric(horizontal: 10.5.w,vertical: 10.h),
      margin: widget.active? EdgeInsets.only(left: 2.w,right: 2.w):EdgeInsets.zero,
      decoration: BoxDecoration(
          color: AppColors.primary500,
          borderRadius: BorderRadius.circular(18.r),
          image: DecorationImage(image: AssetImage(AppImages.noise),fit: BoxFit.fill)
      ),
      child: Column(
        children: [

          Row(children: [
            borderShell(ctmTxtAct(widget.productName,AppColors.white,
                10.sp),),
            gapW(5.w),
            borderShell(Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white)
                    ),
                    child: Image.asset(AppImages.flag,width: 8.sp,height: 8.sp,)),
                gapW(3.w),
                ctmTxtAct("NGN",AppColors.white,10.sp),
              ],),),
            gapW(5.w),
            borderShell(Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.copy,size:10.sp,color: AppColors.white,),
                gapW(3.w),
                ctmTxtAct(widget.accountNumber,AppColors.white,10.sp),
              ],),),


          ]),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ctmTxtAct("Total balance",AppColors.neutral10,
                  12.sp),
              gapH(8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ctmTxtCrtB("N",24.sp,color: AppColors.neutral20.withOpacity(0.60)),
                  gapW(3.w),
                  ctmTxtCrtB(widget.balance,24.sp,
                      weight: FontWeight.bold,color: AppColors.white,maxLines: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: ctmTxtCrtB("65",12.sp,
                      weight: FontWeight.w900,color: AppColors.white,),
                  ),
                  const Spacer(),
                  Icon(Icons.visibility_off_outlined,
                    color: AppColors.white,size:18.sp,),



                ],),
            ],),
          const Spacer(),

          Row(children: [
            Container(
              width:144.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.neutral20,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.addCircle,width: 20.w,height:20.h),
                  gapW(4.w),
                  ctmTxtAct("Add money",AppColors.neutral600,12.sp,weight: FontWeight.w600),
                ],),
            ),
            gapW(8.w),
            Container(
              width:144.w,
              height:32.h,
              decoration: BoxDecoration(
                border: Border.all(color:AppColors.white,width: 0.5.r),
                color: AppColors.primary500,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.sendCircle,width:20.w,height: 20.h,),
                  gapW(4.w),
                  ctmTxtAct("Add money",AppColors.white,12.sp,weight: FontWeight.w600),
                ],),
            )
          ],),




        ],
      ),);
  }
}
