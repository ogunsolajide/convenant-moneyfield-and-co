import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/loginFLow/loginScreen.dart';
import 'package:moneyfield/startScreens/signUpPhoneNumber.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utitlity/constants.dart';
import '../utitlity/widgets.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentIndex = 0;
  late PageController _controller;

  int counter = 0;
  late Timer _timer;

  updateCounter() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      // You can also call here any function.
      if (counter < 3) {
        if (counter == 2) {
          _controller.jumpTo(0);
          counter = 0;
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
          counter++;
        }
      }
    });
  }

  stopCounter() {
    _timer.cancel();
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    updateCounter();
    super.initState();
  }

  @override
  void dispose() {
    // _controller.jumpTo(0);
    _controller.dispose();
    stopCounter();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
          Container(
            height: 600.h,
            child: PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return imageTxtAndDescriptionWidget(
                  image: contents[i].image,
                  title: contents[i].title,
                  description: contents[i].discription,
                  height:  i==2?376.h:320.h,
                  width: i==2? 277.w:double.infinity
              );
            },),
          ),

      indicator(_controller),
      const Spacer(),
      loginSignUpBtn(
          loginTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                const LoginScreen()));
          },
          signUpTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                const SignUpPhoneNumberScreen()));

          }
      ),

      gapH(25.h),


      ],),
    );
  }


}
