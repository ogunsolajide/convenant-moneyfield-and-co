import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../colors.dart';
import '../textWidget.dart';
import '../widgets.dart';


class CustomVerifyOtpScreen extends StatefulWidget {
  final String title, description, btnTitle;
  const CustomVerifyOtpScreen({super.key, required this.title, required this.description, required this.btnTitle});

  @override
  State<CustomVerifyOtpScreen> createState() => _CustomVerifyOtpScreenState();
}

class _CustomVerifyOtpScreenState extends State<CustomVerifyOtpScreen> {
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBar(backTap: () {Navigator.pop(context); }),
          Expanded(
            child: Padding(padding: screenPad(),
              child: Column(children: [
                gapH(12.h),
                pageTitleDescription(
                    title: widget.title,
                    description: widget.description
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
                    //_openResendOtpDialog();
                  }),
                  gapH(30.h),
                  ctmTxtAct("OTP expires in ${_formatTime(_remainingTime)}",
                      AppColors.neutral100,12.sp)
                ],),)),

                ctaBtn2(title:'Verify Phone number',
                    tap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Future.delayed(const Duration(milliseconds: 500),(){
                        if(_pinValid||controller.text.length ==6) {
                          // FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context,controller.text);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) =>
                          //     const SetupPasscodeScreen()));
                        }
                      });
                    }, active: _pinValid
                ),
                gapH(30.h),
              ],),
            ),
          )


        ],),
      ),
    );
  }
}
