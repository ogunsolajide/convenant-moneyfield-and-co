import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:moneyfield/utitlity/widgets.dart';

import '../colors.dart';

class CustomTextFieldWithValidation extends StatefulWidget {
  final int textLength;
  final TextEditingController controller;
  final String title,hint,errorLengthMsg,errorTextType,requiredMessage,label;
  final RegExp regexp;
  final Function(bool) isValid;
  final TextInputType inputType;
  String?  labelText = "";
  bool? obsureText;
  bool? enabled = true;
  bool? isPhoneNumber = false;
  CustomTextFieldWithValidation({
    super.key, required this.controller, required this.title,
     this.obsureText, required this.isValid,
    required this.inputType, this.enabled,this.isPhoneNumber, this.labelText,
    required this.hint,
    required this.errorLengthMsg, required this.errorTextType,
    required this.requiredMessage, required this.label, required this.textLength, required this.regexp
  });

  @override
  State<CustomTextFieldWithValidation> createState() => _CustomTextFieldWithValidationState();
}

class _CustomTextFieldWithValidationState extends State<CustomTextFieldWithValidation> {
  final double _height = 60.h;
  bool isTextFieldActive = false;
  bool isTextFieldNotEmpty = false;
  bool showSecondTitle = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMsg = '';
  bool obscurePassword = true;
  // bool isPassword = false;
  bool valid = false;
  void _returnValidValue() {
    setState(() {
      bool validValue = true;
      valid = true;
      widget.isValid(validValue);
    });
  }
  void _returnValidValueFalse() {
    setState(() {
      bool validValue = false;
      valid = false;
      widget.isValid(validValue);
    });
  }
  void validateInput(){
    String txt = widget.controller.text;
    if (txt.isEmpty) {
      setState(() {
        errorMsg = "${widget.label} ${widget.requiredMessage}";
        _returnValidValueFalse();
      });
    }
    else if (txt.length < widget.textLength) {
      setState(() {
        errorMsg = "${widget.label} ${widget.errorLengthMsg}";
        // widget.txtValidated = false;
        _returnValidValueFalse();
      });
    }
    else if (widget.regexp.hasMatch(txt)== false) {
      setState(() {
        errorMsg = widget.errorTextType;
        _returnValidValueFalse();
      });

    }
    else{
      setState(() {
        errorMsg = "";
        _returnValidValue();
      });
    }// return null if password is valid
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _height,width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              width: 0.5,
              color: errorMsg.isNotEmpty ?
                   Colors.red
                  :valid?AppColors.primary:AppColors.neutral40
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showSecondTitle?
              Container(alignment: Alignment.centerLeft,
                child: ctmTxtAct(
                    (widget.title.length > 80 )?
                    '${widget.title. substring(0,80)}...':
                    widget.title,
                    AppColors.neutral300,
                    14.sp,maxLines: 1,textAlign: TextAlign.start),
              ):const SizedBox.shrink(),
              Expanded(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isPhoneNumber == true?
                    showSecondTitle?
                    ctmTxtAct("(+234)  ",AppColors.black,14.sp,
                        weight: FontWeight.w500):SizedBox.shrink():SizedBox.shrink(),

                    Expanded(
                      child: TextFormField(
                        key: _formKey,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.start,
                        controller: widget.controller,
                        cursorHeight: 15.h,
                        cursorColor:AppColors.primary,
                        keyboardType: widget.inputType,
                        maxLength: widget.isPhoneNumber == true?10:null,
                        style: TextStyle(
                          color: AppColors.neutral800, fontSize: 15.h,
                          fontFamily: 'actionSansRegular',
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            validateInput();
                          }
                          else if (value.isEmpty) {
                            setState(() {
                              errorMsg = '';
                              // widget.txtValidated = false;
                              validateInput();
                              //_returnValidValueFalse();
                            });
                          }
                        },
                        // onEditingComplete: (){
                        //   isTextFieldActive = false;
                        //   checkTextFieldStatus();
                        // },
                        // onFieldSubmitted: (val){
                        //   isTextFieldActive = false;
                        //   checkTextFieldStatus();
                        // },
                        // //onChanged: widget.onChange,
                        onTap: (){
                          setState(() {
                            isTextFieldActive = true;
                          });
                          checkTextFieldStatus();
                        },
                        onTapOutside: (val){
                          isTextFieldActive = false;
                          checkTextFieldStatus();
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: showSecondTitle?"":widget.hint,
                          hintStyle:TextStyle(
                            color: AppColors.neutral300, fontSize: 13.sp,
                            fontFamily: 'actionSansRegular',
                            fontWeight: FontWeight.normal,
                          ),
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(bottom: 10,top: 0),
                          border:  InputBorder.none,

                        )

                        ,
                      ),
                    ),
                    widget.isPhoneNumber == true?
                    showSecondTitle?
                    Image.asset(AppImages.flag,width: 15.h,height:15.h,):SizedBox.shrink()
                        :SizedBox.shrink()
                  ],
                ),
              ),
              //widget.details.isNotEmpty?
            ],
          ),
        ),
        gapH(5.h),
        errorMsg.isNotEmpty ?
        Align(alignment: Alignment.centerRight,
            child: ctmTxtAct(errorMsg,Colors.red,11.sp,weight:FontWeight.normal))
            : SizedBox(),

      ],
    );
  }
  checkTextFieldStatus(){
    if(isTextFieldActive){
      setState(() {
        showSecondTitle = true;
      });
    }else if(widget.controller!.text.isNotEmpty){
      setState(() {
        showSecondTitle = true;
      });
    }else if(widget.controller!.text.isEmpty){
      setState(() {
        showSecondTitle = false;
      });
    }
  }
}