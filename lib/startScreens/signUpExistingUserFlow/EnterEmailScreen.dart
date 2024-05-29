import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utitlity/constants.dart';
import '../../utitlity/customWidgets/customTextFieldWithValidation.dart';
import '../../utitlity/widgets.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  TextEditingController controller = TextEditingController();
  bool _emailValid = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBar(backTap: () {Navigator.pop(context); }),
          Expanded(
            child: Padding(
              padding: screenPad(),
              child: Column(children: [
                gapH(12.h),
                pageTitleDescription(
                    title: 'What’s Your Email address?',
                    description: 'Enter your email address.'
                ),
                gapH(22.h),

                Expanded(child: SingleChildScrollView(child: Column(children: [
                  gapH(22.h),
                  CustomTextFieldWithValidation(
                    controller: controller,isPhoneNumber: false,
                    title:"Enter your email",
                    hint: "Enter your email",
                    inputType:TextInputType.emailAddress,
                    isValid: (val) {
                      setState(() {_emailValid = val;});
                    },
                    errorLengthMsg: 'should be at least 5 characters',
                    errorTextType: 'Eg. john@gmail.com',
                    requiredMessage: 'is required',
                    label: 'Email Address',
                    textLength:9,
                    regexp: CustomRegexp.emailExp,
                  ),
                  gapH(22.h),
                ],),)),

                ctaBtn(title:'Proceed',
                    tap: () {
                     Navigator.pop(context,true);
                    }
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
