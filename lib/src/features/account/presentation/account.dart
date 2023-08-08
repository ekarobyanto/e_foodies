import 'package:e_foodies/src/features/dashboard/presentation/widgets/promotion_card.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/styles.dart';
import '../../shared/background.dart';

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
            child: Column(
              children: [
                SizedBox(
                  height: 1.sh * 0.05,
                ),
                CircleNetPic(
                  src:
                      'https://images.unsplash.com/photo-1612833609248-5e9b4a1b0b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXR5JTIwY2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                  height: 120.h,
                  width: 120.h,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'asdasd',
                  style: Styles.font.blg,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          'email@email.com',
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
                            'Jl. Alamat timur, 12 Bukan Kota Malang',
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
                            context.pushNamed('edit-account');
                          },
                          child: RoundedContainer(
                            radius: 20,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            border: Border.all(
                              color: Styles.color.primary,
                              width: 1.5,
                            ),
                            child: Text(
                              'Ubah Profil',
                              style: Styles.font.base.copyWith(
                                color: Styles.color.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Warung',
                          style: Styles.font.blg,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: PromotionCard(
                            title: 'Daftarkan warung',
                            desc:
                                'Anda belum pernah melakukan pendaftaran warung',
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
