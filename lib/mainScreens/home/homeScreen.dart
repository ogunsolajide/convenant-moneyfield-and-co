import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/mainScreens/home/AddMoneyOwnAccount.dart';
import 'package:moneyfield/mainScreens/home/transferFunds/selectTransferOptionScreen.dart';
import 'package:moneyfield/mainScreens/home/viewTransactionScreen.dart';
import 'package:moneyfield/utitlity/bottomSheets/moreOptionBottomSheet.dart';
import 'package:moneyfield/utitlity/colors.dart';
import 'package:moneyfield/utitlity/constants.dart';
import 'package:moneyfield/utitlity/customWidgets/customCardWidget.dart';
import 'package:moneyfield/utitlity/iconsImages.dart';
import 'package:moneyfield/utitlity/textWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utitlity/widgets.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController accountPageController = PageController();
  final CarouselController controller = CarouselController();
  int _currentAccountIndex = 0;

  @override
  void initState() {
    super.initState();
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
      body: Column(children: [
        Container(
          width: double.infinity, height: 430.h,
          decoration: BoxDecoration(
            color: AppColors.green900,
            border: Border(
              bottom: BorderSide(color: AppColors.neutral30,width: 0.5.r)
            )
          ),
          child: Column(children: [
            homeAppBar(
                profileTap: () {  }, idCardTap: () {  }, notificationTap: () {  }),
            gapH(10.h),
            cardSlider(),
            gapH(20.h),
            indicator2(list: demoAccounts, currentIndex: _currentAccountIndex),
            const Spacer(),
            homeSixOptionitems(
                billsTap: (){}, airtimeTap: (){},
                dataTap: (){}, loansTap:(){}, moreTap: (){
                 _openMoreOptions();
             }
            ),
            gapH(25.h),
          ],),
        ),
        gapH(15.h),
        transactionHistoryHeader(transactionHistoryTap: () {  }),
        gapH(10.h),
        Expanded(child: ListView.builder(
            padding: EdgeInsets.only(bottom: 20.h),
            itemCount: demoTransactionHistory.length,
            itemBuilder: (BuildContext context, int index) {
              TransactionHistoryEntry entry = demoTransactionHistory[index];
          return transactionHistoryPreviewWidget(
              transferTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                    const ViewTransactionScreen()));
              },
              title: entry.title,
              date:entry.date,
              amount: entry.amount, isDebit: entry.isDebit
          );
        })),
        //gapH(5.h),



    ],),);
  }
  _openMoreOptions(){
    openBottomSheet( context, MoreOptionBottomSheet());
  }


  

  SizedBox cardSlider() {
    return SizedBox(height: 191.h,width: double.infinity,
            child:
            CarouselSlider.builder(
                itemCount: demoAccounts.length,
                options: CarouselOptions(
                  //pageSnapping: false,
                  //scrollPhysics: BouncingScrollPhysics(),
                  height: 191.h,
                  padEnds: false,
                  disableCenter: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  //height: 400,
                  // aspectRatio: 16/19,
                  viewportFraction: 0.89,
                  initialPage: _currentAccountIndex,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  onPageChanged:  (integer, page) {
                      _currentAccountIndex = integer;
                      setState(() {});
                     },
                  scrollDirection: Axis.horizontal,
                ),
              itemBuilder:(BuildContext context, int index, int realIndex) {
                UserAccount account = demoAccounts[index];
                  return CardWidget(
                    active: index == _currentAccountIndex,
                    accountNumber:account.accountnumber??"",
                    productName: account.productName??"",
                    balance: account.balance.toString()??"",
                    addMoneyTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                           AddMoneyOwnAccountScreen(initialSelectedIndex: _currentAccountIndex,)));
                    },
                    sendMoneyTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          SelectTransferScreen(initialSelectedIndex: _currentAccountIndex,)));
                    }
                    ,
                  );
              },
            )
          );
  }




}



