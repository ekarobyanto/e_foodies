import 'package:e_foodies/src/features/menu/domain/ingredient/ingredient.dart';
import 'package:e_foodies/src/features/menu/domain/menu/menu.dart';
import 'package:e_foodies/src/features/menu/presentation/widgets/menu_dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/styles.dart';
import '../../shared/background.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.color.darkGreen,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SizedBox(
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'Menu',
                    style: Styles.font.bxl6,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'Lihat menu yang tersedia pada warung mitra',
                    style: Styles.font.sm,
                  ),
                  Divider(
                    color: Styles.color.darkGreen,
                    thickness: 2,
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      shrinkWrap: true,
                      itemCount: 15,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => MenuDashboardCard(
                            menu: Menu(
                              id: 'asd',
                              name: 'Ayam Goyeng',
                              user: 'Warung Ayam',
                              storeAddress: 'Jl.Ayam',
                              store: 'Warung Ayam',
                              desc: 'Ayam Goyeng adalah ayam yang digoyeng',
                              ingredients: [
                                Ingredient(id: 'asd', name: 'Daging Sapi'),
                                Ingredient(id: 'asd', name: 'Daging Sapi'),
                                Ingredient(id: 'asd', name: 'Daging Sapi'),
                              ],
                            ),
                          )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
