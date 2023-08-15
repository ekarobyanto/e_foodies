import 'dart:io';

import 'package:e_foodies/src/features/account/domain/account.dart';
import 'package:e_foodies/src/features/account/presentation/bloc/account_bloc.dart';
import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:e_foodies/src/utills/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/styles.dart';
import '../../../../core/bloc/app_bloc.dart';
import '../../../../core/bloc/image_bloc.dart';
import '../../../../utills/show_scaled_dialog.dart';
import '../../../shared/background.dart';
import '../../../shared/circle_net_pic.dart';

class EditAccount extends StatefulWidget {
  EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageBloc(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AccountBloc, AccountState>(
            listener: (context, state) {},
          ),
          BlocListener<ImageBloc, ImageState>(
            listener: (context, state) {},
          ),
        ],
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: Scaffold(
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.1.sh,
                            ),
                            EditImage(
                              enable: context.read<AppBloc>().state !=
                                  const AppState.loading(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextInput(
                              disableInput: context.read<AppBloc>().state ==
                                  const AppState.loading(),
                              label: 'Nama',
                              hint: 'Masukan nama baru anda',
                              validator: (value) {
                                return null;
                              },
                              textController: _nameController,
                            ),
                            TextInput(
                              disableInput: context.read<AppBloc>().state ==
                                  const AppState.loading(),
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
                              disableInput: context.read<AppBloc>().state ==
                                  const AppState.loading(),
                              label: 'Alamat',
                              hint: 'Masukan alamat baru anda',
                              validator: (value) {
                                return null;
                              },
                              textController: _addressController,
                            ),
                            TextInput(
                              disableInput: context.read<AppBloc>().state ==
                                  const AppState.loading(),
                              label: 'Ubah Password',
                              hint: 'Masukan Password baru anda',
                              validator: (value) {
                                if (value!.length < 8) {
                                  return 'Password minimal 8 karakter';
                                }
                                return null;
                              },
                              textController: _passwordController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ShrinkProperty(
                              onTap: () {
                                context
                                    .read<AppBloc>()
                                    .add(const AppEvent.loadingRequested());
                                // context.read<AccountBloc>().add(
                                //       AccountEvent.updateAccount(
                                //         Account(
                                //           id: '',
                                //           username: _nameController.text,
                                //           email: _emailController.text,
                                //           address: _addressController.text,
                                //           img: context
                                //               .read<ImageBloc>()
                                //               .state
                                //               .when(
                                //                 initial: () => '',
                                //                 imageUpdated: (imagePath) =>
                                //                     imagePath,
                                //               ),
                                //           isStore: false,
                                //         ),
                                //         _passwordController.text,
                                //       ),
                                //     );
                              },
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
                                    style: Styles.font.lg
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class EditImage extends StatelessWidget {
  EditImage({super.key, required this.enable});

  bool enable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return InkWell(
                onTap: () {
                  if (enable) {
                    showScaleDialog(
                      context,
                      AlertDialog(
                        title: Text(
                          'Gambar dari...',
                          style: Styles.font.bold,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                context.read<ImageBloc>().add(
                                      const ImageEvent.pickImage(
                                          ImageSource.camera),
                                    );
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.camera),
                              title: Text(
                                'Kamera',
                                style: Styles.font.base,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                context.read<ImageBloc>().add(
                                    const ImageEvent.pickImage(
                                        ImageSource.gallery));
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.photo_library),
                              title: Text(
                                'Galeri',
                                style: Styles.font.base,
                              ),
                            ),
                          ],
                        ),
                      ),
                      null,
                    );
                  }
                },
                child: CircleNetPic(
                  src: context.read<AccountBloc>().state.maybeMap(
                            orElse: () => '',
                            succes: (state) => state.account.img,
                          ) ??
                      '',
                  height: 100.h,
                  width: 100.h,
                ),
              );
            },
            imageUpdated: (imagePath) {
              return InkWell(
                onTap: () {
                  if (enable) {
                    showScaleDialog(
                      context,
                      AlertDialog(
                        title: Text(
                          'Gambar dari...',
                          style: Styles.font.bold,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                context.read<ImageBloc>().add(
                                      const ImageEvent.pickImage(
                                          ImageSource.camera),
                                    );
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.camera),
                              title: Text(
                                'Kamera',
                                style: Styles.font.base,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                context.read<ImageBloc>().add(
                                    const ImageEvent.pickImage(
                                        ImageSource.gallery));
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.photo_library),
                              title: Text(
                                'Galeri',
                                style: Styles.font.base,
                              ),
                            ),
                          ],
                        ),
                      ),
                      null,
                    );
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.file(
                    File(imagePath),
                    height: 100.h,
                    width: 100.h,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
