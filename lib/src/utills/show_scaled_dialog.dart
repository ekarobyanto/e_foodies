import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showScaleDialog(BuildContext context, Widget content, bool? pop,
    {bool? isDismissible}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: isDismissible ?? true,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut.transform(animation.value);
      return Transform.scale(
        scale: curve,
        child: content,
      );
    },
  ).then(
    (_) {
      //looks like shit, but works for now
      if (pop != null) {
        if (pop) {
          context.pop();
        } else {
          null;
        }
      }
    },
  );
}
