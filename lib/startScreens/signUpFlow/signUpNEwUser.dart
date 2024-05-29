import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/signUpFlow/signUpNewUserTwoScreen.dart';
import 'package:moneyfield/startScreens/others/verifyPhoneNumberScreen.dart';
import 'package:moneyfield/utitlity/bottomSheets/sigupTypeBottomSheet.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/constants.dart';
import 'package:moneyfield/utitlity/customWidgets/customTextFieldWithValidation.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../../utitlity/bottomSheets/selectTextBottomSheet.dart';

class SignUpNewUserScreen extends StatefulWidget {
  const SignUpNewUserScreen({super.key});

  @override
  State<SignUpNewUserScreen> createState() => _SignUpNewUserScreenState();
}

class _SignUpNewUserScreenState extends State<SignUpNewUserScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool _phoneValid = false;
  bool _firstNameValid = false;
  bool _lastNameValid = false;
  bool _middleNameValid = false;
  bool _emailValid = false;
  bool _genderValid = false;
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
                title: 'What’s are Your Details?',
                description: 'Enter your correct details'
              ),
              gap(),
              CustomTextFieldWithValidation(
                controller: firstNameController,isPhoneNumber: false,
                title:"Enter your First name",
                hint: "Enter your first name",
                inputType:TextInputType.name,
                isValid: (val) {
                  setState(() {_firstNameValid = val;});
                },
                errorLengthMsg: 'should be at least 2 letters',
                errorTextType: 'Eg. John',
                requiredMessage: 'is required',
                label: 'First Name',
                textLength:2,
                regexp: CustomRegexp.nameRegExp,
              ),
            gap(),
            CustomTextFieldWithValidation(
              controller: lastNameController,
              title:"Enter your last name",
              hint: "Enter your last name",
              inputType:TextInputType.name,
              isValid: (val) {
                setState(() {_lastNameValid = val;});
              },
              errorLengthMsg: 'should be at least 2 letters',
              errorTextType: 'Eg. John',
              requiredMessage: 'is required',
              label: 'Last Name',
              textLength:2,
              regexp: CustomRegexp.nameRegExp,
            ),
              gap(),
              CustomTextFieldWithValidation(
                controller: middleNameController,
                title:"Enter your middle name",
                hint: "Enter your middle name",
                inputType:TextInputType.name,
                isValid: (val) {
                  setState(() {_middleNameValid = val;});
                },
                errorLengthMsg: 'should be at least 2 letters',
                errorTextType: 'Eg. John',
                requiredMessage: 'is required',
                label: 'Middle Name',
                textLength:2,
                regexp: CustomRegexp.nameRegExp,
              ),
              gap(),
              CustomTextFieldWithValidation(
                controller: emailController,
                title:"Enter your email address",
                hint: "Enter your email address",
                inputType:TextInputType.emailAddress,
                isValid: (val) {
                  setState(() {_emailValid = val;});
                },
                errorLengthMsg: 'should be at least 4 characters',
                errorTextType: 'Eg. john@gmail.com',
                requiredMessage: 'is required',
                label: 'Email Address',
                textLength:4,
                regexp: CustomRegexp.emailExp,
              ),
              gap(),
              CustomTextFieldWithValidation(
                controller: phoneController,
                title:"Enter your phone number",
                hint: "Enter your phone number",
                inputType:TextInputType.phone,
                isValid: (val) {
                  setState(() {_phoneValid = val;});
                },
                errorLengthMsg: 'should be at least 10 characters',
                errorTextType: 'Eg. 08012345678',
                requiredMessage: 'is required',
                label: 'Phone Number',
                textLength:10,
                regexp: CustomRegexp.phoneNumberExp,
              ),
              gap(),
              GestureDetector(
                onTap: (){
                  genderSelection();
                },
                child: CustomTextFieldWithValidation(
                  enabled: false,
                  controller: genderController, title:"Select your gender",
                  hint: "Select your gender",
                  inputType:TextInputType.name,
                  isValid: (val) {
                    setState(() {_genderValid = val;});
                  },
                  errorLengthMsg: 'should be at least 2 letters',
                  errorTextType: 'Eg. male',
                  requiredMessage: 'is required',
                  label: 'Gender',
                  textLength:2,
                  regexp: CustomRegexp.nameRegExp,
                 // onTap: () => genderSelection(),
                ),
              ),

              gap(),
              ctaBtn2(title:'Proceed',
                  tap: () {
                   _stepTwo();
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

  _stepTwo(){
    // if(_firstNameValid && _lastNameValid && _middleNameValid && _emailValid && _phoneValid && _genderValid){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNewUserTwoScreen()));
    // }
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          const SignUpNewUserTwoScreen()));
  }

  SizedBox gap() => gapH(12.h);

  void genderSelection() async{
    await openBottomSheet(context, SelectTextBottomSheet(titleText: "Select gender", items: [SelectionModal(title: "Male", id: "1"), SelectionModal(title: "Female", id: "2")], height: 400.h, ),)
        .then((value) {
      if (value is SelectionModal){
        genderController.text = value.title;
        _genderValid = true;
        //bloc.validation.setGender(value.title);
      }
    });
  }






}
