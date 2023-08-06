import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -50,
          top: -50,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.color.darkGreen),
          ),
        ),
        Positioned(
          left: 40,
          top: -20,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.color.primary),
          ),
        ),
        Positioned(
          left: -50,
          top: -50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.color.accent),
          ),
        ),
        child,
      ],
    );
  }
}
