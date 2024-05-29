import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/widgets.dart';

class SetupTransactionPinScreen extends StatefulWidget {
  const SetupTransactionPinScreen({super.key});

  @override
  State<SetupTransactionPinScreen> createState() => _SetupTransactionPinScreenState();
}

class _SetupTransactionPinScreenState extends State<SetupTransactionPinScreen> {
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
                      title: 'Setup Your transaction pin',
                      description:'Enter your desired 4 digit pin'
                  ),
                ),
                gapH(22.h),
                Expanded(child: SingleChildScrollView(child: Column(children: [
                  gapH(22.h),
                  PinInputTextField(
                    pinLength: 4,controller: controller,
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
                      if(pin.length >3){
                        setState(() {
                          _passCodeValid =true;
                        });
                      }else{
                        _passCodeValid = false;
                      }
                      // You can handle the OTP input here
                      print("Pin: $pin");
                    },
                  ),
                  gapH(30.h),
                  keepCodeWidget(),

                ],),)),

                ctaBtn2(title:'Confirm Pin',
                    tap: () {
                      if(_passCodeValid) {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>
                        //      ConfirmPasscodeScreen(
                        //      firstPasscode: controller.text??"")));
                        Navigator.pop(context,controller.text);
                      }
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
}
