// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../../router/router.dart';
import '../../../../utills/currency_formatter.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import '../../domain/menu/menu.dart';

class MenuShowcase extends StatelessWidget {
  MenuShowcase({super.key, required this.menu});

  Menu menu;

  @override
  Widget build(BuildContext context) {
    return ShrinkProperty(
      onTap: () {
        showMenuInfo(context, menu: menu);
      },
      child: RoundedContainer(
        radius: 20,
        border: Border.all(
          width: 2,
          color: Styles.color.primary,
        ),
        padding: const EdgeInsets.all(10),
        color: Colors.white,
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

  Future<dynamic> showMenuInfo(BuildContext context, {required Menu menu}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedContainer(
                  radius: 10.r,
                  color: Styles.color.primary.withOpacity(0.6),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.store,
                          size: 20, color: Styles.color.darkGreen),
                      Text(
                        ' Warung : ${menu.store}',
                        overflow: TextOverflow.ellipsis,
                        style: Styles.font.bsm
                            .copyWith(color: Styles.color.darkGreen),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close)),
              ],
            ),
            CachedNetworkImage(
              imageUrl: menu.img,
              width: 1.sw,
              height: 0.3.sh,
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Styles.color.danger,
                size: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(menu.name, style: Styles.font.bxl2),
                    Text(
                      menu.desc == ''
                          ? 'Deskripsi Menu ${menu.name}'
                          : menu.desc,
                      style: Styles.font.sm,
                    ),
                  ],
                ),
                Text(
                  '${menu.price != null ? convertCurrency(menu.price!) : 0}',
                  style: Styles.font.lg.copyWith(color: Styles.color.darkGreen),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Komposisi : ',
              style: Styles.font.base,
            ),
            SizedBox(
              width: 1.sw,
              child: Text(
                menu.ingredients.map((e) => e.name).join(', '),
                style: Styles.font.base.copyWith(color: Styles.color.darkGreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            if (router.routeInformationProvider.value.location == '/dashboard')
              ShrinkProperty(
                onTap: () {
                  context.pop();
                  context.push('/store/${menu.storeId}');
                },
                child: RoundedContainer(
                  radius: 10.r,
                  alignment: Alignment.center,
                  color: Styles.color.primary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.store, size: 30, color: Colors.white),
                      Text(
                        'Lihat Warung',
                        style: Styles.font.bold.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
