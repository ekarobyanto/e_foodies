import 'package:flutter/material.dart';

class ShrinkProperty extends StatefulWidget {
  const ShrinkProperty({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  State<ShrinkProperty> createState() => _ShrinkPropertyState();
}

class _ShrinkPropertyState extends State<ShrinkProperty>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMilis = 50;
  double scaleTransformVal = 1;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMilis),
      lowerBound: 0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() {
          scaleTransformVal = 1 - animationController.value;
        });
      });
  }

  shrinkButtonSize() {
    animationController.forward();
  }

  restoreButtonSize() async {
    await Future.delayed(
        const Duration(milliseconds: clickAnimationDurationMilis), () {
      animationController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(
            const Duration(milliseconds: clickAnimationDurationMilis));
        shrinkButtonSize();
        restoreButtonSize();
        widget.onTap.call();
      },
      onTapDown: (_) => shrinkButtonSize(),
      onTapCancel: restoreButtonSize,
      child: Transform.scale(
        scale: scaleTransformVal,
        child: widget.child,
      ),
    );
  }
}
