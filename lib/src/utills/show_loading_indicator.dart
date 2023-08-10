import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../constants/styles.dart';

class LoadingIndicator {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: SpinKitChasingDots(
          color: Styles.color.primary,
          size: 50.0,
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    context.pop();
  }
}
