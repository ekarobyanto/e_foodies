import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/styles.dart';
import '../../../../shared/circle_net_pic.dart';
import '../../../../shared/error_screen.dart';
import '../../../../shared/loading_screen.dart';
import '../../../../shared/rounded_container.dart';
import '../../../../shared/shrink_property.dart';
import '../bloc/user_store_bloc.dart';
import 'menu_empty.dart';
import 'user_menu_list.dart';

class UserStorePage extends StatelessWidget {
  const UserStorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStoreBloc, UserStoreState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loading: () => const LoadingScreen(),
          error: (error) => Center(
            child: SizedBox(
              height: 1.sh,
              child: ErrorScreen(
                error: error,
                onRetry: () => context.read<UserStoreBloc>().add(
                      const UserStoreEvent.started(),
                    ),
              ),
            ),
          ),
          loaded: (store) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Center(
                  child: CircleNetPic(
                    src: store.img ?? '',
                    height: 150.h,
                    width: 150.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.store,
                          color: Styles.color.darkGreen,
                        ),
                        Text(
                          store.name,
                          style: Styles.font.bxl2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Styles.color.darkGreen,
                        ),
                        Text(
                          store.address,
                          style: Styles.font.sm,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Styles.color.darkGreen,
                        ),
                        Text(
                          ' ${store.openTime} - ${store.closeTime}',
                          style: Styles.font.sm,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ShrinkProperty(
                          onTap: () {
                            context.push('/add-menu');
                          },
                          child: RoundedContainer(
                            radius: 10.r,
                            color: Styles.color.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            heightWidth: Size(0.4.sw, 50.h),
                            child: Center(
                              child: Text(
                                'Tambah Menu',
                                style: Styles.font.base
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        ShrinkProperty(
                          onTap: () {
                            context.push(
                              '/edit-user-store',
                              // extra: context.read<UserStoreBloc>(),
                            );
                          },
                          child: RoundedContainer(
                            radius: 10.r,
                            heightWidth: Size(0.4.sw, 50.h),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            border: Border.all(color: Styles.color.primary),
                            child: Center(
                              child: Text(
                                'Edit Warung',
                                style: Styles.font.base
                                    .copyWith(color: Styles.color.primary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Styles.color.darkGreen,
                  thickness: 1.5,
                ),
                store.recipes.isEmpty
                    ? const Center(child: MenuEmpty())
                    : UserStoreMenuList(
                        menus: store.recipes,
                      )
              ],
            );
          },
        );
      },
    );
  }
}
