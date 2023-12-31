import 'package:e_foodies/src/core/bloc/account/account_bloc.dart';
import 'package:e_foodies/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/styles.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required AdvancedDrawerController advancedDrawerController,
    required this.child,
    required this.img,
  }) : _advancedDrawerController = advancedDrawerController;

  final AdvancedDrawerController _advancedDrawerController;
  final Widget child;
  final String img;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      disabledGestures: true,
      backdropColor: Styles.color.darkGreen,
      childDecoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  CircleNetPic(
                    src: img,
                    height: 100.h,
                    width: 100.h,
                  ),
                  const SizedBox(
                    height: 20,
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
                      context.push('/user-store');
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
                  onTap: () async {
                    advancedDrawerController.hideDrawer();
                    await SharedPreferences.getInstance().then((value) {
                      value.clear();
                      context.go('/welcome');
                    });
                  },
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
