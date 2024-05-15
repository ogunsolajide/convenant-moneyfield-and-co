import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/confirmTransactionPinScreen.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/widgets.dart';



class SetUpTransactionPinScreen extends StatefulWidget {
  const SetUpTransactionPinScreen({super.key});

  @override
  State<SetUpTransactionPinScreen> createState() => _SetUpTransactionPinScreenState();
}

class _SetUpTransactionPinScreenState extends State<SetUpTransactionPinScreen> {
  TextEditingController controller = TextEditingController();
  bool _tranPinValid = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(children: [
          backAppBar(backTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(context); }),
          Expanded(
            child: Padding(padding: screenPad(),
              child: Column(children: [
                gapH(12.h),
                SizedBox(width: double.infinity,
                  child: pageTitleDescription(
                      title: 'Setup Your Transaction pin',
                      description:'Create your desired 4 digit transaction pin'
                  ),
                ),
                gapH(22.h),
                Expanded(child: SingleChildScrollView(child: Column(children: [
                  gapH(22.h),
                  SizedBox(width: 250.w,
                    child: PinInputTextField(
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
                            _tranPinValid =true;
                          });
                        }else{
                          _tranPinValid = false;
                        }
                        // You can handle the OTP input here
                        print("Pin: $pin");
                      },
                    ),
                  ),
                  gapH(30.h),
                  keepCodeWidget(),

                ],),)),

                ctaBtn2(title:'Create Transaction Pin',
                    tap: () {
                      if(_tranPinValid ) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ConfirmTransactionPinScreen(firstPin: controller.text??"")));
                      }
                    }, active: _tranPinValid
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
