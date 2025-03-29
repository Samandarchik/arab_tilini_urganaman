import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle kTSFW = TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp);
TextStyle kTSFB = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp);
TextStyle kTSFB14 =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, height: 0.1);

TextStyle kTSFW20 = TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp);
TextStyle kTSFB20 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp);

TextStyle kTSFW30 = TextStyle(fontWeight: FontWeight.w400, fontSize: 30.sp);
TextStyle kTSFB30 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.sp,
  fontFamily: "Arabic",
);
TextStyle kTSFBCW30 = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 30.sp, color: Colors.white);
TextStyle kTSFB35 = TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp);

class TextStyles {
  static kTSFW({double size = 16}) {
    return TextStyle(
        fontSize: size.sp, fontFamily: "Arabic", color: Colors.black);
  }

  static kTSFWCW({double size = 16}) {
    return TextStyle(
        fontSize: size.sp,
        fontFamily: "Arabic",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        height: 0);
  }
}
