import"package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:moneyfield/utitlity/textWidget.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "colors.dart";
Column imageTxtAndDescriptionWidget({required String image,required String title,
  required String description,required double height,double width=double.infinity,}) {
  return Column(children: [
    Container(height: 417.h,width: double.infinity,
      color: AppColors.green50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          SizedBox(height: height,
            child:
            Image.asset(image,width:width,height: height,
              fit: BoxFit.fill,
            ),
          ),
        ],),

    ),
    const Spacer(),
    titleDescriptionWidget(title: title,description:description),
    const Spacer(),
  ],);
}

Column titleDescriptionWidget({required String title, required String description}) {
  return Column(children: [
    SizedBox(width: 309.w,
      child: ctmTxtCrtB(title,28.sp,maxLines: 2,textAlign: TextAlign.center,),
    ),
    gapH(25.h),
    SizedBox(width: 343.w,
      child: ctmTxtSF(description,
        AppColors.neutral600,14.sp,maxLines: 2,textAlign: TextAlign.center,),
    ),
  ],);
}

SmoothPageIndicator indicator(PageController controller) {
  return SmoothPageIndicator(
    controller: controller,
    count: 3,
    effect: ExpandingDotsEffect(
        dotWidth: 12.w,
        dotHeight: 7.5.h,
        radius: 2.h,
        activeDotColor: AppColors.primary,
        dotColor: AppColors.primaryInactive,
        expansionFactor: 2

    ),
    // effect: const WormEffect(
    //   dotHeight: 16,
    //   dotWidth: 16,
    //   type: WormType.thinUnderground,
    // ),
  );
}
GestureDetector ctaBtn({required String title,required Function()tap}) {
  return GestureDetector(onTap: tap,
    child: Container(
      width: double.infinity,height: 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.primary,
      ),
      child: Center(child: ctmTxtAct(title,AppColors.white,14.sp),),
    ),
  );
}
GestureDetector ctaBtn2({required String title,required Function()tap,required bool active}) {
  return GestureDetector(onTap: tap,
    child: Container(
      width: double.infinity,height: 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: active? AppColors.primary:AppColors.primary.withOpacity(0.50),
      ),
      child: Center(child: ctmTxtAct(title,AppColors.white,14.sp),),
    ),
  );
}
GestureDetector ctaBtn3({required String title,required Function()tap,}) {
  return GestureDetector(onTap: tap,
    child: Container(
      width: double.infinity,height: 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color:AppColors.primary,
      ),
      child: Center(child: ctmTxtAct(title,AppColors.white,14.sp),),
    ),
  );
}
Column pageTitleDescription({required String title,required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ctmTxtCrtB(title,22.sp),
      gapH(2.h),
      ctmTxtAct(description,AppColors.neutral100,14.sp,maxLines: 2)
    ],
  );
}

SizedBox backAppBar({required Function()backTap}) {
  return SizedBox(height: 45.h,
    child: Row(children: [
      GestureDetector(onTap: backTap,
          child: Icon(Icons.arrow_back_ios_new_sharp,size: 18.h,color: AppColors.black,))

    ],),
  );
}

EdgeInsets screenPad() => EdgeInsets.symmetric(horizontal: 13.w);

Container loginSignUpBtn({required Function()loginTap, required Function()signUpTap}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 13.w),
    child: Row(children: [
      GestureDetector(onTap: loginTap,
        child: Container(
          height: 43.h,width: 161.w,
          decoration: BoxDecoration(
            color: AppColors.primary25,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(child: ctmTxtAct("Login",AppColors.black,14.sp),),
        ),
      ),
      Spacer(),
      GestureDetector(onTap: signUpTap,
        child: Container(
          height: 43.h,width: 161.w,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(child: ctmTxtAct("Sign up",AppColors.white,14.sp),),
        ),
      ),

    ],),
  );
}

SizedBox gapH(height) => SizedBox(height: height,);
SizedBox gapW(width) => SizedBox(width: width,);