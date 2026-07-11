import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleModel {
  final double width;
  final double height;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Color color;

  BubbleModel({
    required this.color,
    required this.width,
    required this.height,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  static List<BubbleModel> get bubbles => [
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .30),
      width: 8.w,
      height: 8.h,
      top: 20.h,
      left: 95.w,
    ),
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .90),
      width: 18.w,
      height: 18.h,
      top: 35.h,
      right: 70.w,
    ),
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .45),
      width: 10.w,
      height: 10.h,
      top: 75.h,
      left: 45.w,
    ),
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .75),
      width: 20.w,
      height: 20.h,
      top: 80.h,
      right: 35.w,
    ),
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .35),
      width: 14.w,
      height: 14.h,
      bottom: 45.h,
      left: 80.w,
    ),
    BubbleModel(
      color: AppColors.primaryColor.withValues(alpha: .55),
      width: 9.w,
      height: 9.h,
      bottom: 60.h,
      right: 90.w,
    ),
  ];
}
