import 'package:bawabak/core/utils/assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
  static List<OnboardingModel> get onboardingItems => [
    OnboardingModel(
      image: Assets.assetsImagesOnboardingOne,
      title: 'Experience Every Match\n Like Never Before',
      subtitle:
          'Book your match tickets in just a few taps\n and enjoy the excitement of live football from the best seats.',
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingTwo,
      title: 'Keep Your Digital Ticket \n Ready Anytime',
      subtitle:
          'Access your ticket instantly, scan the QR code\n at the gate and enter the stadium without hassle.',
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingThree,
      title: 'Fast, Secure, and Seamless  \nStadium Entry',
      subtitle:
          'Skip long queues with quick ticket verification\n and focus on enjoying every moment of the match.',
    ),
  ];
}
