import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/textWidget.dart';
import '../../utitlity/widgets.dart';

class ViewTransactionScreen extends StatefulWidget {
  const ViewTransactionScreen({super.key});

  @override
  State<ViewTransactionScreen> createState() => _ViewTransactionScreenState();
}

class _ViewTransactionScreenState extends State<ViewTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(top: true,
        child: Column(children: [
          cancelBtn(cancelTap: () { Navigator.pop(context); }),
          Expanded(child: SingleChildScrollView(child: Column(children: [
            //gapH(10.h),
            Container(width: double.infinity,
              padding: screenPad(),
              child: Column(children: [
                Lottie.asset('assets/json/success.json', height: 150.w, width: 150.h),
                gapH(16.h),
                ctmTxtCrtB('Successful transfer',22.sp),
                gapH(26.h),
                infoCard(title: 'Amount', description: amountAndReport("NGN -23,452,453",(){})),
                gap(),
                Row(
                  children: [
                    Expanded(
                      child: infoCard(title: 'Transfer from',
                          description: normalDescription("Current account")),
                    ),
                    gapW(15.w),
                    Expanded(
                      child: infoCard(title: 'Transfer to',
                          description: normalDescription("Savings account")),
                    ),
                  ],
                ),
                gap(),
                SizedBox(width: double.infinity,
                  child: infoCard(title: 'Narration',
                      description: normalDescription("Wife's salary")),
                ),
                gap(),
                SizedBox(width: double.infinity,
                  child: infoCard(title: 'Reference number',
                      description: normalDescription("323849471103940484")),
                ),
                gapH(30.h),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    actionIconBtn(tap: () {  },
                        title: 'Share receipt', icon: AppImages.receipt),
                    gapW(40.w),
                    actionIconBtn(tap: () {  },
                        title: 'Download receipt', icon: AppImages.download),
                  ],
                ),
                gapH(100.h),
        
                // ctmTxtAct('Your transaction was successful. Please check your account for details.',
                //   AppColors.neutral100,14.sp,maxLines: 3,),
              ],),
            ),
        
          ],),))
        
        
        ],),
      ),

    );
  }

  Container cancelBtn({required Function() cancelTap}) {
    return Container(padding:screenPad(),
          child: Row(
            children: [
              GestureDetector(onTap: cancelTap,
                  child: Icon(Icons.cancel_rounded,color: AppColors.neutral80,size: 40.r,)),
            ],
          ),
        );
  }

  GestureDetector actionIconBtn({required Function()tap,required String title,required String icon,}) {
    return GestureDetector(onTap: tap,
              child: Column(children: [
                Container(
                  width: 44.w,height: 44.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green25
                  ),
                  child: Center(child:
                  Image.asset(icon,width:20.w,height: 20.w,fit: BoxFit.contain,color: AppColors.primary,),),
                ),
                gapH(10.h),
                ctmTxtAct(title,AppColors.black,14.sp,weight: FontWeight.w400),
              ],),
            );
  }

  SizedBox gap() => gapH(12.h);

  Text normalDescription(text) {
    return ctmTxtAct(text,
                    AppColors.neutral800,14.sp,weight: FontWeight.w500,maxLines: 1);
  }

  Container infoCard({required String title,required Widget description,}) {
    return Container(
              //width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.neutral10,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ctmTxtAct(title,AppColors.neutral100,13.sp),
                  gapH(3.h),
                  description,
                ],
              ),
            );
  }

  Row amountAndReport(amount,tap) {
    return Row(children: [
                    Expanded(child: ctmTxtCrtB(amount,20.sp,maxLines: 1)),
                    gapW(15.w),
                    GestureDetector(onTap: tap,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.redAA,width: 0.75.r),
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.red25
                        ),
                        child: ctmTxtCrtB("Report transaction",12.sp,maxLines: 1),
                      ),
                    )
                    
                  ],);
  }
}
