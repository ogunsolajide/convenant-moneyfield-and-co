import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/enableBiometricsScreen.dart';
import 'package:moneyfield/utitlity/dialogs/customSuccessDialog.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../utitlity/colors.dart';
import '../../utitlity/widgets.dart';


class ConfirmTransactionPinScreen extends StatefulWidget {
  final String firstPin;
  const ConfirmTransactionPinScreen({super.key, required this.firstPin});

  @override
  State<ConfirmTransactionPinScreen> createState() => _ConfirmTransactionPinScreenState();
}

class _ConfirmTransactionPinScreenState extends State<ConfirmTransactionPinScreen> {
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
                      title: 'Confirm Your Transaction pin',
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
                        if(pin.toString() == widget.firstPin){
                          setState(() {
                            _passCodeValid =true;
                          });
                        }else if(pin != widget.firstPin){
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
                  ),
                  gapH(30.h),
                  keepCodeWidget(),

                ],),)),

                ctaBtn2(title:'Confirm Transaction Pin',
                    tap: () {
                      if(_passCodeValid) {
                        _openPinCreatedDialog();
                      }
                      print("first password ${widget.firstPin}");
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
  _openPinCreatedDialog() async{
    FocusManager.instance.primaryFocus?.unfocus();
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomSuccessDialog(title: "Transaction Pin Created", description: "You have created your Transaction pin successfully", showActionBtn: false,);
      },
    );
    _openSetBiometricsScreen();

  }
  _openSetBiometricsScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
        const EnableBiometricsScreen()));

  }
}
