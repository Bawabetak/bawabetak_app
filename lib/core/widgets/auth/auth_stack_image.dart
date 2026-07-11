import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/models/bubble_model.dart';
import 'package:bawabak/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthStackImag extends StatelessWidget {
  const AuthStackImag({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(context) * .27,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                Assets.assetsLauncherAppLogo,
                height: 70.h,
                width: 70.h,
              ),
            ),
          ),
          ...List.generate(
            BubbleModel.bubbles.length,
            (index) => AuthStackImageBubble(bubble: BubbleModel.bubbles[index]),
          ),
        ],
      ),
    );
  }
}

class AuthStackImageBubble extends StatelessWidget {
  const AuthStackImageBubble({super.key, required this.bubble});

  final BubbleModel bubble;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bubble.bottom,
      top: bubble.top,
      left: bubble.left,
      right: bubble.right,
      child: Container(
        height: bubble.height,
        width: bubble.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bubble.color,
        ),
      ),
    );
  }
}
