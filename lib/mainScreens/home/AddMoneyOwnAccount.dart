import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/customWidgets/normalCardWidget.dart';
import 'package:moneyfield/utitlity/textWidget.dart';

import '../../utitlity/constants.dart';
import '../../utitlity/widgets.dart';

class AddMoneyOwnAccountScreen extends StatefulWidget {
  final int initialSelectedIndex;
  const AddMoneyOwnAccountScreen({super.key, required this.initialSelectedIndex});

  @override
  State<AddMoneyOwnAccountScreen> createState() => _AddMoneyOwnAccountScreenState();
}

class _AddMoneyOwnAccountScreenState extends State<AddMoneyOwnAccountScreen> {
  late PageController accountPageController = PageController();
  final CarouselController controller = CarouselController();
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
      body: Column(
        children: [
          backAppBarAndTitle(backTap: () { Navigator.pop(context); }, title: 'Fund account'),
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
              width: double.infinity,height: 1000.h,
              color: AppColors.neutral10,
              padding: screenPad(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH(10.h),
                ctmTxtAct("Fund from your debit card",AppColors.neutral500,14.sp),
                  gapH(230.h),
                  gapH(160.h),
                  ctaBtn(title: "Proceed", tap:(){}),
                  gapH(60.h),
              ],),
            )
          ],),))


      ],),
    );
  }

}
