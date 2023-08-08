import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.color.primary),
          ),
        ),
        Positioned(
          left: -50,
          top: -50,
          child: Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.color.accent),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: ShrinkProperty(
            onTap: () {
              context.pop();
            },
            child: RoundedContainer(
              border: Border.all(color: Styles.color.darkGreen),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              radius: 30,
              color: Colors.white.withOpacity(0.8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Styles.color.darkGreen,
                    size: 20,
                  ),
                  Text(
                    'Kembali',
                    style: Styles.font.base,
                  )
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
