// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/background_image.dart';
import 'package:recycling_master/ui/widgets/coins_widget.dart';
import 'package:recycling_master/ui/widgets/home_title.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class HomeScreen extends HookConsumerWidget {
  final bool comeFromSplash;
  const HomeScreen({this.comeFromSplash = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuild the widget when the language changes
    ref.watch(langProvider);
    final t1Controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final t2Controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final t3Controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final t4Controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    Future<void> _reverseAnimations() async {
      t1Controller.reverse();
      t2Controller.reverse();
      await t3Controller.reverse();
      await t4Controller.reverse();
      t1Controller.reset();
      t2Controller.reset();
      t3Controller.reset();
      t4Controller.reset();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            const Hero(tag: 'splash_bg', child: BackgroundImage('home')),
            Positioned(
              top: kDefaultLargePadding,
              right: 0,
              child: KAnimate(
                slideDirection: SlideDirection.rightToLeft,
                controller: t4Controller,
                child: GestureDetector(
                  onTap: () async => _reverseAnimations().then(
                    (_) => navigatorKey.currentState
                        ?.pushReplacementNamed(Routes.shop),
                  ),
                  child: const CoinsWidget(),
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              left: kDefaultLargePadding,
              right: kDefaultLargePadding,
              top: kDefaultLargePadding * 3,
              child: Column(
                children: [
                  KAnimate(
                      controller: t1Controller,
                      delay: 300,
                      animate: !comeFromSplash,
                      child: const Hero(tag: 'home_title', child: HomeTitle())),
                  const Spacer(),
                  KAnimate(
                    delay: 100,
                    controller: t2Controller,
                    slideDirection: SlideDirection.downToUp,
                    child: KButton.blue(
                      text: translate('home.buttons.play'),
                      isExpanded: false,
                      onPressed: () async {
                        await _reverseAnimations();
                        ref.read(isUserPlayingProvider.notifier).state = true;
                        navigatorKey.currentState
                            ?.pushReplacementNamed(Routes.gameScreen);
                      },
                    ),
                  ),
                  KAnimate(
                    controller: t3Controller,
                    slideDirection: SlideDirection.downToUp,
                    delay: 200,
                    child: KButton.yellow(
                      text: translate('home.buttons.settings'),
                      onPressed: () async => await _reverseAnimations().then(
                        (_) => navigatorKey.currentState
                            ?.pushReplacementNamed(Routes.settingsScreen),
                      ),
                    ),
                  ),
                  KAnimate(
                    controller: t3Controller,
                    slideDirection: SlideDirection.downToUp,
                    delay: 300,
                    child: KButton.green(
                      text: translate('home.buttons.shop'),
                      isExpanded: false,
                      onPressed: () async => _reverseAnimations().then(
                        (_) => navigatorKey.currentState
                            ?.pushReplacementNamed(Routes.shop),
                      ),
                    ),
                  ),
                ],
              ).separated(
                separator: const SizedBox(height: kDefaultTinyPadding),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
