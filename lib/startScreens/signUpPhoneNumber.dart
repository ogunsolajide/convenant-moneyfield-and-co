import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/verifyPhoneNumberScreen.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/constants.dart';
import 'package:moneyfield/utitlity/customWidgets/customTextFieldWithValidation.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

class SignUpPhoneNumberScreen extends StatefulWidget {
  const SignUpPhoneNumberScreen({super.key});

  @override
  State<SignUpPhoneNumberScreen> createState() => _SignUpPhoneNumberScreenState();
}

class _SignUpPhoneNumberScreenState extends State<SignUpPhoneNumberScreen> {
  TextEditingController controller = TextEditingController();
  bool _phoneValid = false;
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
                    title: 'What’s Your Phone Number?',
                    description: 'Enter the phone number you want to use for this account.'
                ),
                gapH(22.h),

                Expanded(child: SingleChildScrollView(child: Column(children: [
                  gapH(22.h),
                  CustomTextFieldWithValidation(
                    controller: controller,isPhoneNumber: true,
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
                  ),
                  gapH(22.h),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color:AppColors.primaryInactive
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppImages.referral,
                          width: 18.h,height: 18.h,color: AppColors.primary,),
                        gapW(20.w),
                        ctmTxtAct("Referral Code",AppColors.neutral500,14.sp),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down,size: 18.sp,color: AppColors.black,)
                      ],
                    ),
                  ),


                ],),)),

                ctaBtn(title:'Proceed',
                    tap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          const VerifyPhoneNumberScreen()));
                    }
                ),
                gapH(30.h),
                termsAndConditions(),
                gapH(30.h),
              ],),
            ),
          )


        ],),
      ),
    );
  }




}
