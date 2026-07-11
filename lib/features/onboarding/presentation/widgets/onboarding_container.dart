import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/features/onboarding/data/models/onboarding_model.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:bawabak/features/onboarding/presentation/widgets/onboarding_buttons_conrollers.dart';
import 'package:bawabak/features/onboarding/presentation/widgets/onboarding_container_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingContainer extends StatelessWidget {
  const OnboardingContainer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: OnboardingContainerPainter(
          color: context.isDarkMode
              ? AppColors.bgMainDark
              : AppColors.bgMainLight,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            AppSizes.paddingM,
            0,
            AppSizes.paddingM,
            AppSizes.paddingM,
          ),
          width: double.infinity,
          height: AppSizes.getHeight(context) * 0.5,

          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.2),
                Text(
                  textAlign: TextAlign.center,
                  OnboardingModel.onboardingItems[index].title,
                  style: context.textTheme.headlineMedium,
                ),
                const VerticalSpace(10),
                Text(
                  textAlign: TextAlign.center,
                  OnboardingModel.onboardingItems[index].subtitle,
                  style: context.textTheme.labelLarge,
                ),
                const VerticalSpace(13),
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return CustomSmoothPageIndicator(
                      count: OnboardingModel.onboardingItems.length,
                      activeIndex: state.currentIndex,
                    );
                  },
                ),
                const Spacer(),
                const OnboardingButtonsConrollers(),
                const VerticalSpace(13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
