import 'package:e_foodies/src/features/menu/domain/ingredient/ingredient.dart';
import 'package:e_foodies/src/features/store/domain/store.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_foodies/src/constants/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../menu/domain/menu/menu.dart';
import '../../shared/circle_net_pic.dart';
import '../../shared/item_showcase.dart';
import 'widgets/drawer.dart';
import 'widgets/promotion_card.dart';
import 'widgets/search_bar.dart' as search;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      advancedDrawerController: _advancedDrawerController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                _advancedDrawerController.showDrawer();
              },
              icon: const Icon(
                BoxIcons.bx_menu_alt_left,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Selamat Pagi, Eka!',
            style: Styles.font.lg,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: search.SearchBar(),
                    ),
                    const SizedBox(width: 10),
                    CircleNetPic(
                      src:
                          'https://images.unsplash.com/photo-1612833609248-5e9b4a1b0b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXR5JTIwY2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                      height: 50.h,
                      width: 50.h,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PromotionCard(
                  title: 'Warung',
                  onTap: () {
                    context.push('/create-store');
                  },
                  desc:
                      'Warung adalah usaha kecil milik keluarga yang berbentuk kedai, kios, toko kecil, atau restoran sederhana — istilah "warung" dapat ditemukan di Indonesia dan Malaysia. Warung adalah salah satu bagian penting dalam kehidupan keseharian rakyat Indonesia.',
                ),
                SizedBox(height: 20.h),
                ItemShowcase(
                  title: 'Warung',
                  route: '/store-list',
                  items: [
                    Store(
                      id: 'id',
                      name: 'Warung Kucing',
                      desc: 'Warung Kucing adalah warung yang menjual Kucing',
                      user: 'Kucing',
                      address: 'Jl.Kucing',
                      phone: 'asd',
                      menus: [
                        Menu(
                          id: 'id',
                          desc: 'asdasddasd',
                          name: 'Kucing Bakar',
                          user: 'Kucing',
                          store: 'asd',
                          storeAddress: 'Jl.Kucing',
                          ingredients: [
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                          ],
                        ),
                        Menu(
                          id: 'id',
                          desc: 'asdasddasd',
                          name: 'Kucing Goreng',
                          user: 'Kucing',
                          storeAddress: 'Jl.Kucing',
                          store: 'asd',
                          ingredients: [
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                            Ingredient(id: 'asdasd', name: 'Kucing'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ItemShowcase(
                  title: 'Menu',
                  route: '/menu-list',
                  items: [
                    Menu(
                      id: 'asdasd',
                      desc: 'asdasddasd',
                      name: 'Kucing Bakar',
                      store: 'asd',
                      storeAddress: 'Jl.Kucing',
                      user: 'user 1',
                      ingredients: [
                        Ingredient(id: 'asdasd', name: 'Kucing'),
                        Ingredient(id: 'asdasd', name: 'Kucing'),
                        Ingredient(id: 'asdasd', name: 'Kucing'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
