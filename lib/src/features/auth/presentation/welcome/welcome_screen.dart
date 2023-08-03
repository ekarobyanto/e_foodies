import 'package:flutter/material.dart';

import 'widgets/content.dart';
import 'widgets/gradient_layer.dart';
import 'widgets/image_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ImageBackground(),
          GradientLayer(),
          Content(),
        ],
      ),
    );
  }
}
