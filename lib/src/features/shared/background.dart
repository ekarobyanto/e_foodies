import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles.dart';
import '../../core/bloc/app_bloc.dart';
import 'rounded_animated_container.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

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
          top: 10,
          left: 10,
          child: ShrinkProperty(
            onTap: () {
              context.read<AppBloc>().state == const AppState.loading()
                  ? null
                  : context.pop();
            },
            child: RoundedAnimatedContainer(
              border: Border.all(color: Styles.color.darkGreen),
              padding:
                  context.watch<AppBloc>().state != const AppState.loading()
                      ? const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                      : const EdgeInsets.all(10),
              radius: 30,
              color: Colors.white.withOpacity(0.8),
              child: AnimatedCrossFade(
                firstChild: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Transform.scale(
                      scale: 0.8,
                      child: CircularProgressIndicator(
                          color: Styles.color.primary),
                    ),
                  ),
                ),
                secondChild: Row(
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
                crossFadeState:
                    context.watch<AppBloc>().state == const AppState.loading()
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 150),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
