import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';


class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
        padding: screenPad(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Spacer(),
          Image.asset(AppImages.appCard,width: 337.w,height: 190.h,fit: BoxFit.fill,),
            gapH(40.h),
            ctmTxtCrtB("No Card Available",18.sp),
            gapH(10.h),
            SizedBox(width: 272.w,
                child: ctmTxtAct("You’re yet to request for a debit card for your account",
                    AppColors.color9E,14.sp,textAlign: TextAlign.center,maxLines: 3)),
            gapH(40.h),
            ctaBtn(title: "Request for a Debit card",
                tap: (){}),
            const Spacer(),



        ],),
      ),
    );
  }
}
