import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import '../../../../dashboard/presentation/widgets/promotion_card.dart';

class NoStoreView extends StatelessWidget {
  const NoStoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.1.sh,
        ),
        Text(
          'Daftarkan Warung Anda',
          style: Styles.font.bxl3,
          // textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40.h,
        ),
        Image.asset(
          Assets.restaurant,
          filterQuality: FilterQuality.medium,
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Daftarkan warung anda ke aplikasi dan dapatkan keuntungan lebih',
          style: Styles.font.lg.copyWith(
            color: Styles.color.darkGreen,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        PromotionCard(
          title: 'Daftarkan warung',
          desc:
              'Dengan mendaftarkan warung anda ke aplikasi, anda juga dapat lebih mudah mengembangkan warung anda',
          onTap: () {
            context.push('/create-store');
          },
        )
      ],
    );
  }
}
