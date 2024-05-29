import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';

import '../colors.dart';
import '../widgets.dart';

class SuccessAlertBottomSheet extends StatefulWidget {
  final bool isSuccessful;
  final String type,description;
  final void Function() shareTap, downloadTap,returnTap;
  const SuccessAlertBottomSheet({super.key,
    required this.isSuccessful, required this.type,
    required this.description, required this.shareTap,
    required this.downloadTap, required this.returnTap});

  @override
  State<SuccessAlertBottomSheet> createState() => _SuccessAlertBottomSheetState();
}

class _SuccessAlertBottomSheetState extends State<SuccessAlertBottomSheet>  with TickerProviderStateMixin {
  //late FlutterGifController controller;
  //late GifController controller = GifController(vsync: this);

  @override
  void initState() {
    //controller = FlutterGifController(vsync: this, duration: const Duration(milliseconds: 200), reverseDuration: const Duration(milliseconds: 200),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 600.h,
      //color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          gapH(40.h),
          Lottie.asset('assets/json/success.json', height: 200.w, width: 200.h),
          ctmTxtAct(widget.type, AppColors.black, 24.sp),
          gapH(15.h),
          SizedBox(width: 300.w,
            child: ctmTxtAct(widget.description,
                AppColors.black1f, 16.sp,maxLines: 2,
                textAlign: TextAlign.center,),
          ),
          gapH(50.h),
          shareOrDownloadReceiptBtn(shareTap: widget.shareTap,
              downloadTap: widget.downloadTap),
          gapH(30.h),
          Padding(
            padding: screenPad(),
            child: ctaBtn(title: "Return to Dashboard", tap: widget.returnTap),
          ),
          //greenBtn(title: "Return to Dashboard", tap:widget.returnTap),
          gapH(30.h),
        ],
      ),
    );
  }
  Row shareOrDownloadReceiptBtn({required void Function() shareTap,required void Function() downloadTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: shareTap,
          child: Column(
            children: [
              greenIconHolder(AppImages.share,),
              gapH(10.h),
              ctmTxtAct("Share",AppColors.black,16.sp)
            ],
          ),
        ),
        gapW(83.w),
        GestureDetector(onTap: downloadTap,
          child: Column(
            children: [
              greenIconHolder(AppImages.download),
              gapH(10.h),
              ctmTxtAct("Copy",AppColors.black,16.sp)
            ],
          ),
        ),

      ],);
  }

  Container greenIconHolder(image) {

    return Container(
      width: 44.h,height: 44.h,
      decoration: BoxDecoration(
          color: AppColors.primaryInactive,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Center(child:


      Image.asset(image,width: 24.w,height: 24.h, color:AppColors.primary ,),
      ),);
  }
}