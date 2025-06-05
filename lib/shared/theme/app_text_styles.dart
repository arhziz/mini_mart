// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/core.dart';

class AppTextStyles {
  static TextStyle w400({
    double fontSize = 14,
    Color color = Colors.black,
    double? height,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
      fontFamily: AppStrings.ibmPlexSans,
      color: color,
      height: height,
    );
  }

  static TextStyle w500({
    double fontSize = 14,
    Color color = Colors.black,
    double? height,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize.sp,
      color: color,
      fontFamily: AppStrings.ibmPlexSans,
      height: height,
    );
  }

  static TextStyle w600({
    double fontSize = 14,
    Color color = Colors.black,
    double? height,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize.sp,
      color: color,
      fontFamily: AppStrings.ibmPlexSans,
      height: height,
    );
  }

  static TextStyle w700({
    double fontSize = 14,
    Color color = Colors.black,
    double? height,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize.sp,
      color: color,
      fontFamily: AppStrings.ibmPlexSans,
      height: height,
    );
  }
}
