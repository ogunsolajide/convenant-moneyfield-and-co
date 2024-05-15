import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/mainScreens/bottomNavigator.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/textWidget.dart';
import '../../utitlity/widgets.dart';



class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Container(height:45.h,width: double.infinity,
            color: AppColors.neutral10,),
          gapH(90.h),
          Image.asset(AppImages.documentation,
            width: double.infinity,
            height: 339.h,fit: BoxFit.fill,),

          Expanded(
              child: Padding(
                padding: screenPad(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gapH(50.h),
                      ctmTxtCrtB("Documentation",22.sp),
                      gapH(5.h),
                      ctmTxtAct("In accordance with CBN regulations, "
                          "there are 3 levels of compliance and documentation "
                          "evidence you will need to supply for your account",
                          AppColors.neutral100,14.sp,maxLines: 3,textAlign: TextAlign.center),
                    ],
                  ),
                ),)),


          Padding(
            padding: screenPad(),
            child: ctaBtn(title: "Proceed", tap:(){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  const BottomNavigator()));
              //_gotoDashboard();
            },),
          ),
          gapH(30.h),

        ]
        )
    );
  }
}
