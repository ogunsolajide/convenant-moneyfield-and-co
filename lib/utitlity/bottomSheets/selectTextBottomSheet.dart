import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyfield/utitlity/textWidget.dart';

import '../colors.dart';
import '../widgets.dart';


class SelectionModal{
  String title;
  String id;

  SelectionModal({required this.title, required this.id, });
}

class SelectTextBottomSheet extends StatefulWidget {
  final String titleText;
  final List<dynamic> items;
  final double height;
  const SelectTextBottomSheet({super.key, required this.titleText, required this.items, required this.height});

  @override
  State<SelectTextBottomSheet> createState() => _SelectTextBottomSheetState();
}

class _SelectTextBottomSheetState extends State<SelectTextBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,height: 302.h,
     // color: AppColors.white,
      //padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 19.h),
      child: Column(
        children: [
          appBarBottomSheet(title: widget.titleText,
              backTap: (){Navigator.pop(context);}),
          Expanded(
            child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return listWidget(
                      widget.items[index].title,(){
                    Navigator.pop(context, widget.items[index]);
                  });
                }
            ),
          ),
          gapH(22.h),
        ],
      ),
    );
  }

  Widget listWidget(title,tap) {
    return GestureDetector(onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.5.h),
        width: 390.w,height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: AppColors.neutral20,borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 300.w,
                child: ctmTxtAct(title,AppColors.black,16.sp,maxLines: 1))
          ],),
      ),
    );
  }
}