import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/passwordRecoveryflow/resetPasswordScreen.dart';

import '../../utitlity/bottomSheets/selectTextBottomSheet.dart';
import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/widgets.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController securityAnswerController = TextEditingController();

  bool _username = false;
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
                    title: 'Recover your password',
                    description: 'Setup your username, security answer to recover your password'
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
              ],),)),
          gap(),
          Padding(
            padding: screenPad(),
            child: ctaBtn2(title:'Proceed',
                tap: () {
                  _stepTwo();
                }, active: false
            ),
          ),
          gapH(30.h),
          gap(),


        ],),
      ),
    );
  }

  _stepTwo(){
    // if(_firstNameValid && _lastNameValid && _middleNameValid && _emailValid && _phoneValid && _genderValid){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNewUserTwoScreen()));
    // }

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    const ResetPasswordScreen()));
  }
  gap() => gapH(12.h);
}
