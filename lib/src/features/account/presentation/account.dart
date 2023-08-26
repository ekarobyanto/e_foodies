import 'package:e_foodies/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/features/shared/error_screen.dart';
import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/dashboard/presentation/widgets/promotion_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/bloc/account/account_bloc.dart';

import '../../shared/background.dart';
import '../../../constants/styles.dart';
import '../../shared/rounded_animated_container.dart';
import '../../shared/rounded_container.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: Styles.color.darkGreen,
        ),
        body: Background(
          child: SizedBox(
            width: 1.sw,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                return state.maybeWhen(
                  error: (e) {
                    return ErrorScreen(
                      error: e,
                      onRetry: () => context.read<AccountBloc>()
                        ..add(
                          const AccountEvent.started(),
                        ),
                    );
                  },
                  orElse: () {
                    return Column(
                      children: [
                        SizedBox(
                          height: 1.sh * 0.1,
                        ),
                        BlocBuilder<AccountBloc, AccountState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              succes: (account) {
                                return Column(
                                  children: [
                                    CircleNetPic(
                                      src: account.img,
                                      height: 120.h,
                                      width: 120.h,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      account.username,
                                      style: Styles.font.blg,
                                    ),
                                  ],
                                );
                              },
                              initial: () => Shimmer.fromColors(
                                baseColor: Styles.color.accent,
                                highlightColor: Styles.color.primary,
                                child: Container(
                                  width: 120.h,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Styles.color.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              orElse: () => const SizedBox(),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              // color: Styles.color.primary,
                              border: Border.all(
                                color: Styles.color.primary,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: BlocBuilder<AccountBloc, AccountState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  initial: () => const LoadingScreen(),
                                  orElse: () => const SizedBox(),
                                  succes: (account) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Data Diri',
                                          style: Styles.font.blg,
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Email : ',
                                          style: Styles.font.bold,
                                        ),
                                        Text(
                                          account.email,
                                          style: Styles.font.base,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          'Alamat : ',
                                          style: Styles.font.bold,
                                        ),
                                        SizedBox(
                                          width: 1.sw,
                                          child: Text(
                                            account.address,
                                            maxLines: 2,
                                            style: Styles.font.base,
                                            textDirection: TextDirection.ltr,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ShrinkProperty(
                                          onTap: () {
                                            context.pushNamed(
                                              'edit-account',
                                              extra:
                                                  context.read<AccountBloc>(),
                                            );
                                          },
                                          child: RoundedAnimatedContainer(
                                            radius: 20,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Styles.color.primary,
                                              width: 1.5,
                                            ),
                                            child: Text(
                                              'Ubah Profil',
                                              style: Styles.font.bold.copyWith(
                                                color: Styles.color.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                          thickness: 1.5,
                                        ),
                                        Text(
                                          'Warung',
                                          style: Styles.font.blg
                                              .copyWith(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        context
                                            .watch<DashboardBloc>()
                                            .state
                                            .maybeWhen(
                                              orElse: () => const SizedBox(),
                                              success: (dashboard, greeting) {
                                                if (dashboard.statusStore ==
                                                    'never_requested') {
                                                  return PromotionCard(
                                                    title: 'Daftarkan warung',
                                                    desc:
                                                        'Anda belum pernah melakukan pendaftaran warung',
                                                    onTap: () {
                                                      context.push(
                                                          '/create-store');
                                                    },
                                                  );
                                                } else if (dashboard
                                                        .statusStore ==
                                                    'Pending') {
                                                  return RoundedContainer(
                                                    radius: 20.r,
                                                    border: Border.all(
                                                      color:
                                                          Styles.color.primary,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .info_outline,
                                                                  color: Colors
                                                                      .red),
                                                              Text(
                                                                ' Warung Anda Sedang Diverifikasi',
                                                                style: Styles
                                                                    .font.bold,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            'Selama Menunggu Warung Anda Diverifikasi, mari menjelajahi menu-menu yang ada di aplikasi ini. Jika sudah diverifikasi, Anda dapat menambahkan menu baru di warung Anda.',
                                                            style:
                                                                Styles.font.xsm,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return RoundedContainer(
                                                    radius: 20.r,
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                      horizontal: 5,
                                                    ),
                                                    child: ListTile(
                                                      leading: CircleNetPic(
                                                        src: dashboard
                                                                .imageStore ??
                                                            '',
                                                        height: 60.h,
                                                        width: 55.h,
                                                      ),
                                                      title: Text(
                                                        dashboard.nameStore ??
                                                            '',
                                                        style: Styles.font.blg,
                                                      ),
                                                      subtitle: Text(
                                                        dashboard
                                                                .addressStore ??
                                                            '',
                                                        style: Styles.font.sm,
                                                      ),
                                                      trailing: IconButton(
                                                        onPressed: () {
                                                          context.push(
                                                            '/user-store',
                                                          );
                                                        },
                                                        icon: Icon(
                                                          BoxIcons
                                                              .bx_chevron_right,
                                                          color: Styles
                                                              .color.primary,
                                                          size: 30.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
