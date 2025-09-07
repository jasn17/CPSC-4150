import 'package:flutter/material.dart';

/// Animnations that can be added to any widget in the future
class AppAnimations {

  /// Makes widgets fade in smoothly when they first appear
  /// Usage: Wrap any widget with AppAnimations.fadeIn(child: yourWidget)
  static Widget fadeIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Makes widgets grow or shrink smoothly
  /// Usage: AppAnimations.scale(child: yourWidget, scale: 1.2) for 20% bigger
  static Widget scale({
    required Widget child,
    double scale = 1.0,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: scale),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Makes widgets slide in from a direction
  /// Usage: AppAnimations.slideIn(child: yourWidget, direction: SlideDirection.left)
  static Widget slideIn({
    required Widget child,
    SlideDirection direction = SlideDirection.bottom,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    Offset beginOffset;
    switch (direction) {
      case SlideDirection.left:
        beginOffset = const Offset(-1.0, 0.0);
        break;
      case SlideDirection.right:
        beginOffset = const Offset(1.0, 0.0);
        break;
      case SlideDirection.top:
        beginOffset = const Offset(0.0, -1.0);
        break;
      case SlideDirection.bottom:
        beginOffset = const Offset(0.0, 1.0);
        break;
    }

    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: beginOffset, end: Offset.zero),
      duration: duration,
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            value.dx * MediaQuery.of(context).size.width,
            value.dy * MediaQuery.of(context).size.height,
          ),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Makes widgets bounce when tapped or when a condition changes
  /// Usage: AppAnimations.bounce(child: yourWidget, shouldBounce: someCondition)
  static Widget bounce({
    required Widget child,
    required bool shouldBounce,
    Duration duration = const Duration(milliseconds: 200),
  }) {
    return AnimatedScale(
      scale: shouldBounce ? 1.2 : 1.0,
      duration: duration,
      curve: Curves.elasticOut,
      child: child,
    );
  }
}

/// Directions for slide animations
enum SlideDirection {
  left,
  right,
  top,
  bottom,
}

/* (!) Still needs work/improvement
/// Makes a list of widgets appear one after another with a delay
/// Usage: AppAnimations.staggeredList(children: [widget1, widget2, widget3])
class StaggeredList extends StatelessWidget {
  final List<Widget> children;
  final Duration delay;
  final Duration duration;

  const StaggeredList({
    super.key,
    required this.children,
    this.delay = const Duration(milliseconds: 100),
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: children.asMap().entries.map((entry) {
        int index = entry.key;
        Widget child = entry.value;
        
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(
            milliseconds: duration.inMilliseconds + (index * delay.inMilliseconds),
          ),
          curve: Curves.easeOutBack,
          builder: (context, value, _) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: child,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
*/