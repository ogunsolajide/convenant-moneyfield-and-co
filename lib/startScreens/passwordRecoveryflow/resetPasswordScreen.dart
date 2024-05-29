import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/dialogs/customSuccessDialog.dart';
import '../../utitlity/widgets.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  //TextEditingController bvnController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _passwordValid = false;
  bool _confirmPasswordValid = false;



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
                    title: 'Reset Password',
                    description: 'Create a new password'
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
                gapH(140.h),
              ],),)),
          gap(),
          Padding(
            padding: screenPad(),
            child: ctaBtn2(title:'Confirm password',
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
  _stepTwo()async{
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSuccessDialog(title: "Password Reset!",
            description: "",
            showActionBtn: false
        );
      },
    );
  }
  gap() => gapH(12.h);


}
