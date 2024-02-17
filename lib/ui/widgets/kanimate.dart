import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum SlideDirection {
  leftToRight,
  rightToLeft,
  upToDown,
  downToUp,
}

class KAnimate extends HookWidget {
  final int? delay;
  final Widget child;
  final SlideDirection slideDirection;
  final Duration? duration;
  final AnimationController? controller;
  final bool animate;
  final double offset;
  final bool reversed;

  const KAnimate({
    required this.child,
    this.slideDirection = SlideDirection.upToDown,
    this.animate = true,
    this.reversed = false,
    this.offset = 2.0,
    this.delay,
    this.duration,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ANIMATION
    final animationController = controller ??
        useAnimationController(
            duration: duration ?? const Duration(milliseconds: 2000));

    final offsetAnimation = animationController.drive(
      Tween<Offset>(
        begin: getBeginOffset(),
        end: Offset.zero,
      ).chain(
        CurveTween(curve: Curves.easeInOutCubic),
      ),
    );

    useEffect(() {
      Future.delayed(Duration(milliseconds: delay ?? 0), () {
        reversed
            ? animationController.reverse()
            : animationController.forward();
      });

      return null;
    }, const []);

    return animate
        ? FadeTransition(
            opacity: animationController,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          )
        : child;
  }

  Offset getBeginOffset() {
    switch (slideDirection) {
      case SlideDirection.leftToRight:
        return Offset(-offset, 0.0);
      case SlideDirection.rightToLeft:
        return Offset(offset, 0.0);
      case SlideDirection.upToDown:
        return Offset(0.0, -offset);
      case SlideDirection.downToUp:
        return Offset(0.0, offset);
    }
  }
}
