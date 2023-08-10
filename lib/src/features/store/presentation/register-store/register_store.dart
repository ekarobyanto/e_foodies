import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_foodies/src/constants/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/bloc/app_bloc.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';

class CreateStore extends StatefulWidget {
  const CreateStore({super.key});

  @override
  State<CreateStore> createState() => _CreateStoreState();
}

class _CreateStoreState extends State<CreateStore> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: Background(
            child: SizedBox(
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.1.sh,
                    ),
                    Text(
                      'Buat Warung',
                      style: Styles.font.bxl2,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Isi data warung anda',
                      style: Styles.font.base,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CachedNetworkImage(
                      imageUrl: '',
                      width: 1.sw,
                      height: 0.2.sh,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextInput(
                      disableInput: context.read<AppBloc>().state ==
                          const AppState.loading(),
                      label: 'Nama Warung',
                      hint: 'Masukan nama warung',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Nama warung tidak boleh kosong';
                        }
                        return null;
                      },
                      textController: _nameController,
                    ),
                    TextInput(
                      disableInput: context.read<AppBloc>().state ==
                          const AppState.loading(),
                      label: 'Deskripsi Warung',
                      hint: 'Masukan deskripsi warung',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Deskripsi warung tidak boleh kosong';
                        }
                        return null;
                      },
                      textController: _descriptionController,
                    ),
                    TextInput(
                      disableInput: context.read<AppBloc>().state ==
                          const AppState.loading(),
                      label: 'Alamat Warung',
                      hint: 'Masukan alamat warung',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                      textController: _nameController,
                    ),
                    TextInput(
                      disableInput: context.read<AppBloc>().state ==
                          const AppState.loading(),
                      label: 'Nomor Telpon',
                      hint: 'Masukan nomor telpon',
                      keyboardType: TextInputType.phone,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Nomor telpon tidak boleh kosong';
                        }
                        return null;
                      },
                      textController: _nameController,
                    ),
                    SizedBox(
                      height: 0.1.sh,
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
                            'Daftarkan Warung',
                            style:
                                Styles.font.bold.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
