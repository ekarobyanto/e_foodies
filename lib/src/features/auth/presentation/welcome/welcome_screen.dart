import 'package:e_foodies/src/constants/styles.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/gradient_layer.dart';
import 'components/image_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageBackground(),
          const GradientLayer(),
          SafeArea(
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
                        style: Styles.font.xl.copyWith(color: Colors.grey[300]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      ShrinkProperty(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Mulai',
                            style:
                                Styles.font.base.copyWith(color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah punya akun? ',
                            style:
                                Styles.font.base.copyWith(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {},
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
                                style: Styles.font.bold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ShrinkProperty(
                      //   onTap: () {},
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.white.withOpacity(0.2),
                      //         borderRadius: BorderRadius.circular(30.r),
                      //         border: Border.all(color: Colors.white)),
                      //     padding: const EdgeInsets.symmetric(vertical: 10),
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       'Masuk',
                      //       style:
                      //           Styles.font.base.copyWith(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
