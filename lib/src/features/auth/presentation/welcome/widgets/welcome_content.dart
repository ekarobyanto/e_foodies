import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/styles.dart';
import '../widgets/start_button.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  'Selamat Datang',
                  style: Styles.font.bxl6.copyWith(color: Colors.white),
                ),
                RichText(
                  text: TextSpan(
                    text: 'di',
                    style: Styles.font.bxl6.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: ' eFoodies',
                        style: Styles.font.bxl6.copyWith(
                          color: Styles.color.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Temukan dan pesan makanan favoritmu lewat sentuhan jari.',
                  style: Styles.font.xl2.copyWith(color: Colors.grey[300]),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const StartButton(),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: Styles.font.base.copyWith(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => context.push('/login'),
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 0,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Styles.color.primary,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Text(
                          'Masuk',
                          style: Styles.font.bold.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
