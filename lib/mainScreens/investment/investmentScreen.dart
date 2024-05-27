import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: true,
        child: Column(children: [
          gapH(20.h),

          optionWidget(
              title: "Bookings",
              subtitle: "Content for this section, something that explains in not more than 15 - 20 words",
              icons: AppImages.profileFilled,
              tap: (){}
          ),
          gapH(20.h),
          optionWidget(
              title: "Bookings",
              subtitle: "Content for this section, something that explains in not more than 15 - 20 words",
              icons: AppImages.profileFilled,
              tap: (){}
          ),

        ],),
      ),
    );
  }

  Widget optionWidget({required String title, required String subtitle, required String icons, required Function() tap,int color =0}) {
    return GestureDetector(onTap: tap,
      child: Container(
            width: double.infinity,height: 200.h,
            margin: screenPad(),
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12.r),
                //image: DecorationImage(image: AssetImage(AppImages.bookings,),fit: BoxFit.contain,),
               color: AppColors.green50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                gapW(13.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.h,
                      child: Center(
                        child: Container(width: 44.h,height: 44.h,
                        decoration: const BoxDecoration(color: AppColors.white,shape: BoxShape.circle),
                          child: Center(child: Image.asset(icons,width: 20.4,height: 24.h,fit: BoxFit.contain,color: AppColors.primary500,),),
                        ),
                      ),
                    ),
                   // gapH(10.h),
                    ctmTxtCrtB(title,18.sp,textAlign: TextAlign.start),

                  ],
                ),
                const Spacer(),
                Image.asset(AppImages.bookings,width: 120.h,height:120.h,fit: BoxFit.fill,),
              ],),
              gapH(5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ctmTxtAct(
                    subtitle,
                    AppColors.neutral500,14.sp,maxLines: 2),
              ),
                Spacer(),
            ],),
          ),
    );
  }
}
