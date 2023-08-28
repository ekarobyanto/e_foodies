import 'dart:developer';
import 'dart:io';

import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:e_foodies/src/features/shared/success_dialog.dart';
import 'package:e_foodies/src/features/store/domain/store-form/store_form.dart';
import 'package:e_foodies/src/features/store/presentation/edit-user-store/cubit/edit_user_store_cubit.dart';
import 'package:e_foodies/src/features/store/presentation/user-store/bloc/user_store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../router/router.dart';
import '../../../shared/text_input.dart';
import '../../../shared/background.dart';
import '../../data/store_repository.dart';
import '../../../shared/error_dialog.dart';
import '../../../../constants/styles.dart';
import '../../../shared/shrink_property.dart';
import '../../../../constants/image_path.dart';
import '../../../shared/rounded_container.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../utills/show_scaled_dialog.dart';
import '../../../../core/bloc/image/image_bloc.dart';
import '../register-store/widget/label_time_input.dart';

class EditUserStore extends StatefulWidget {
  EditUserStore({
    super.key,
  });

  @override
  State<EditUserStore> createState() => _EditUserStoreState();
}

class _EditUserStoreState extends State<EditUserStore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    phoneController.dispose();
    openTimeController.dispose();
    closeTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final appState = context.read<AppBloc>().state;
        if (appState == const AppState.loading()) {
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ImageBloc(),
            ),
            BlocProvider(
              create: (context) => EditUserStoreCubit(
                authRepository: context.read<AuthRepository>(),
                storageRepository: context.read<StorageRepository>(),
                storeRepository: StoreRepository(),
              ),
            )
          ],
          child: BlocListener<EditUserStoreCubit, EditUserStoreState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (error) {
                  context.read<AppBloc>().add(const AppEvent.loadingComplete());
                  showScaleDialog(
                    context,
                    ErrorDialog(
                      title: error,
                      action: () => context.pop(),
                    ),
                    null,
                  );
                },
                updateSucces: () {
                  context.read<AppBloc>().add(const AppEvent.loadingComplete());
                  context
                      .read<UserStoreBloc>()
                      .add(const UserStoreEvent.started());
                  showScaleDialog(
                    context,
                    SuccessDialog(
                      title: 'Toko Anda berhasil diubah',
                      action: () {
                        router.pop();
                        router.pop();
                      },
                    ),
                    null,
                    isDismissible: false,
                  );
                },
              );
            },
            child: Builder(
              builder: (context) {
                return Scaffold(
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
                                'Edit Warung',
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
                              BlocBuilder<ImageBloc, ImageState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => InkWell(
                                      onTap: () => showScaleDialog(
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
                                                        const ImageEvent
                                                                .pickImage(
                                                            ImageSource.camera),
                                                      );
                                                  Navigator.pop(context);
                                                },
                                                leading:
                                                    const Icon(Icons.camera),
                                                title: Text(
                                                  'Kamera',
                                                  style: Styles.font.base,
                                                ),
                                              ),
                                              ListTile(
                                                onTap: () {
                                                  context.read<ImageBloc>().add(
                                                      const ImageEvent
                                                              .pickImage(
                                                          ImageSource.gallery));
                                                  Navigator.pop(context);
                                                },
                                                leading: const Icon(
                                                    Icons.photo_library),
                                                title: Text(
                                                  'Galeri',
                                                  style: Styles.font.base,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        null,
                                      ),
                                      child: Image.asset(Assets.defaultImage),
                                    ),
                                    imageUpdated: (imagePath) => Image.file(
                                      File(imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
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
                                  return null;
                                },
                                textController: nameController,
                              ),
                              TextInput(
                                disableInput: context.read<AppBloc>().state ==
                                    const AppState.loading(),
                                label: 'Deskripsi Warung',
                                hint: 'Masukan deskripsi warung',
                                validator: (v) {
                                  return null;
                                },
                                textController: descriptionController,
                              ),
                              TextInput(
                                disableInput: context.read<AppBloc>().state ==
                                    const AppState.loading(),
                                label: 'Alamat Warung',
                                hint: 'Masukan alamat warung',
                                validator: (v) {
                                  return null;
                                },
                                textController: addressController,
                              ),
                              TextInput(
                                disableInput: context.read<AppBloc>().state ==
                                    const AppState.loading(),
                                label: 'Nomor Telpon Whatsapp',
                                hint: 'Masukan nomor telpon',
                                keyboardType: TextInputType.phone,
                                validator: (v) {
                                  return null;
                                },
                                textController: phoneController,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  LabelTimeInput(
                                    disableInput:
                                        context.read<AppBloc>().state ==
                                            const AppState.loading(),
                                    validator: (p0) {
                                      return null;
                                    },
                                    timeController: openTimeController,
                                    label: 'Jam Buka',
                                  ),
                                  LabelTimeInput(
                                    disableInput:
                                        context.read<AppBloc>().state ==
                                            const AppState.loading(),
                                    validator: (p0) {
                                      return null;
                                    },
                                    timeController: closeTimeController,
                                    label: 'Jam Tutup',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.1.sh,
                              ),
                              ShrinkProperty(
                                onTap: () {
                                  if (nameController.text == '' &&
                                      descriptionController.text == '' &&
                                      addressController.text == '' &&
                                      phoneController.text == '' &&
                                      openTimeController.text == '' &&
                                      closeTimeController.text == '' &&
                                      context.read<ImageBloc>().state ==
                                          const ImageState.initial()) {
                                    log('');
                                  } else {
                                    context
                                        .read<AppBloc>()
                                        .add(const AppEvent.loadingRequested());
                                    context
                                        .read<EditUserStoreCubit>()
                                        .submitEdit(
                                          storeForm: StoreForm(
                                            name: nameController.text,
                                            desc: descriptionController.text,
                                            address: addressController.text,
                                            phone: phoneController.text,
                                            openTime: openTimeController.text,
                                            closeTime: closeTimeController.text,
                                            imagePath: context
                                                .read<ImageBloc>()
                                                .state
                                                .maybeWhen(
                                                  orElse: () => '',
                                                  imageUpdated: (imagePath) =>
                                                      imagePath,
                                                ),
                                          ),
                                        );
                                  }
                                },
                                child: BlocBuilder<AppBloc, AppState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => RoundedContainer(
                                        radius: 20,
                                        color: Styles.color.primary,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Ubah Informasi Warung',
                                            style: Styles.font.bold
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      loading: () => Center(
                                        child: CircularProgressIndicator(
                                          color: Styles.color.primary,
                                        ),
                                      ),
                                    );
                                  },
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
