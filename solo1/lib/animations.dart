import 'package:flutter/material.dart';

class AppAnimations {
  static Widget bounce({
    required Widget child,
    bool shouldBounce = false,
    Duration duration = const Duration(milliseconds: 180),
  }) {
    if (!shouldBounce) return child;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.9, end: 1.0),
      duration: duration,
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
}
