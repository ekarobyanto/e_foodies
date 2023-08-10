import 'package:e_foodies/src/features/menu/presentation/widgets/menu_dashboard_card.dart';
import 'package:e_foodies/src/features/menu/domain/menu/menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.1.sh,
                  ),
                  Text(
                    'Nama Warung',
                    style: Styles.font.bxl2,
                  ),
                  Text(
                    'Alamat warung yang sangat panjang',
                    style: Styles.font.sm,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Telpon : 08123456789',
                    style: Styles.font.sm,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    color: Colors.white,
                    width: 1.sw,
                    height: 0.3.sh,
                    child: CachedNetworkImage(
                      imageUrl: '',
                      width: 1.sw,
                    ),
                  ),
                  Divider(
                    color: Styles.color.darkGreen,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: ListView.separated(
                      itemCount: 10,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container();
                        // return MenuCard(
                        //   menu: Menu(
                        //     id: 'asd',
                        //     name: 'asdad',
                        //     user: 'adsasd',
                        //     store: 'asdasd',
                        //     storeAddress: 'adasdasd',
                        //     desc: 'asdasd',
                        //     ingredients: [],
                        //   ),
                        // );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
