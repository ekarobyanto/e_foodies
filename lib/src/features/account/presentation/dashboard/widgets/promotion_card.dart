import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../../shared/rounded_container.dart';
import '../../../../shared/shrink_property.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      radius: 20,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Styles.color.primary,
      // border: Border.all(color: Styles.color.primary),
      gradient: LinearGradient(
        colors: [
          Styles.color.darkGreen,
          Styles.color.primary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                'Warung',
                style: Styles.font.bold.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            'Warung adalah usaha kecil milik keluarga yang berbentuk kedai, kios, toko kecil, atau restoran sederhana — istilah "warung" dapat ditemukan di Indonesia dan Malaysia. Warung adalah salah satu bagian penting dalam kehidupan keseharian rakyat Indonesia.',
            style: Styles.font.bxsm.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          ShrinkProperty(
            onTap: () {},
            child: RoundedContainer(
              radius: 20,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              // color: Styles.color.accent,
              child: Text(
                'Daftarkan Warung',
                style: Styles.font.base.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
