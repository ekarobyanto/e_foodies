// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import '../../domain/menu/menu.dart';

class MenuDashboardCard extends StatelessWidget {
  MenuDashboardCard({super.key, required this.menu});

  Menu menu;

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
                menu.img,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        menu.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Komposisi : ',
                        style: Styles.font.xsm,
                      ),
                      SizedBox(
                        width: 1.sw * 0.55,
                        child: Text(
                          menu.ingredients.map((e) => e.name).join(', '),
                          style: Styles.font.xsm.copyWith(color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.store,
                              size: 15, color: Styles.color.darkGreen),
                          Text(
                            ' Warung :',
                            overflow: TextOverflow.ellipsis,
                            style: Styles.font.xsm,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 1.sw * 0.5,
                        child: Text(
                          '${menu.store}, ${menu.storeAddress}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.font.xsm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
