part of 'onboarding_cubit.dart';

sealed class OnboardingState {
  const OnboardingState(this.currentIndex);
  final int currentIndex;
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial() : super(0);
}

final class UpdateOnboardingCurrentIndex extends OnboardingState {
  UpdateOnboardingCurrentIndex({required int currentIndex})
    : super(currentIndex);
}
