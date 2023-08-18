import 'package:e_foodies/src/constants/image_path.dart';
import 'package:e_foodies/src/core/bloc/account/account_bloc.dart';
import 'package:e_foodies/src/features/dashboard/presentation/widgets/promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/styles.dart';
import '../../shared/background.dart';

class UserStore extends StatelessWidget {
  const UserStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: context.read<AccountBloc>().state.maybeMap(
                    orElse: () => const SizedBox(),
                    succes: (value) {
                      return value.account.isStore
                          ? const SizedBox()
                          : const NoStoreView();
                    },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoStoreView extends StatelessWidget {
  const NoStoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.1.sh,
        ),
        Text(
          'Daftarkan Warung Anda',
          style: Styles.font.bxl3,
          // textAlign: TextAlign.center,
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
        Text(
          'Daftarkan warung anda ke aplikasi dan dapatkan keuntungan lebih',
          style: Styles.font.lg.copyWith(
            color: Styles.color.darkGreen,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        PromotionCard(
          title: 'Daftarkan warung',
          desc:
              'Dengan mendaftarkan warung anda ke aplikasi, anda juga dapat lebih mudah mengembangkan warung anda',
          onTap: () {
            context.push('/create-store');
          },
        )
      ],
    );
  }
}
