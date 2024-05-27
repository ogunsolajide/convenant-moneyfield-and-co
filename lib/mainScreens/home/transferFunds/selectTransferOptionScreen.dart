import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

class SelectTransferScreen extends StatefulWidget {
  const SelectTransferScreen({super.key});

  @override
  State<SelectTransferScreen> createState() => _SelectTransferScreenState();
}

class _SelectTransferScreenState extends State<SelectTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        backTextAppBar(backTap: () {  Navigator.pop(context);}),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 10.h),
            alignment: Alignment.centerLeft,
            child: ctmTxtAct("Select beneficiary",AppColors.neutral80,14.sp)),
        Expanded(child: SingleChildScrollView(
          child: Column(children: [

            optionWidget(tap: (){}, title: "Own account",
                description: "Fund your account", icon:AppImages.receipt),
            optionWidget(tap: (){}, title: "MoneyField Microfinance Bank",
                description: "Fund a Moneyfield MFB account", icon:AppImages.receipt),
            optionWidget(tap: (){}, title: "Another bank",
                description: "Fund other banks", icon:AppImages.receipt),
          ],),
        )),
        Container(padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 20.h),
            child: ctaBtn(title: "Proceed", tap: (){}))
      ],),
    );
  }

  Widget optionWidget({required Function() tap,required String title,required String description,required String icon,}) {
    return GestureDetector(onTap: tap,
      child: Container(
        margin: EdgeInsets.fromLTRB(13.w, 0.h,13.w, 11.h),
        height: 58.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.neutral10,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 34.h,height: 34.h,
              decoration: BoxDecoration(
                  color: AppColors.green25,
                  shape: BoxShape.circle
              ),
              child: Center(child: Image.asset(icon,width: 20.h,height: 20.h,fit: BoxFit.contain,color: AppColors.primary500,),),
            ),
            gapW(12.w),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ctmTxtAct(title,
                    AppColors.black1f,
                    14.sp,maxLines: 1,weight: FontWeight.w500),
                ctmTxtAct(description,
                    AppColors.color9E,
                    12.sp,maxLines: 1),
              ],
            )
            ),
            gapW(12.w),
            Icon(Icons.arrow_forward,color: AppColors.black1f,size: 18.r,)
          ],),
      ),
    );
  }


}
