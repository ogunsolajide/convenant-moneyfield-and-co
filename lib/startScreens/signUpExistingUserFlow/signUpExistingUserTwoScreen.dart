import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/loginScreen.dart';
import 'package:share_plus/share_plus.dart';

import '../../utitlity/bottomSheets/accountCreatedSuccessBottomSheet.dart';
import '../../utitlity/bottomSheets/selectTextBottomSheet.dart';
import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/customWidgets/customVerifyOtpScreen.dart';
import '../../utitlity/widgets.dart';

class SignUpExistingUserTwoScreen extends StatefulWidget {
  const SignUpExistingUserTwoScreen({super.key});

  @override
  State<SignUpExistingUserTwoScreen> createState() => _SignUpExistingUserTwoScreenState();
}

class _SignUpExistingUserTwoScreenState extends State<SignUpExistingUserTwoScreen> {
  TextEditingController usernameController = TextEditingController();
  //TextEditingController bvnController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();
  TextEditingController securityQuestionController = TextEditingController();
  TextEditingController securityAnswerController = TextEditingController();

  bool _username = false;
  bool _passwordValid = false;
  bool _confirmPasswordValid = false;
  bool _pinValid = false;
  bool _confirmPinValid = false;
  bool _securityQuestionValid = false;
  bool _securityAnswerValid = false;


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
                    title: 'Complete mobile registration',
                    description: 'Setup your username, password, transaction pin and security question to complete registration'
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
                      setState(() {_confirmPasswordValid = val;});
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
                GestureDetector(
                  onTap: (){
                    questionSelection();
                    //genderSelection();
                  },
                  child: CustomTextFieldWithValidation(
                    enabled: false,
                    controller: securityQuestionController, title:"Select your security question",
                    hint: "Select your security question",
                    inputType:TextInputType.name,
                    isValid: (val) {
                      setState(() {_securityQuestionValid = val;});
                    },
                    errorLengthMsg: 'should be at least 2 letters',
                    errorTextType: 'Eg. male',
                    requiredMessage: 'is required',
                    label: '',
                    textLength:2,
                    regexp: CustomRegexp.anything,
                    // onTap: () => genderSelection(),
                  ),
                ),
                gap(),
                CustomTextFieldWithValidation(
                  controller: securityAnswerController,
                  title:"Enter your security answer",
                  hint: "Enter your security answer",
                  inputType:TextInputType.text,
                  isValid: (val) {
                      setState(() {_securityAnswerValid = val;});
                  },
                  errorLengthMsg: 'should be at least 3 characters',
                  errorTextType: 'Eg toyota',
                  requiredMessage: 'is required',
                  label: 'Security Answer',
                  textLength:3,
                  regexp: CustomRegexp.anything,
                ),
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
  void questionSelection() async{
    await openBottomSheet(context, SelectTextBottomSheet(titleText: "Select security question", items: [SelectionModal(title: "Male", id: "1"), SelectionModal(title: "Female", id: "2")], height: 400.h, ),)
        .then((value) {
      if (value is SelectionModal){
        securityQuestionController.text = value.title;
        _securityQuestionValid= true;
        //bloc.validation.setGender(value.title);
      }
    });
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
      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          context: context,
          builder: (context) => SafeArea(
            child: Container(height: 660.h,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child:  SuccessAlertBottomSheet(
                    isSuccessful: true, type: "Mobile banking account created",
                    description: "Your Nsukka MFB account number is 000000",
                    shareTap: (){
                      Share.share('My Nsukka MFB bank account number 00000');
                    }, downloadTap: () async {
                  await Clipboard.setData(ClipboardData(text: 'my Nsukka MFB bank account number 00000'));
                      // .then((value) =>
                      // AppUtils.showSuccessSnack("account number copied", context));
                },
                    returnTap: (){
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ), (Route<dynamic> route) => false,);
                      //
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      // const LoginFirstTime()));
                    })
            ),
          )
      );

    // showModalBottomSheet(
    //     isDismissible: false,
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (context) => SafeArea(
    //       child: Container(height: 750.h,
    //           padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).viewInsets.bottom,
    //           ),
    //           child:  SuccessAlertBottomSheet(
    //               isSuccessful: true, type: "Account created",
    //               description: "Your account number is 00000",
    //               shareTap: (){
    //                 Share.share('my CovenantMFB account number 00000');
    //               }, downloadTap: () async {
    //             await Clipboard.setData(ClipboardData(text:
    //             'my CovenantMFB account number 000000'));
    //             // .then((value) =>
    //             // AppUtils.showSuccessSnack("account number copied", context));
    //           },
    //               returnTap: (){
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) =>
    //                     const LoginScreen()));
    //               })
    //       ),
    //     )
    // );

  }
  SizedBox gap() => gapH(12.h);
}
