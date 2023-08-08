import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Background(
        child: SizedBox(
          height: 1.sh,
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
                CircleNetPic(
                  src: '',
                  height: 100.h,
                  width: 100.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Nama Warung',
                  style: Styles.font.bxl2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
