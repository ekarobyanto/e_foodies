// ignore: must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/styles.dart';
import '../../../../menu/domain/menu/menu.dart';

// ignore: must_be_immutable
class UserStoreMenuList extends StatelessWidget {
  UserStoreMenuList({
    super.key,
    required this.menus,
  });

  List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Menu',
          style: Styles.font.bxl2,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: menus.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
        SizedBox(
          height: 100.h,
        )
      ],
    );
  }
}
