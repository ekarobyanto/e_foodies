import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedAnimatedContainer extends StatelessWidget {
  RoundedAnimatedContainer({
    super.key,
    required this.radius,
    required this.child,
    this.color,
    this.border,
    this.heightWidth,
    this.padding,
    this.alignment,
    this.gradient,
  });

  Color? color;
  Border? border;
  final double radius;
  final Widget child;
  Size? heightWidth;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? alignment;
  Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: heightWidth?.height,
      width: heightWidth?.width,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
