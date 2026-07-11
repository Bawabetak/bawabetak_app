
import 'package:bawabak/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  void skip() {
    pageController.animateToPage(
      OnboardingModel.onboardingItems.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentIndex = OnboardingModel.onboardingItems.length - 1;
    emit(UpdateOnboardingCurrentIndex(currentIndex: currentIndex));
  }

  void nextPage() {
    if (pageController.page == OnboardingModel.onboardingItems.length - 1) {
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentIndex++;
    emit(UpdateOnboardingCurrentIndex(currentIndex: currentIndex));
  }
}
