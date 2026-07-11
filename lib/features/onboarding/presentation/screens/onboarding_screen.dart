import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/features/onboarding/data/models/onboarding_model.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  @override
  void initState() {
    pageController = context.read<OnboardingCubit>().pageController;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => Stack(
            children: [
              Positioned(
                top: -100.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  OnboardingModel.onboardingItems[index].image,
                  height: AppSizes.getHeight(context),
                  fit: BoxFit.cover,
                ),
              ),
              OnboardingContainer(index: index),
            ],
          ),
        ),
      ),
    );
  }
}
