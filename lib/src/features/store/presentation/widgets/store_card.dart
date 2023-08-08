import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/store/domain/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';

class WarungCard extends StatelessWidget {
  const WarungCard({
    super.key,
    required this.warung,
  });

  final Store warung;

  @override
  Widget build(BuildContext context) {
    return ShrinkProperty(
      onTap: () {
        context.push('/store');
      },
      child: RoundedContainer(
        radius: 20,
        border: Border.all(
          width: 2,
          color: Styles.color.primary,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainer(
              heightWidth: Size(100.h, 100.h),
              radius: 20,
              gradient: LinearGradient(
                colors: [
                  Styles.color.primary,
                  Styles.color.darkGreen.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Image.network(
                warung.img ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    size: 30,
                    color: Styles.color.danger,
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 100.h,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          warung.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 1.sw * 0.55,
                          child: Text(
                            warung.desc,
                            style: Styles.font.xsm,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          warung.address,
                          style: Styles.font.xsm,
                        ),
                        SizedBox(
                          width: 1.sw * 0.55,
                          child: Text(
                            warung.menus.map((menu) => menu.name).join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}