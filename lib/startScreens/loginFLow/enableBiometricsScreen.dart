import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyfield/startScreens/loginFLow/documentationScreen.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/textWidget.dart';
import '../../utitlity/widgets.dart';



class EnableBiometricsScreen extends StatefulWidget {
  const EnableBiometricsScreen({super.key});

  @override
  State<EnableBiometricsScreen> createState() => _EnableBiometricsScreenState();
}

class _EnableBiometricsScreenState extends State<EnableBiometricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Container(height:45.h,width: double.infinity,
            color: AppColors.neutral10,),
          gapH(200.h),

          Expanded(
              child: Padding(
                padding: screenPad(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.biometric, height: 100.w, width: 100.h),
                      gapH(20.h),
                      ctmTxtCrtB("Enable Biometrics",22.sp),
                      gapH(10.h),
                      ctmTxtAct("Make your login and Transactions faster and more secure with Biometrics enabled",
                          AppColors.neutral100,14.sp,maxLines: 2,textAlign: TextAlign.center),
                    ],
                  ),
                ),)),


          skipOrEnable(
                  (){},
                  (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                        const DocumentationScreen()));
                  }
          ),
          gapH(40.h),

        ]
        )
    );
  }

  Padding skipOrEnable(skip,enable) {
    return Padding(
          padding: screenPad(),
          child: Row(children: [
            GestureDetector(onTap: skip,
              child: Container(
                height: 43.h,width: 161.w,
                decoration: BoxDecoration(
                  color: AppColors.primary25,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(child: ctmTxtAct("Not now",AppColors.black,14.sp),),
              ),
            ),
            Spacer(),
            GestureDetector(onTap: enable,
              child: Container(
                height: 43.h,width: 161.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(child: ctmTxtAct("Enable",AppColors.white,14.sp),),
              ),
            ),

          ],),
        );
  }
}
