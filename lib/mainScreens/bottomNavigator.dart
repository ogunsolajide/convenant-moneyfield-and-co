import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/mainScreens/home/homeScreen.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';

import '../utitlity/colors.dart';


class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator>  with TickerProviderStateMixin{
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(),
      Container(),
      Container(),
      Container(),
    ];
    tabController = TabController(length: 4, vsync: this);
  }

  _goToHistory(){
    tabController.animateTo(
      2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }
  List<Widget> screens = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: screens),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            height: 65.h,width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.neutral50,width: 0.5.h)
              )
            ),
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: labelStyle(),
                //indicatorWeight: 35.h,
                indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(bottom: 65.h,left: 0.w,right: 0.w),
                    borderSide: BorderSide(color: AppColors.primary,width: 1.h)
                 ),
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.neutral100,
                controller: tabController,

                tabs: [
                  Tab(
                    iconMargin: bottoMargin(),
                    icon: selectedIndex == 0
                        ? iconAsset2(AppImages.homeFilled)
                        :  iconAsset(AppImages.home),
                    child:  const Text(
                      'Home',
                      // style: labelStyle(),
                    ),
                  ),
                  Tab(
                    iconMargin: bottoMargin(),
                    icon: selectedIndex == 1 ?
                    iconAsset2(AppImages.cardFilled)
                        :  iconAsset(AppImages.card),
                    child:  const Text(
                      'Card',
                      //style: labelStyle(),
                    ),
                  ),
                  Tab(
                    iconMargin: bottoMargin(),
                    icon: selectedIndex == 2 ?
                    iconAsset2(AppImages.investmentFilled)
                        :  iconAsset(AppImages.investment),
                    child:  const Text(
                      'Investment',
                      maxLines: 1,
                      // style: labelStyle(),
                    ),
                  ),
                  Tab(
                    iconMargin: bottoMargin(),
                    icon: selectedIndex == 3 ?
                    iconAsset2(AppImages.profileFilled)
                        :  iconAsset(AppImages.profile),
                    child:  const Text(
                      'Profile',
                      // style: labelStyle(),
                    ),
                  ),


                ]),
          ),
        ));
  }

  EdgeInsets bottoMargin() => EdgeInsets.only(bottom: 5.h);

  TextStyle labelStyle() {
    return  TextStyle(
      fontSize: 12.sp,
      fontFamily: 'creatoDisplayMedium',
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25.sp
    );
  }
  Image iconAsset2(image) {
    return Image.asset(image,
      width: 22.w,height: 22.h,fit:BoxFit.contain,
      //color: AppColors.primary,
    );
  }
  Image iconAsset(image) {
    return Image.asset(image,
        width: 22.w,height: 22.h,fit:BoxFit.contain);
  }
}
// BottomAppBar(
// //color: Colors.red,
// elevation: 0,
// surfaceTintColor: Colors.white,
// shadowColor: Colors.white,
// color: Colors.white,
// padding: EdgeInsets.zero,
// height: 79.h,