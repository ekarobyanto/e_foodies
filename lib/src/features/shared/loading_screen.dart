import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../constants/lottie_path.dart';

import '../../constants/styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Lottie.asset(loading, height: 250, width: 250),
          ),
          Text(
            'Mohon Tunggu Sebentar...',
            style: Styles.font.bold,
          ),
        ],
      ),
    );
  }
}
