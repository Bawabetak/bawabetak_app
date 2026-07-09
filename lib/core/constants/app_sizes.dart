import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSizes {
  static double get paddingXXS => 4.w;
  static double get paddingXS => 8.w;
  static double get paddingS => 12.w;
  static double get paddingM => 16.w;
  static double get paddingL => 20.w;
  static double get paddingXL => 24.w;
  static double get paddingXXL => 32.w;

  static double get marginXXS => 4.w;
  static double get marginXS => 8.w;
  static double get marginS => 12.w;
  static double get marginM => 16.w;
  static double get marginL => 20.w;
  static double get marginXL => 24.w;
  static double get marginXXL => 32.w;

  static double get spaceXXS => 4.h;
  static double get spaceXS => 8.h;
  static double get spaceS => 12.h;
  static double get spaceM => 16.h;
  static double get spaceL => 20.h;
  static double get spaceXL => 24.h;
  static double get spaceXXL => 32.h;

  static double get iconXS => 14.sp;
  static double get iconS => 18.sp;
  static double get iconM => 24.sp;
  static double get iconL => 32.sp;
  static double get iconXL => 40.sp;
  static double get iconXXL => 56.sp;

  static double get fontXXS => 10.sp;
  static double get fontXS => 12.sp;
  static double get fontS => 14.sp;
  static double get fontM => 16.sp;
  static double get fontL => 18.sp;
  static double get fontXL => 20.sp;
  static double get fontXXL => 24.sp;
  static double get fontTitle => 28.sp;
  static double get fontHeadline => 32.sp;

  static double get radiusXS => 4.r;
  static double get radiusS => 8.r;
  static double get radiusM => 12.r;
  static double get radiusL => 16.r;
  static double get radiusXL => 24.r;
  static double get radiusCircular => 100.r;

  static double get buttonHeightS => 36.h;
  static double get buttonHeightM => 48.h;
  static double get buttonHeightL => 56.h;

  static double get borderThin => 1.w;
  static double get borderMedium => 1.5.w;
  static double get borderThick => 2.w;

  static double get appBarHeight => 56.h;
  static double get bottomNavHeight => 64.h;
  static double get avatarS => 32.r;
  static double get avatarM => 48.r;
  static double get avatarL => 64.r;
}
