import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.space, {super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space.h);
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.space, {super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space.w);
  }
}
