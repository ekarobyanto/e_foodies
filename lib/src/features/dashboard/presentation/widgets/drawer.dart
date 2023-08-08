import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required AdvancedDrawerController advancedDrawerController,
    required this.child,
  }) : _advancedDrawerController = advancedDrawerController;

  final AdvancedDrawerController _advancedDrawerController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      disabledGestures: true,
      backdropColor: Styles.color.darkGreen,
      childDecoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      animationDuration: const Duration(milliseconds: 150),
      openScale: 0.9,
      openRatio: 0.5,
      animateChildDecoration: true,
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          selectedColor: Styles.color.darkGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 100.h,
                    height: 100.h,
                    margin: const EdgeInsets.only(
                      top: 24,
                      bottom: 40,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1612833609248-5e9b4a1b0b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXR5JTIwY2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _advancedDrawerController.hideDrawer();
                      context.push('/account');
                    },
                    leading: const Icon(
                      CupertinoIcons.person_crop_circle_fill,
                      size: 30,
                    ),
                    title: Text(
                      'Profil',
                      style: Styles.font.lg.copyWith(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(
                      Icons.store,
                      size: 30,
                    ),
                    title: Text(
                      'Warungku',
                      style: Styles.font.lg.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ShrinkProperty(
                  onTap: () {},
                  child: RoundedContainer(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    radius: 30.r,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Keluar',
                          style: Styles.font.base,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
