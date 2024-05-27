import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/startScreens/welcomeScreen.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Moneyfield MFB',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.white,
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: AppColors.white,
              ),
             // scaffoldBackgroundColor: AppColors.white,
              primarySwatch: Colors.blue,
              // useMaterial3: true,
            ),

            home: splashScreen(),
          );
        }
    );
  }
}

Widget splashScreen() {
  return darkStatusBar(
      AnimatedSplashScreen(
        duration: 2000,
        splash: SafeArea(top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
             SizedBox(width: double.infinity,
                 child: Image.asset(AppImages.splashImage, width: 291.w, height: 143.h,)),
              const Spacer(),
              ctmTxtSF("Powered by CWG-PLC",AppColors.neutral600,14.sp),
              SizedBox(height: 20.h,),
          
            ],
          ),
        ),
        // splash: Image.asset(
        //   "assets/png/splash.png",
        //   width: 197.w, height: 48.h,),
        splashIconSize: 800.h,
        centered: false,
        nextScreen:const WelcomeScreen(),
        // splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: AppColors.green25EE,
      )
  );
}

AnnotatedRegion<SystemUiOverlayStyle> darkStatusBar(child) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark
    ),
    child: child,
  );
}
