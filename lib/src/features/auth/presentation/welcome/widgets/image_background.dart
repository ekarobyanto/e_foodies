import 'package:flutter/material.dart';

import '../../../../../constants/image_path.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        Assets.welcomeBackground,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.low,
      ),
    );
  }
}
