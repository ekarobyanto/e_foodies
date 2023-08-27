import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/image_path.dart';
import '../../../../constants/styles.dart';
import '../../../dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../../shared/background.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import 'widgets/no_store.dart';
import 'widgets/user_store_page.dart';

class UserStore extends StatelessWidget {
  UserStore({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.color.darkGreen,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Background(
          child: SizedBox(
            width: 1.sw,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: context.read<DashboardBloc>().state.maybeMap(
                    orElse: () => const SizedBox(),
                    success: (value) {
                      if (value.dashboard.statusStore == "Approved") {
                        return const UserStorePage();
                      }
                      if (value.dashboard.statusStore == 'Pending') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.1.sh,
                            ),
                            Text(
                              'Warung Anda Sedang Diverifikasi',
                              style: Styles.font.bxl3,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Image.asset(
                              Assets.restaurant,
                              filterQuality: FilterQuality.medium,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ShrinkProperty(
                              onTap: () {
                                context.pop();
                              },
                              child: RoundedContainer(
                                radius: 20.r,
                                border: Border.all(
                                  color: Styles.color.darkGreen,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Center(
                                  child: Text(
                                    'Kembali',
                                    style: Styles.font.lg.copyWith(
                                      color: Styles.color.darkGreen,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const NoStoreView();
                      }
                    },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
