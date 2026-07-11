import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/features/onboarding/data/models/onboarding_model.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingButtonsConrollers extends StatelessWidget {
  const OnboardingButtonsConrollers({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final activeIndex = cubit.currentIndex;
        return Row(
          spacing: AppSizes.paddingM,
          children: [
            if (activeIndex != OnboardingModel.onboardingItems.length - 1)
              Expanded(
                child: AppButton(
                  onPressed: () {
                    cubit.skip();
                  },
                  text: "Skip",
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  textColor: AppColors.primaryColor,
                  elevation: 0,
                ),
              ),
            Expanded(
              child: AppButton(
                onPressed: () {
                  if (activeIndex !=
                      OnboardingModel.onboardingItems.length - 1) {
                    cubit.nextPage();
                  } else {
                    //navigate to login page
                  }
                },
                text: activeIndex != OnboardingModel.onboardingItems.length - 1
                    ? "Continue"
                    : "Get Started",
              ),
            ),
          ],
        );
      },
    );
  }
}
