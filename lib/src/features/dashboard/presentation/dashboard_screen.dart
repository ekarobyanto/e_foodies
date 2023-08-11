import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/dashboard/data/dashboard_repository.dart';
import 'package:e_foodies/src/features/dashboard/domain/dashboard.dart';
import 'package:e_foodies/src/features/menu/domain/ingredient/ingredient.dart';
import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:e_foodies/src/features/store/domain/store.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_foodies/src/constants/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../menu/domain/menu/menu.dart';
import '../../shared/circle_net_pic.dart';
import '../../shared/error_screen.dart';
import '../../shared/item_showcase.dart';
import 'bloc/dashboard_bloc.dart';
import 'widgets/drawer.dart';
import 'widgets/promotion_card.dart';
import 'widgets/search_bar.dart' as search;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final advancedDrawerController = AdvancedDrawerController();

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        authRepository: context.read<AuthRepository>(),
        storageRepository: context.read<StorageRepository>(),
        dashboardRepository: DashboardRepository(),
      )..add(const DashboardEvent.started()),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return CustomDrawer(
            img: state.whenOrNull(
                  success: (data, greeting) => data.img ?? '',
                ) ??
                '',
            advancedDrawerController: advancedDrawerController,
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
                        state.whenOrNull(
                          initial: () {},
                          request: () {},
                          success: (data, greeting) {
                            advancedDrawerController.showDrawer();
                          },
                          error: (message) {},
                        );
                      },
                      icon: const Icon(
                        BoxIcons.bx_menu_alt_left,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    state.when(
                      initial: () => '...',
                      request: () => '...',
                      success: (dashboard, greeting) =>
                          '$greeting, ${dashboard.username?.split(" ")[0] ?? ""}',
                      error: (message) => message,
                    ),
                    style: Styles.font.lg,
                  ),
                ),
                body: state.when(
                  initial: () {
                    return const SizedBox();
                  },
                  request: () {
                    return const Center(child: LoadingScreen());
                  },
                  success: (dashboard, greet) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                                  src: dashboard.img ?? '',
                                  height: 50.h,
                                  width: 50.h,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            if (dashboard.statusStore == 'never_requested')
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
                              items: dashboard.store ?? [],
                            ),
                            SizedBox(height: 20.h),
                            ItemShowcase(
                              title: 'Menu',
                              route: '/menu-list',
                              items: dashboard.menu
                                      ?.map(
                                        (menu) => Menu(
                                          id: menu.id,
                                          name: menu.name,
                                          user: menu.user,
                                          store: menu.store,
                                          img: menu.img,
                                          desc: menu.desc,
                                          storeAddress: menu.storeAddress,
                                          ingredients: menu.ingredients
                                              .map(
                                                (ingredient) => Ingredient(
                                                    id: ingredient.id,
                                                    name: ingredient.name),
                                              )
                                              .toList(),
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (e) {
                    return ErrorScreen(
                      error: e,
                      onRetry: () => context.read<DashboardBloc>().add(
                            const DashboardEvent.started(),
                          ),
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
