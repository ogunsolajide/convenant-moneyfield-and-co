import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/dialogs/otpResentDialog.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../utitlity/widgets.dart';


class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({super.key});

  @override
  State<VerifyPhoneNumberScreen> createState() => _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  int _remainingTime = 60; // Initial OTP expiration time in seconds
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        // Handle expiration, e.g., show a message or resend OTP
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }
  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  TextEditingController controller =TextEditingController();
  bool _pinValid = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: screenPad(),
            child: Column(children: [
              gapH(5.h),
              backAppBar(backTap: () {Navigator.pop(context); }),
              gapH(12.h),
              pageTitleDescription(
                  title: 'Verify Your Phone Number',
                  description: 'We’ve just sent you a 6 digit code. Check your messages and enter it here'
              ),
              gapH(22.h),
              Expanded(child: SingleChildScrollView(child: Column(children: [
                gapH(22.h),
                PinInputTextField(
                  pinLength: 6,controller: controller,
                  keyboardType: TextInputType.number,autoFocus: true,
                  decoration: BoxLooseDecoration(
                    bgColorBuilder: PinListenColorBuilder(AppColors.neutral20,AppColors.neutral20,),
                    strokeColorBuilder: PinListenColorBuilder(Colors.transparent,Colors.transparent),
                    strokeWidth: 0,gapSpace: 10,
                    radius: Radius.circular(6.r),
                    textStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 28.sp,
                        fontFamily: 'creatoDisplayBold',
                    ),
                  ),
                  onSubmit: (pin){

                  },
                  onChanged: (pin) {
                    if(pin.length >5){
                      setState(() {
                        _pinValid =true;
                      });
                    }else{
                      _pinValid = false;
                    }
                    // You can handle the OTP input here
                    print("Pin: $pin");
                  },
                ),
                gapH(30.h),
                resendOtpWidget(tap: () {
                   _openResendOtpDialog();
                }),
                gapH(30.h),
                ctmTxtAct("OTP expires in ${_formatTime(_remainingTime)}",AppColors.neutral100,12.sp)




              ],),)),

              ctaBtn2(title:'Proceed',
                  tap: () {
                if(_pinValid) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                      const VerifyPhoneNumberScreen()));
                }

                  }, active: _pinValid
              ),
              gapH(30.h),


            ],),
          ),
        ),
      ),
    );
  }

  _openResendOtpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OtpResentDialog();
      },
    );
  }
           // Close the dialog

  Container resendOtpWidget({required Function()tap}) {
    return Container(
                height: 44.h,width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:AppColors.primaryInactive
                ),
                child: Row(children: [
                  Image.asset(AppImages.caution,width: 14.w,height: 14.h,),
                  gapW(5.w),
                  ctmTxtAct("Didn’t get the OTP?",AppColors.neutral500,14.sp),
                  Spacer(),
                  GestureDetector(onTap: tap,
                    child: Row(children: [
                      Image.asset(AppImages.resend,width: 14.w,height: 14.h,),
                      ctmTxtAct(" Resend OTP",AppColors.primary,12.sp),
                    ],),
                  ),

                ],),
              );
  }


}
