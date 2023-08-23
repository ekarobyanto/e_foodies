import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import '../../../../shared/rounded_container.dart';
import '../../../../shared/shrink_property.dart';

class MenuEmpty extends StatelessWidget {
  const MenuEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 0.6,
          child: Image.asset(
            Assets.book,
            filterQuality: FilterQuality.medium,
          ),
        ),
        Text(
          'Warung anda belum memiliki menu',
          style: Styles.font.bold,
        ),
        SizedBox(
          height: 5.h,
        ),
        ShrinkProperty(
          onTap: () {},
          child: RoundedContainer(
            radius: 10.r,
            color: Styles.color.primary,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Tambahkan Menu',
                style: Styles.font.base.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}
