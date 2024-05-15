import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/setUptransactionPinScreen.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKeyPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeypassword = GlobalKey<FormState>();
  TextEditingController phoneControl = TextEditingController();
  TextEditingController userControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  bool _phoneValid = false;
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
                ctmTxtCrtB("Log in to your account",22.sp),
                gapH(25.h),
                Row(
                  children: [
                    btnIconText(title: 'Phone number', icon: Icons.phone_outlined,
                        tap: () {
                          _switch(0);
                        }, active: selectedIndex ==0
                    ),
                    gapW(20.w),
                    btnIconText(title: 'Username', icon: Icons.person_outline,
                        tap: () {
                          _switch(1);
                        }, active: selectedIndex==1
                    ),
                  ],
                ),
                gapH(25.h),
                selectedIndex ==0?
                CustomTextFieldWithValidation(
                  key: _formKeyPhone,
                  controller: phoneControl,isPhoneNumber: true,
                  title:"Enter your phone number",
                  hint: "Enter your phone number",
                  inputType:TextInputType.phone,
                  isValid: (val) {
                    setState(() {_phoneValid = val;});
                  },
                  errorLengthMsg: 'should be at least 10 numbers',
                  errorTextType: 'Eg. 8120450789',
                  requiredMessage: 'is required',
                  label: 'Phone Number',
                  textLength:9,
                  regexp: CustomRegexp.phoneNumberExp,
                )
                    :
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            SetUpTransactionPinScreen()));
                  }, active: true
              ),
              MediaQuery.of(context).viewInsets.bottom > 0 ?
                  SizedBox.shrink():
              Column(children: [
                gapH(30.h),
                termsAndConditions(),
              ],),
              gapH(20.h),
            ],),
          )


        ],),
      ),
    );
  }

  Column titleIcon() {
    return Column(
                children: [
                  gapH(190.h),
                  Align(alignment: Alignment.centerLeft,
                      child: Image.asset(AppImages.logo,width: 50.w,height: 50.h,)),
                  gapH(25.h),
                ],
              );
  }
  _switch(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}
