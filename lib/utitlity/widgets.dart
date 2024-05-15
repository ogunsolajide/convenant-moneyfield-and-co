import "package:dots_indicator/dots_indicator.dart";
import"package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:moneyfield/utitlity/textWidget.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "colors.dart";
import "iconsImages.dart";
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
        color:AppColors.primaryInactive,
      ),
      child: Center(child: ctmTxtAct(title,AppColors.primary,14.sp),),
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

Widget backAppBar({required Function()backTap}) {
  return Container(height: 82.h,
    color: AppColors.neutral10,
    padding: screenPad(),
    child: Column(
      children: [
        Spacer(),
        Row(children: [
          GestureDetector(onTap: backTap,
              child: Icon(Icons.arrow_back_ios_new_sharp,size: 18.h,color: AppColors.black,))

        ],),
        gapH(10.h),
      ],
    ),
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
Container resendOtpWidget({required Function()tap}) {
  return Container(
    height: 44.h,width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 14.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color:AppColors.primaryInactive
    ),
    child: Row(children: [
      Image.asset(AppImages.caution,width: 14.w,height: 14.h,),
      gapW(5.w),
      ctmTxtAct("Didn’t get the OTP?",AppColors.neutral500,14.sp),
      Spacer(),
      GestureDetector(onTap: tap,
        child: Row(children: [
          Image.asset(AppImages.resend,width: 14.w,height: 14.h,),
          ctmTxtAct(" Resend OTP",AppColors.primary,12.sp),
        ],),
      ),

    ],),
  );
}
Container keepCodeWidget() {
  return Container(
    height: 44.h,width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 14.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color:AppColors.primaryInactive
    ),
    child: Row(children: [
      Image.asset(AppImages.caution,width: 14.w,height: 14.h,),
      gapW(5.w),
      ctmTxtAct("Remember to keep this code to yourself",AppColors.neutral500,14.sp),
      Spacer(),

    ],),
  );
}
Widget btnIconText({required String title,required IconData icon,required Function()tap,required bool active}) {
  return GestureDetector(
    onTap: tap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.sp),
          color: active? AppColors.primary:AppColors.primary25
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 14.sp,color:active? AppColors.white:AppColors.neutral800,),
          gapW(6.w),
          ctmTxtAct(title,active? AppColors.white:AppColors.neutral800,14.sp)
        ],),
    ),
  );
}
RichText termsAndConditions() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: 'By clicking on "Create Profile"',
      style: TextStyle(
        color: AppColors.neutral700,
        fontSize: 12.sp,
        fontFamily: 'actionSansRegular',
        fontWeight: FontWeight.normal,
        letterSpacing: -0.25.sp,
      ),

      children: [
        TextSpan(
          text: ', You agree to MoneyField’s ',
        ),
        TextSpan(
          text: 'Terms and Conditions',
          style: TextStyle(color: AppColors.primary),
          // Add onTap handler if needed
        ),
        TextSpan(
          text: ' and ',
        ),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(color: AppColors.primary),
          // Add onTap handler if needed
        ),
      ],
    ),);
}

SizedBox gapH(height) => SizedBox(height: height,);
SizedBox gapW(width) => SizedBox(width: width,);


Container borderShell(widget) {
  return Container(height: 19.5,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary300,width: 0.5.r),
      ),
      child: widget
  );
}
SafeArea homeAppBar({required Function() profileTap,required Function() idCardTap,required Function() notificationTap}) {
  return SafeArea(top: true,
    child: Container(padding: screenPad(),
      child: Column(
        children: [
          gapH(12.h),
          Row(children: [
            GestureDetector(onTap: profileTap,
              child: Image.asset(AppImages.profile,
                width: 35.w,height: 35.w,color: AppColors.neutral600,),
            ),
            const Spacer(),
            GestureDetector(onTap: idCardTap,
              child: Image.asset(AppImages.idCard,width: 18.w,height: 18.h,
              ),
            ),
            gapW(10.w),
            GestureDetector(onTap: notificationTap,
              child: Image.asset(AppImages.notificationActive,
                width: 18.w,height: 18.h,color: AppColors.neutral600,),
            ),

          ],),
        ],
      ),
    ),
  );
}

Widget homeItemOption({required Function() tap,required String title,required String icon}) {
  return GestureDetector(onTap: tap,
    child: Column(children: [
      Container(
        width: 40.w,height: 40.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.green25
        ),
        child: Center(child:
        Image.asset(icon,width: 24.w,height: 24.h,),
        ),
      ),
      gapH(14.h),
      ctmTxtAct(title,AppColors.neutral200,12.sp,weight: FontWeight.bold),
    ],),
  );
}

Padding homeSixOptionitems({required Function() billsTap,
  required Function() airtimeTap,required Function() dataTap,
  required Function() loansTap,required Function() moreTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 22.w),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        homeItemOption(
            tap: billsTap,
            title: "Bills",
            icon: AppImages.bills
        ),
        homeItemOption(
            tap: airtimeTap,
            title: "Airtime",
            icon: AppImages.airtime
        ),
        homeItemOption(
            tap: dataTap,
            title: "Data",
            icon: AppImages.data
        ),
        homeItemOption(
            tap: loansTap,
            title: "Loans",
            icon: AppImages.loans
        ),
        homeItemOption(
            tap: moreTap,
            title: "More",
            icon: AppImages.more
        ),
      ],
    ),
  );
}
Padding transactionHistoryHeader({required Function() transactionHistoryTap}) {
  return Padding(
    padding: screenPad(),
    child: Row(children: [
      ctmTxtAct("Recent Transactions",
        AppColors.neutral500,14.sp,),
      const Spacer(),
      GestureDetector(onTap: transactionHistoryTap,
        child: Container(
          height:27.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            border: Border.all(color:AppColors.primary500,width: 0.4.r),
            color: AppColors.green25,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month_outlined,size: 11.sp,color: AppColors.primary500,),
              gapW(5.w),
              ctmTxtAct("Transaction history",AppColors.black,11.sp,),
            ],),
        ),
      )

    ],),
  );
}
Widget transactionHistoryPreviewWidget({required bool isDebit,required Function() transferTap,
  required String title,required String date,required String amount}) {
  return Container(
    padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 20.h),
    child: GestureDetector(onTap: transferTap,
      child: Row(children: [
        Container(
          width: 32.w,height: 32.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDebit?AppColors.red25:AppColors.green50
          ),
          child: Center(child: Image.asset(
            isDebit?AppImages.debit:AppImages.credit,width: 18.w,height: 18.h,)),
        ),
        gapW(10.w),
        SizedBox(width: 193.w,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ctmTxtAct(title,AppColors.neutral600,14.sp,weight: FontWeight.bold,maxLines: 1),
              ctmTxtAct(date,AppColors.neutral200,11.sp,weight: FontWeight.normal),
            ],
          ),
        ),
        Spacer(),
        SizedBox(width: 100.w,
          child: ctmTxtAct(amount,AppColors.neutral600,14.sp,weight: FontWeight.bold,maxLines: 1
            ,textAlign: TextAlign.end,),
        ),

      ],),
    ),
  );
}

DotsIndicator indicator2({required list, required int currentIndex}) {
  return DotsIndicator(
    dotsCount: list.length ?? 0,
    position: currentIndex,
    decorator: DotsDecorator(
      activeColor: AppColors.primary,
      color: AppColors.green50,
      spacing: EdgeInsets.symmetric(horizontal: 5.w),
      shape: const Border(),
      size: Size(10.w,6.h),
      activeSize:  Size(20.w,6.h),
      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
    ),
  );
}
