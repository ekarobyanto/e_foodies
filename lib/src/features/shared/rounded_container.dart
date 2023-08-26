import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedContainer extends StatelessWidget {
  RoundedContainer({
    super.key,
    required this.radius,
    required this.child,
    this.color,
    this.border,
    this.heightWidth,
    this.padding,
    this.alignment,
    this.gradient,
    this.shadow,
  });

  Color? color;
  Border? border;
  final double radius;
  final Widget child;
  Size? heightWidth;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? alignment;
  Gradient? gradient;
  List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightWidth?.height,
      width: heightWidth?.width,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        gradient: gradient,
        boxShadow: shadow,
      ),
      child: child,
    );
  }
}
