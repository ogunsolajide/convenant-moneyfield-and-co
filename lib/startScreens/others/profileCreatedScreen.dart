import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyfield/startScreens/loginFLow/loginScreen.dart';
import 'package:moneyfield/startScreens/welcomeScreen.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/textWidget.dart';
    
    
class ProfileCreatedScreen extends StatefulWidget {
  const ProfileCreatedScreen({super.key});

  @override
  State<ProfileCreatedScreen> createState() => _ProfileCreatedScreenState();
}

class _ProfileCreatedScreenState extends State<ProfileCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(height:45.h,width: double.infinity,
          color: AppColors.neutral10,),

        Expanded(
          child: Padding(
            padding: screenPad(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Lottie.asset('assets/json/success.json', height: 300, width: 300),
                ctmTxtCrtB("Profile Created",22.sp),
                ctmTxtAct("Congratulations! Your profile has been created", AppColors.neutral100,14.sp),
                        ],
              ),
            ),)),

        Padding(
          padding: screenPad(),
          child: ctaBtn(title: "Proceed", tap:(){
            _gotoDashboard();
          },),
        ),
        gapH(30.h),

      ]
    )
    );
  }
  _gotoDashboard(){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ), (Route<dynamic> route) => false,);
  }
}

    