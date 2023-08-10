import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/styles.dart';
import '../../../../shared/shrink_property.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkProperty(
      onTap: () {
        context.push('/register', extra: 'welcome');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          'Mulai',
          style: Styles.font.base.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
