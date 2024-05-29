import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/mainScreens/bottomNavigator.dart';
import 'package:moneyfield/utitlity/customWidgets/customVerifyOtpScreen.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/dialogs/customSuccessDialog.dart';
import '../../utitlity/textWidget.dart';
import '../../utitlity/widgets.dart';


class NewDesignLoginScreen extends StatefulWidget {
  const NewDesignLoginScreen({super.key});

  @override
  State<NewDesignLoginScreen> createState() => _NewDesignLoginScreenState();
}

class _NewDesignLoginScreenState extends State<NewDesignLoginScreen> {
  //final GlobalKey<FormState> _formKeyPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeypassword = GlobalKey<FormState>();
  //TextEditingController phoneControl = TextEditingController();
  TextEditingController userControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  //bool _phoneValid = false;
  bool _userValid = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBar(backTap:(){
            Navigator.pop(context);
          }),

          // Padding(
          //   padding: screenPad(),
          //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       MediaQuery.of(context).viewInsets.bottom > 0 ?
          //       const SizedBox() : titleIcon(),
          //     ctmTxtCrtB("Log in to your account",22.sp),
          //     gapH(25.h),
          //       Row(
          //         children: [
          //           btnIconText(title: 'Phone number', icon: Icons.phone_outlined,
          //               tap: () {
          //                 _switch(0);
          //               }, active: selectedIndex ==0
          //           ),
          //           gapW(20.w),
          //           btnIconText(title: 'Username', icon: Icons.person_outline,
          //               tap: () {
          //                 _switch(1);
          //               }, active: selectedIndex==1
          //           ),
          //         ],
          //       ),
          //       gapH(25.h),
          //   ],),
          // ),
          Expanded(child: SingleChildScrollView(
            padding: screenPad(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery.of(context).viewInsets.bottom > 0 ?
                const SizedBox() : titleIcon(),
                ctmTxtCrtB("New device authorization",22.sp),
                gapH(25.h),
                CustomTextFieldWithValidation(
                  key: _formKeyUsername,
                  controller: userControl,isPhoneNumber: false,
                  title:"Enter your Username",
                  hint: "Enter your Username",
                  inputType:TextInputType.text,
                  isValid: (val) {
                    setState(() {_userValid = val;});
                  },
                  errorLengthMsg: 'should be at least 5 characters',
                  errorTextType: 'Eg. User12345',
                  requiredMessage: 'is required',
                  label: 'Username',
                  textLength:9,
                  regexp: CustomRegexp.nameRegExp,
                ),
                gapH(5.h),
                CustomTextFieldWithValidation(
                  key: _formKeypassword,
                  controller: passwordControl,isPhoneNumber: false,
                  isPassword: true,
                  title:"Enter your passcode",
                  hint: "Enter your passcode",
                  inputType:TextInputType.number,
                  isValid: (val) {
                    setState(() {_userValid = val;});
                  },
                  errorLengthMsg: 'should be at least 6 characters',
                  errorTextType: '6 digits passcode',
                  requiredMessage: 'is required',
                  label: 'Passcode',
                  textLength:5,
                  regexp: CustomRegexp.anything,
                ),
                gapH(35.h),


              ],),
          )),

          Padding(
            padding: screenPad(),
            child: Column(children: [
              ctaBtn2(title: "Proceed",
                  tap: (){
                    _openOtpSentScreen();
                  }, active: true
              ),
              // MediaQuery.of(context).viewInsets.bottom > 0 ?
              // SizedBox.shrink():
              // Column(children: [
              //   gapH(20.h),
              //   RichText(
              //     textAlign: TextAlign.center,
              //     text: TextSpan(
              //       text: 'Forget',
              //       style: TextStyle(
              //           color: AppColors.neutral700,
              //           fontSize: 12.sp,
              //           fontFamily: 'actionSansRegular',
              //           fontWeight: FontWeight.w500,
              //           letterSpacing: -0.25.sp,
              //           decoration: TextDecoration.underline
              //       ),
              //
              //       children: [
              //         TextSpan(
              //           text: ' Password?',
              //           style: TextStyle(color: AppColors.primary,
              //             fontWeight: FontWeight.w500,
              //             fontSize: 13.sp,
              //           ),
              //           // Add onTap handler if needed
              //         ),
              //       ],
              //     ),),
              // ],),
              gapH(20.h),
            ],),
          )


        ],),
      ),
    );
  }

  _openOtpSentScreen() async{
    FocusManager.instance.primaryFocus?.unfocus();
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSuccessDialog(title: "OTP Resent",
            description: "Your OTP has been sent again",
            showActionBtn: true
        );
      },
    );
    if(result!=null){
      if(result == true){
        _openEnterOtpScreen();
      }
    }

  }

  _openEnterOtpScreen()async{
   var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
       CustomVerifyOtpScreen(
           title: "Verify Your Identity",
           description: "We’ve just sent you a 6 digit code. Check your messages and enter it here",
           btnTitle: "Verify Phone number",
       )));
   if(result !=null){
     _openNewDeviceAuthorizedSuccess();
   }

  }
  _openNewDeviceAuthorizedSuccess() async{
    FocusManager.instance.primaryFocus?.unfocus();
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSuccessDialog(title: "New device authorised",
            description: "",
            showActionBtn: false
        );
      },
    );
    if(result==null){
      _gotoDashboard();
    }

  }
  _gotoDashboard(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
        const BottomNavigator()));

  }

}
