import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/ui/screens/onboarding_1.dart';
import 'package:recycling_master/ui/screens/onboarding_2.dart';
import 'package:recycling_master/ui/screens/onboarding_3.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({super.key});
  static const colors = [
    onBoardingFirstColor,
    onBoardingSecondColor,
    onBoardingThirdColor
  ];

  @override
  Widget build(BuildContext context) {
    const pages = [
      OnBoardingFirstPage(),
      OnBoardingSecondPage(),
      OnBoardingThirsPage(),
    ];
    final currentIndex = useState(0);
    final controller = usePageController();
    const dotsBottomPadding = 60.0;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: ConcentricPageView(
                pageController: controller,
                onChange: (index) => currentIndex.value = index,
                itemCount: pages.length,
                onFinish: () => navigatorKey.currentState!
                    .pushReplacementNamed(Routes.homeScreen),
                itemBuilder: (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultLargePadding,
                  ).copyWith(
                      top: kDefaultLargePadding * 2,
                      bottom: dotsBottomPadding + kDefaultLargePadding * 2),
                  child: pages[index],
                ),
                colors: colors,
                radius: 0.0,
              ),
            ),
            Positioned(
              bottom: dotsBottomPadding,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: const WormEffect(
                    dotHeight: 12.0,
                    dotWidth: 12.0,
                    spacing: kDefaultTinyPadding,
                    activeDotColor: neutralDark,
                    dotColor: neutralLight,
                    type: WormType.thinUnderground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
