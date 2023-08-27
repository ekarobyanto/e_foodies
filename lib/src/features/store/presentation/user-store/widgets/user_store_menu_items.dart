import 'package:e_foodies/src/constants/styles.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/utills/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/image/image_bloc.dart';
import '../../../../menu/domain/menu/menu.dart';
import 'edit_menu_dialog.dart';

class UserStoreMenuItems extends StatelessWidget {
  const UserStoreMenuItems({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          showDragHandle: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) => EditMenuDialog(menu: menu),
        );
      },
      child: RoundedContainer(
        radius: 10.r,
        color: Colors.white,
        shadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleNetPic(
                  src: menu.img,
                  height: 60.h,
                  width: 60.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      menu.name,
                      style: Styles.font.bold,
                    ),
                    Text(convertCurrency(menu.price ?? 0),
                        style:
                            Styles.font.sm.copyWith(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              'Deskripsi Menu',
              style: Styles.font.sm,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Text(menu.desc),
            )
          ],
        ),
      ),
    );
  }
}
