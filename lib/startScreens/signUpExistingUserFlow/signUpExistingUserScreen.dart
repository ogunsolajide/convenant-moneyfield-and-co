import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/signUpExistingUserFlow/signUpExistingUserTwoScreen.dart';
import 'package:moneyfield/startScreens/signUpFlow/confirmTransactionPinScreen.dart';
import 'package:moneyfield/startScreens/others/setupPasscodeScreen.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/customWidgets/customVerifyOtpScreen.dart';
import '../../utitlity/dialogs/customSuccessDialog.dart';
import '../../utitlity/iconsImages.dart';
import '../../utitlity/textWidget.dart';
import '../../utitlity/widgets.dart';
import '../others/confirmPasscodeScreen.dart';
import '../signUpFlow/setupTransactionPinScreen.dart';
import 'EnterEmailScreen.dart';

class SignUpExistingUserScreen extends StatefulWidget {
  const SignUpExistingUserScreen({super.key});

  @override
  State<SignUpExistingUserScreen> createState() => _SignUpExistingUserScreenState();
}

class _SignUpExistingUserScreenState extends State<SignUpExistingUserScreen> {
  TextEditingController bvnController = TextEditingController();
  TextEditingController accNumberController = TextEditingController();
  TextEditingController referralController = TextEditingController();

  bool _bvnValid = false;
  bool _accNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBarWithLogo(backTap: () {Navigator.pop(context); }),
          gapH(12.h),
          Expanded(child: SingleChildScrollView(
            padding: screenPad(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageTitleDescription(
                    title: 'Mobile banking registration',
                    description: 'Enter your correct account details'
                ),
                gap(),
                gap(),
                CustomTextFieldWithValidation(
                  controller: bvnController,
                  title:"Enter your BVN",
                  hint: "Enter your BVN",
                  inputType:TextInputType.number,
                  isValid: (val) {
                    setState(() {_bvnValid = val;});
                  },
                  errorLengthMsg: 'should be 11 digits',
                  errorTextType: 'Eg. 12345678901',
                  requiredMessage: 'is required',
                  label: 'BVN',
                  textLength:11,
                  regexp: CustomRegexp.bvn,
                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: accNumberController,
                  title:"Enter your account number",
                  hint: "Enter your account number",
                  inputType:TextInputType.number,
                  isValid: (val) {
                    setState(() {_accNumberValid = val;});
                  },
                  errorLengthMsg: 'should be 11 digits',
                  errorTextType: 'Eg. 12345678901',
                  requiredMessage: 'is required',
                  label: 'Account Number',
                  textLength:11,
                  regexp: CustomRegexp.phoneNumberExp,
                ),
                gap(),
              ],),)),
          Padding(
            padding: screenPad(),
            child: Column(
              children: [
                ctaBtn2(title:'Proceed',
                    tap: () {
                      _stepTwo();
                    }, active: false
                ),
                gapH(20.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.neutral700,
                      fontSize: 12.sp,
                      fontFamily: 'actionSansRegular',
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.25.sp,
                    ),

                    children: [
                      TextSpan(
                        text: ' Login',
                        style: TextStyle(color: AppColors.primary),
                        // Add onTap handler if needed
                      ),
                    ],
                  ),),
                gapH(20.h),
              ],
            ),
          )


        ],),
      ),
    );
  }
  _stepTwo(){
    // if(_firstNameValid && _lastNameValid && _middleNameValid && _emailValid && _phoneValid && _genderValid){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNewUserTwoScreen()));
    // }
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    const SignUpExistingUserTwoScreen()));
  }
  gap() => gapH(12.h);
  // _stepOtpSentDialog() async{
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   var result = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CustomSuccessDialog(title: "OTP Sent",
  //           description: "Your OTP has been sent",
  //           showActionBtn: true
  //       );
  //     },
  //   );
  //   if(result!=null){
  //     if(result == true){
  //       _stepTwoVerifyPhoneNumber();
  //     }
  //   }
  //
  // }
  // _stepTwoVerifyPhoneNumber()async{
  //     var result = await Navigator.push(context,
  //         MaterialPageRoute(builder: (context) =>
  //             const CustomVerifyOtpScreen(
  //               title: "Verify Your Phone number",
  //               description: "We’ve just sent you a 6 digit code. Check your messages and enter it here",
  //               btnTitle: "Verify Phone number",
  //             )));
  //     if(result !=null){
  //      _stepThreeOpenEnterEmailScreen();
  //     }
  // }
  // _stepThreeOpenEnterEmailScreen() async {
  //   var result = await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //       const EnterEmailScreen())
  //   );
  //   if(result!=null){
  //     _stepFourOpenSetupPasscode();
  //
  //   }
  //
  // }
  // _stepFourOpenSetupPasscode()async{
  //   var result = await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //   const SetupPasscodeScreen()));
  //
  //   if(result!=null){
  //     _stepFiveOpenConfirmPassCode(result);
  //
  //   }
  //
  // }
  //
  // _stepFiveOpenConfirmPassCode(String passcode)async{
  //   var result = await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //           ConfirmPasscodeScreen(
  //               firstPasscode: passcode??"")));
  //   if(result!=null){
  //     _stepSixOpenSetUpTransactionPinScreen();
  //
  //   }
  // }
  //
  // _stepSixOpenSetUpTransactionPinScreen()async{
  //   //SetupTransactionPinScreen
  //   var result = await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //           const SetupTransactionPinScreen()));
  //   if(result!=null){
  //     _stepSevenOpenConfirmTransPin(result);
  //   }
  // }
  //
  // _stepSevenOpenConfirmTransPin(String pin)async{
  //   var result = await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //           ConfirmTransactionPinScreen(firstPin: pin??"")
  //       ));
  // }

}
