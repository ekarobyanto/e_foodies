import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:e_foodies/src/utills/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/styles.dart';
import '../../../../core/bloc/app_bloc.dart';
import '../../../shared/background.dart';
import '../../../shared/circle_net_pic.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Center(
                  child: CircleNetPic(
                    src: '',
                    height: 100.h,
                    width: 100.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextInput(
                  disableInput:
                      context.read<AppBloc>().state == const AppState.loading(),
                  label: 'Nama',
                  hint: 'Masukan nama baru anda',
                  validator: (value) {
                    return null;
                  },
                  textController: _namaController,
                ),
                TextInput(
                  disableInput:
                      context.read<AppBloc>().state == const AppState.loading(),
                  label: 'Email',
                  hint: 'Masukan email baru anda',
                  validator: (value) {
                    if (value != null) {
                      if (validateEmail(value)) {
                        return null;
                      } else {
                        return 'Email tidak valid';
                      }
                    }
                    return null;
                  },
                  textController: _emailController,
                ),
                TextInput(
                  disableInput:
                      context.read<AppBloc>().state == const AppState.loading(),
                  label: 'Alamat',
                  hint: 'Masukan alamat baru anda',
                  validator: (value) {
                    if (value != null) {
                      if (validateEmail(value)) {
                        return null;
                      } else {
                        return 'Email tidak valid';
                      }
                    }
                    return null;
                  },
                  textController: _addressController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ShrinkProperty(
                  onTap: () {},
                  child: RoundedContainer(
                    radius: 20,
                    color: Styles.color.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: Styles.font.blg.copyWith(color: Colors.white),
                      ),
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
