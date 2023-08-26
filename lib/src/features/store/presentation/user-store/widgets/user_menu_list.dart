// ignore: must_be_immutable

import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/utills/currency_formatter.dart';
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
              return ListTile(
                leading: CircleNetPic(
                  src: menus[index].img,
                  height: 50.h,
                  width: 50.h,
                ),
                title: Text(
                  '${menus[index].name} ${menus[index].desc}',
                  style: Styles.font.bxl2,
                ),
                subtitle: Text(
                  convertCurrency(menus[index].price ?? 0),
                  style: Styles.font.bxl2.copyWith(
                    color: Styles.color.darkGreen,
                  ),
                ),
              );
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
