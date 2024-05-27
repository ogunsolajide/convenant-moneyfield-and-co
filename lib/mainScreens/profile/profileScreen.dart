import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../../utitlity/iconsImages.dart';
import '../../utitlity/toggleSwitch.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFingerPrintEnabled = false;
  bool isFaceIDEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral10,
      body: Column(
        children: [
          profileAppBar(name: 'Fawwaz alli-Balogun',
              email: 'FawwazBalogun@gmail', level: 'Level 1'),
          gapH(10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                gapH(10.h),
                optionWidget(
                    tap: (){},
                    title: "Add new account",
                    icon: AppImages.profile,
                    type: 1
                ),
                optionWidget(
                    tap: (){},
                    title: "Manage beneficiaries",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Account upgrade",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Fingerprint",
                    icon: AppImages.profile,
                    type: 0,
                    widget:  CustomToggleSwitch(value: isFingerPrintEnabled,)
                ),
                optionWidget(
                    tap: (){},
                    title: "Facial recognition",
                    icon: AppImages.profile,
                    type: 0,
                    widget: CustomToggleSwitch(value: isFaceIDEnabled,)
                ),
                optionWidget(
                    tap: (){},
                    title: "Change transaction pin",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Change password",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Change transaction limit",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Support and Requests",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Frequently asked questions (Faqs)",
                    icon: AppImages.profile,
                    type: 0
                ),
                optionWidget(
                    tap: (){},
                    title: "Logout",
                    icon: AppImages.profile,
                    type: 0,
                    isRed: true,
                ),
                gapW(200.h)
              
              
              ],),
            ),
          ),
        ],
      ),
    );
  }

  Widget optionWidget({required Function() tap,int type =0,bool isRed =false,required String title,required String icon,Widget widget = const SizedBox()}) {
    return GestureDetector(onTap: tap,
      child: Container(
          margin: EdgeInsets.fromLTRB(13.w, 0.h,13.w, 15.h),
          height: 54.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width: 34.h,height: 34.h,
              decoration: BoxDecoration(
                color: isRed?AppColors.red25:AppColors.green25,
                shape: BoxShape.circle
              ),
              child: Center(child: Image.asset(icon,width: 20.h,height: 20.h,fit: BoxFit.contain,color: isRed?AppColors.red100:AppColors.primary500,),),
            ),
            gapW(12.w),
            Expanded(child: ctmTxtAct(title,
                isRed?AppColors.red100:AppColors.black1f,
                14.sp,maxLines: 1)
            ),
              type ==0?SizedBox.shrink():
            Container(
              //height: 19.h,
             padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
             decoration: type ==0?null:type ==1?comingSoonDeco():pendingDeco(),
              child: ctmTxtAct("Coming soon",AppColors.black1f, 10.sp),
            ),
            widget,
            gapW(12.w),
            Icon(Icons.arrow_forward,color: AppColors.black1f,size: 18.r,)
          ],),
        ),
    );
  }

  BoxDecoration comingSoonDeco() {
    return BoxDecoration(
               borderRadius: BorderRadius.circular(15.r),
               border: Border.all(color: AppColors.blue1,width: 0.8.r),
               color: AppColors.blue2
           );
  }
  BoxDecoration pendingDeco() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.yellow1,width: 0.8.r),
        color: AppColors.yellow2
    );
  }

  Container profileAppBar({required String name,required String email, required String level}) {
    return Container(
        width: double.infinity,
        color: AppColors.green25,
        child: SafeArea(top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gapH(10.h),
            Image.asset(AppImages.profile,
              width: 68.w,height: 68.w,color: AppColors.neutral600,),
              gapH(10.h),
              //ctmTxtCrtB("Fawwaz alli-Balogun",16.sp),
              ctmTxtCrtR(name,AppColors.black,16.sp,
                  weight: FontWeight.w600,textAlign: TextAlign.center),
              gapH(2.h),
              ctmTxtAct(email,AppColors.neutral600,14.sp,textAlign: TextAlign.center),
              gapH(10.h),
              Container(
                //height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color:AppColors.primary500,width: 1.r)
                ),
                child: ctmTxtSF(level,AppColors.primary,12.sp,maxLines: 1),
              ),
              gapH(20.h),

          ],),
        ),

      );
  }
}
