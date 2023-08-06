import 'package:e_foodies/src/constants/styles.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/store/presentation/widgets/warung_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../menu/domain/ingredient/ingredient.dart';
import '../../menu/domain/menu/menu.dart';
import '../domain/store.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

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
                    'Warung',
                    style: Styles.font.bxl6,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'Lihat warung yang tersedia',
                    style: Styles.font.base,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    shrinkWrap: true,
                    itemCount: 15,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => WarungCard(
                      warung: Store(
                        id: 'id',
                        name: 'Warung Anjing',
                        desc: 'Warung Anjing adalah warung yang menjual anjing',
                        user: 'Anjing',
                        address: 'Jl.Anjing',
                        phone: 'asd',
                        menus: [
                          Menu(
                            id: 'id',
                            storeAddress: 'Jl.Anjing',
                            desc: 'asdasddasd',
                            name: 'Anjing Bakar',
                            user: 'Anjing',
                            store: 'asd',
                            ingredients: [
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                            ],
                          ),
                          Menu(
                            id: 'id',
                            desc: 'asdasddasd',
                            storeAddress: 'Jl.Anjing',
                            name: 'Anjing Goreng',
                            user: 'Anjing',
                            store: 'asd',
                            ingredients: [
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                              Ingredient(id: 'asdasd', name: 'Anjing'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
