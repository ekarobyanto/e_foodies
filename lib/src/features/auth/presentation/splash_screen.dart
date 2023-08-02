import 'package:e_foodies/src/constants/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.color.primary,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RichText(
            text: TextSpan(
              text: 'e',
              style: Styles.font.bxl4.copyWith(color: Styles.color.primary),
              children: [
                TextSpan(
                  text: 'Foodies',
                  style: Styles.font.bxl6.copyWith(
                    color: Styles.color.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
