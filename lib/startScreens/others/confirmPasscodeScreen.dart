import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/others/profileCreatedScreen.dart';
import 'package:moneyfield/utitlity/dialogs/customSuccessDialog.dart';
import 'package:moneyfield/utitlity/dialogs/passwordCreatedDialog.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/widgets.dart';


class ConfirmPasscodeScreen extends StatefulWidget {
  final String firstPasscode;
  const ConfirmPasscodeScreen({super.key, required this.firstPasscode});

  @override
  State<ConfirmPasscodeScreen> createState() => _ConfirmPasscodeScreenState();
}

class _ConfirmPasscodeScreenState extends State<ConfirmPasscodeScreen> {
  TextEditingController controller = TextEditingController();
  bool _passCodeValid = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBar(backTap: () {Navigator.pop(context); }),
          Expanded(
            child: Padding(padding: screenPad(),
              child: Column(children: [
                gapH(12.h),
                SizedBox(width: double.infinity,
                  child: pageTitleDescription(
                      title: 'Confirm Your Passcode',
                      description:'Enter your desired 6 digit passcode'
                  ),
                ),
                gapH(22.h),
                Expanded(child: SingleChildScrollView(child: Column(children: [
                  gapH(22.h),
                  PinInputTextField(
                    pinLength: 6,controller: controller,
                    keyboardType: TextInputType.number,autoFocus: true,
                    decoration: BoxLooseDecoration(
                      bgColorBuilder: PinListenColorBuilder(AppColors.neutral20,AppColors.neutral20,),
                      strokeColorBuilder: PinListenColorBuilder(Colors.transparent,Colors.transparent),
                      strokeWidth: 0,gapSpace: 10,
                      radius: Radius.circular(6.r),
                      textStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 28.sp,
                        fontFamily: 'creatoDisplayBold',
                      ),
                    ),
                    onSubmit: (pin){

                    },
                    onChanged: (pin) {
                      if(pin.toString() == widget.firstPasscode){
                        setState(() {
                          _passCodeValid =true;
                        });
                      }else if(pin != widget.firstPasscode){
                        setState(() {
                          _passCodeValid =false;
                        });
                      }
                      else{
                        _passCodeValid = false;
                      }
                      // You can handle the OTP input here
                      print("Pin: $pin");
                    },
                  ),
                  gapH(30.h),
                  keepCodeWidget(),

                ],),)),

                ctaBtn2(title:'Setup Passcode',
                    tap: () {
                      if(_passCodeValid) {
                        _openPasscodeCreatedDialog();
                      }
                      print("first password ${widget.firstPasscode}");
                    }, active: _passCodeValid
                ),
                gapH(30.h),
              ],),
            ),
          )


        ],),
      ),
    );
  }
  _openPasscodeCreatedDialog() async{
    FocusManager.instance.primaryFocus?.unfocus();
   var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSuccessDialog(title: "Passcode created", description: "You have created your passcode", showActionBtn: false);
      },
    );
   Navigator.pop(context,true);

  }
  // _openProfileCreatedScreen() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //       const ProfileCreatedScreen()));
  //
  // }
}
