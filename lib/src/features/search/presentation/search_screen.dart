import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: Styles.color.darkGreen,
        ),
        body: SizedBox(
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundedContainer(
                  radius: 20,
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      isDense: true,
                      icon: IconButton(
                        iconSize: 24,
                        alignment: Alignment.center,
                        splashRadius: 30,
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Styles.color.primary),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Cari menu atau warung...',
                      hintStyle: Styles.font.sm.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
