import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utitlity/colors.dart';
import '../../../utitlity/constants.dart';
import '../../../utitlity/customWidgets/normalCardWidget.dart';
import '../../../utitlity/textWidget.dart';
import '../../../utitlity/widgets.dart';

class TransferFundsOwnAccountScreen extends StatefulWidget {
  final initialSelectedIndex;
  const TransferFundsOwnAccountScreen({super.key,required this.initialSelectedIndex});

  @override
  State<TransferFundsOwnAccountScreen> createState() => _TransferFundsOwnAccountScreenState();
}

class _TransferFundsOwnAccountScreenState extends State<TransferFundsOwnAccountScreen> {
  late PageController accountPageController = PageController();
  final CarouselController controller = CarouselController();
  bool isBeneficiaryOpen = false;
  int _currentAccountIndex = 0;
  final double cardHeight = 130.h;

  @override
  void initState() {
    super.initState();
    _currentAccountIndex = widget.initialSelectedIndex;
    accountPageController = PageController(initialPage: _currentAccountIndex);
  }

  @override
  void dispose() {
    accountPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
        backAppBarAndTitle(backTap: () { Navigator.pop(context); }, title: 'Transfer funds'),
        Expanded(child: SingleChildScrollView(child: Column(children: [
          gapH(10.h),
          customCarouselSlider(context,
            enlargeFactor: 0.25,
            height: cardHeight,
            initialPage: _currentAccountIndex,
            onPageChanged: (integer, page) {
              _currentAccountIndex = integer;
              setState(() {});
            },
            itemCount: demoAccounts.length,
            itemBuilder: (context, int index, int realIndex) {
              UserAccount account = demoAccounts[index];
              return NormalCardWidget(
                height: cardHeight,
                active: index == _currentAccountIndex,
                accountNumber:account.accountnumber??"",
                productName: account.productName??"",
                balance: account.balance.toString()??"",
              );
            },
          ),
          gapH(20.h),
          indicator2(list: demoAccounts, currentIndex: _currentAccountIndex),
          gapH(20.h),
          Container(
            width: double.infinity,height: 1000.h, color: AppColors.neutral10,
            //padding: screenPad(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH(10.h),
                dropDownOptionWidget(
                    title: 'Select beneficiary account',
                    tapArrow:(){
                      setState(() {
                        isBeneficiaryOpen = !isBeneficiaryOpen;
                      });
                    },
                    isOpen: isBeneficiaryOpen
                ),
                gapH(20.h),
                customCarouselSlider(context,
                  enlargeFactor: 0.20,
                  height: 106.h,
                  initialPage: _currentAccountIndex,
                  onPageChanged: (integer, page) {
                    _currentAccountIndex = integer;
                    setState(() {});
                  },
                  itemCount: demoAccounts.length,
                  itemBuilder: (context, int index, int realIndex) {
                    UserAccount account = demoAccounts[index];
                    return beneficiaryCard(
                        isSelected: _currentAccountIndex == index,
                        accountType: account.productName??"",
                        balance: account.balance.toString()??"",
                        name: "",
                        number: account.accountnumber??""
                    );
                  },
                ),

                gapH(230.h),
                gapH(160.h),
                ctaBtn(title: "Proceed", tap:(){}),
                gapH(60.h),
              ],),
          ),
        ],),)),
        // Container(padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 20.h),
        //     child: ctaBtn(title: "Confirm and Proceed", tap: (){}))
      ],),
    );
  }

  Container beneficiaryCard({required bool isSelected,
    required String accountType,
    required String balance,
    required String name,
    required String number
  }) {
    return Container(
                    width: 333.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                    margin: EdgeInsets.only(left: 10.w,right: 1.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color:isSelected? AppColors.lightGreen500:Colors.transparent,
                      border:isSelected?Border.all(color: Colors.transparent): Border.all(color: AppColors.primaryInactive,width: 1.0.r)
                    ),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ctmRoundCheckBox(check: isSelected),
                          gapW(10.w),
                          ctmTxtAct(accountType,isSelected?AppColors.white:AppColors.neutral100,
                              14.sp,weight: FontWeight.w500),
                          gapW(20.w),
                          Expanded(child:ctmTxtAct(balance,isSelected?AppColors.white:AppColors.neutral200,14.sp,
                              weight: FontWeight.w600,maxLines: 1,
                            textAlign: TextAlign.end
                          ), )

                        ],
                      ),
                      const Spacer(),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        ctmTxtAct("Account name",isSelected?AppColors.white:AppColors.neutral100,12.sp),
                        gapW(20.w),
                        Expanded(
                            child: ctmTxtAct(name,
                                isSelected?AppColors.white:AppColors.neutral700,14.sp,maxLines: 1,textAlign: TextAlign.end)
                        ),

                      ],),
                      gapH(1.h),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ctmTxtAct("Account number",isSelected?AppColors.neutral20:AppColors.neutral100,12.sp),
                          gapW(20.w),
                          Expanded(
                              child: ctmTxtAct(number,
                                  isSelected?AppColors.white:AppColors.neutral700,14.sp,maxLines: 1,textAlign: TextAlign.end)
                          ),

                        ],),
                    ],),
                  );
  }


}
