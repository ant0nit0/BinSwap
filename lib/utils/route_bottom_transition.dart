import 'package:flutter/material.dart';

class BottomToTopPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  BottomToTopPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin =
                Offset(0.0, 1.0); // Start from the bottom of the screen
            const end = Offset.zero; // End at the top (final position)
            const curve =
                Curves.ease; // Use an easing curve for smooth animation

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
