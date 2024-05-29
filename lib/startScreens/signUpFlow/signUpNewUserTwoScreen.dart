import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/loginScreen.dart';
import 'package:share_plus/share_plus.dart';

import '../../utitlity/bottomSheets/accountCreatedSuccessBottomSheet.dart';
import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/customWidgets/customVerifyOtpScreen.dart';
import '../../utitlity/widgets.dart';

class SignUpNewUserTwoScreen extends StatefulWidget {
  const SignUpNewUserTwoScreen({super.key});

  @override
  State<SignUpNewUserTwoScreen> createState() => _SignUpNewUserTwoScreenState();
}

class _SignUpNewUserTwoScreenState extends State<SignUpNewUserTwoScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _username = false;
  bool _bvnValid = false;
  bool _passwordValid = true;
  bool confirmPasswordValid = true;

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
                    title: 'Complete registration',
                    description: 'Setup your username, password and BVN to complete registration'
                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: usernameController,isPhoneNumber: false,
                  title:"Enter your Username",
                  hint: "Enter your Username",
                  inputType:TextInputType.text,
                  isValid: (val) {
                    setState(() {_username = val;});
                  },
                  errorLengthMsg: 'should be at least 5 letters',
                  errorTextType: 'Eg. John123',
                  requiredMessage: 'is required',
                  label: 'Username',
                  textLength:2,
                  regexp: CustomRegexp.anything,
                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: bvnController,
                  title:"Enter your BVN",
                  hint: "Enter your BVN",
                  inputType:TextInputType.number,
                  isValid: (val) {
                    setState(() {_bvnValid = val;});
                  },
                  errorLengthMsg: 'should be at least 11 digits',
                  errorTextType: 'Eg. 1234567890',
                  requiredMessage: 'is required',
                  label: 'BVN',
                  textLength:11,
                  regexp: CustomRegexp.bvn,

                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: passwordController,
                  title:"Enter your Password",
                  hint: "Enter your Password",
                  inputType:TextInputType.text,
                  isValid: (val) {
                    setState(() {_passwordValid = val;});
                  },
                  errorLengthMsg: 'should be at least 8 characters',
                  errorTextType: 'Eg.P@ssw0rd123',
                  requiredMessage: 'is required',
                  label: 'Password',
                  textLength:5,
                  regexp: CustomRegexp.passwordExp,
                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: confirmPasswordController,
                  title:"Confirm your Password",
                  hint: "Confirm your Password",
                  inputType:TextInputType.text,
                  isValid: (val) {
                   if(confirmPasswordController.text == passwordController.text){
                     setState(() {confirmPasswordValid = val;});
                   }
                  },
                  errorLengthMsg: 'should be at least 8 characters',
                  errorTextType: 'Eg.P@ssw0rd123',
                  requiredMessage: 'is required',
                  label: 'Confirm Password',
                  textLength:5,
                  regexp: CustomRegexp.passwordExp,
                ),

                gap(),
                gapH(140.h),
                ctaBtn2(title:'Proceed',
                    tap: () {
                      _stepOneOtpVerification();
                    }, active: false
                ),
                gap(),
                gapH(30.h),
                termsAndConditions(),
                gapH(30.h),
              ],),)),
          gap(),


        ],),
      ),
    );
  }
  _stepOneOtpVerification()async{
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
        const CustomVerifyOtpScreen(
          title: "Verify Your Phone number",
          description: "We’ve just sent you a 6 digit code. Check your messages and enter it here",
          btnTitle: "Verify Phone number",
        )));
    if(result !=null){
      _stepTwo();
    }
  }
  _stepTwo(){
    FocusManager.instance.primaryFocus?.unfocus();
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (context) => SafeArea(bottom: true,
          child: Container(height: 600.h,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child:  SuccessAlertBottomSheet(
                  isSuccessful: true, type: "Account created",
                  description: "Your account number is 00000",
                  shareTap: (){
                    Share.share('my CovenantMFB account number 00000');
                  }, downloadTap: () async {
                await Clipboard.setData(ClipboardData(text:
                'my CovenantMFB account number 000000'));
                    // .then((value) =>
                    // AppUtils.showSuccessSnack("account number copied", context));
              },
                  returnTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                  const LoginScreen()));
                  })
          ),
        )
    );

  }
  SizedBox gap() => gapH(12.h);
}
