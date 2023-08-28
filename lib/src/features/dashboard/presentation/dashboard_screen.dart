import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:e_foodies/src/features/store/presentation/user-store/bloc/user_store_bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_foodies/src/constants/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../../core/bloc/account/account_bloc.dart';
import '../../shared/circle_net_pic.dart';
import '../../shared/error_screen.dart';
import '../../shared/item_showcase.dart';
import '../../shared/rounded_container.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            state.whenOrNull(
              succes: (account) {
                context.read<DashboardBloc>().add(
                      const DashboardEvent.started(),
                    );
              },
            );
          },
        ),
        BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (dashboardData, greeting) =>
                  dashboardData.statusStore == "Approved"
                      ? context.read<UserStoreBloc>().add(
                            const UserStoreEvent.started(),
                          )
                      : null,
            );
          },
        ),
      ],
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, accountState) {
          return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return CustomDrawer(
                img: accountState.maybeWhen(
                  succes: (account) => account.img,
                  orElse: () => '',
                ),
                advancedDrawerController: advancedDrawerController,
                child: Scaffold(
                  backgroundColor: Colors.grey[100],
                  appBar: AppBar(
                    backgroundColor: Styles.color.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    leading: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          state.whenOrNull(
                            success: (data, greeting) {
                              advancedDrawerController.showDrawer();
                            },
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
                        initial: () => '',
                        request: () => '',
                        success: (dashboard, greeting) =>
                            '$greeting, ${accountState.maybeWhen(
                          succes: (account) => account.username,
                          orElse: () => '',
                        )}',
                        error: (message) => message,
                      ),
                      style: Styles.font.lg,
                    ),
                  ),
                  body: accountState.maybeWhen(
                    orElse: () => ErrorScreen(
                      error: 'Terjadi Kesalahan',
                      onRetry: () {
                        context.read<AccountBloc>().add(
                              const AccountEvent.started(),
                            );
                      },
                    ),
                    initial: () => const Center(
                      child: LoadingScreen(),
                    ),
                    succes: (account) => state.when(
                      initial: () {
                        return const SizedBox();
                      },
                      request: () {
                        return const Center(child: LoadingScreen());
                      },
                      success: (dashboard, greet) {
                        return RefreshIndicator(
                          color: Styles.color.primary,
                          onRefresh: () async => context
                              .read<DashboardBloc>()
                              .add(const DashboardEvent.refresh()),
                          child: SingleChildScrollView(
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
                                        src: account.img,
                                        height: 50.h,
                                        width: 50.h,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  if (dashboard.statusStore ==
                                          'never_requested' ||
                                      dashboard.statusStore == 'Rejected')
                                    PromotionCard(
                                      title: 'Warung',
                                      onTap: () {
                                        context.push(
                                          '/create-store',
                                        );
                                      },
                                      desc:
                                          'Warung adalah usaha kecil milik keluarga yang berbentuk kedai, kios, toko kecil, atau restoran sederhana — istilah "warung" dapat ditemukan di Indonesia dan Malaysia. Warung adalah salah satu bagian penting dalam kehidupan keseharian rakyat Indonesia.',
                                    ),
                                  if (dashboard.statusStore == 'Pending')
                                    RoundedContainer(
                                      radius: 20.r,
                                      border: Border.all(
                                        color: Styles.color.primary,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.info_outline,
                                                    color: Colors.red),
                                                Text(
                                                  ' Warung Anda Sedang Diverifikasi',
                                                  style: Styles.font.bold,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Selama Menunggu Warung Anda Diverifikasi, mari menjelajahi menu-menu yang ada di aplikasi ini. Jika sudah diverifikasi, Anda dapat menambahkan menu baru di warung Anda.',
                                              style: Styles.font.xsm,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (dashboard.statusStore == 'Approved')
                                    RoundedContainer(
                                      radius: 20.r,
                                      border: Border.all(
                                        color: Styles.color.primary,
                                        width: 2,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),
                                      child: ListTile(
                                        leading: CircleNetPic(
                                          src: dashboard.imageStore ?? '',
                                          height: 60.h,
                                          width: 55.h,
                                        ),
                                        title: Text(
                                          dashboard.nameStore ?? '',
                                          style: Styles.font.blg,
                                        ),
                                        subtitle: Text(
                                          dashboard.addressStore ?? '',
                                          style: Styles.font.sm,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            context.push(
                                              '/user-store',
                                            );
                                          },
                                          icon: Icon(
                                            BoxIcons.bx_chevron_right,
                                            color: Styles.color.primary,
                                            size: 30.sp,
                                          ),
                                        ),
                                      ),
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
                                    items: dashboard.menu ?? [],
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
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
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
