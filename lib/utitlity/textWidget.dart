import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneyfield/utitlity/colors.dart';

Text ctmTxtSF(title,
    color,size,
    {weight = FontWeight.normal,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style:
    TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'SFProDisplay',//creatoDisplayRegular
      fontWeight: weight,
      letterSpacing: -0.16.sp
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text ctmTxtCrtB(title,
    size,
    {weight = FontWeight.normal,maxLines = 1, textAlign = TextAlign.start,color = AppColors.black}) {
  return Text(title,
    style:
    TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'creatoDisplayBold',
      fontWeight: weight,
      letterSpacing: -0.35.sp
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text ctmTxtCrtR(title,
    color,size,
    {weight = FontWeight.normal,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style:
    TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'creatoDisplayRegular',
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text ctmTxtAct(title,
    color,size,
    {weight = FontWeight.normal,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style:
    TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'actionSansRegular',
      fontWeight: weight,
      letterSpacing: -0.25.sp
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}