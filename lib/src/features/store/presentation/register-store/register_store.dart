import 'dart:io';

import 'package:e_foodies/src/constants/image_path.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/shared/error_dialog.dart';
import 'package:e_foodies/src/features/shared/success_dialog.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_foodies/src/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/image/image_bloc.dart';
import '../../../../core/data/storage/storage_repository.dart';
import '../../../../utills/show_scaled_dialog.dart';
import '../../../dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import '../../data/store_repository.dart';
import '../../domain/store-form/store_form.dart';
import 'bloc/create_store_bloc.dart';
import 'widget/label_time_input.dart';

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
  final _openTimeController = TextEditingController();
  final _closeTimeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _openTimeController.dispose();
    _closeTimeController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImageBloc(),
          ),
          BlocProvider(
            create: (context) => CreateStoreBloc(
              authRepository: context.read<AuthRepository>(),
              storageRepository: context.read<StorageRepository>(),
              storeRepository: context.read<StoreRepository>(),
            ),
          ),
        ],
        child: BlocListener<CreateStoreBloc, CreateStoreState>(
          listener: (context, state) {
            state.maybeWhen(
              createStoreFailed: (error) {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                    context,
                    ErrorDialog(
                      title: error,
                      action: () => context.pop(),
                    ),
                    null);
              },
              storeCreated: () {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                  context,
                  SuccessDialog(
                    title: 'Toko Anda Berhasil Dibuat!',
                    action: () {
                      context.pop();
                      context
                          .read<DashboardBloc>()
                          .add(const DashboardEvent.refresh());
                      context.go('/dashboard');
                    },
                  ),
                  null,
                );
              },
              orElse: () {},
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
                        child: Form(
                          key: _formKey,
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
                                textController: _addressController,
                              ),
                              TextInput(
                                disableInput: context.read<AppBloc>().state ==
                                    const AppState.loading(),
                                label: 'Nomor Telpon Whatsapp',
                                hint: 'Masukan nomor telpon',
                                keyboardType: TextInputType.phone,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Nomor telpon tidak boleh kosong';
                                  }
                                  return null;
                                },
                                textController: _phoneController,
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
                                      if (p0 == null || p0.isEmpty) {
                                        return 'Jam buka tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    timeController: _openTimeController,
                                    label: 'Jam Buka',
                                  ),
                                  LabelTimeInput(
                                    disableInput:
                                        context.read<AppBloc>().state ==
                                            const AppState.loading(),
                                    validator: (p0) {
                                      if (p0 == null || p0.isEmpty) {
                                        return 'Jam tutup tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    timeController: _closeTimeController,
                                    label: 'Jam Tutup',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.1.sh,
                              ),
                              ShrinkProperty(
                                onTap: () {
                                  if (context.read<ImageBloc>().state ==
                                      const ImageState.initial()) {
                                    showScaleDialog(
                                        context,
                                        ErrorDialog(
                                          title:
                                              'Mohon sertakan foto warung Anda',
                                          action: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        null);
                                  } else
                                  if (_formKey.currentState!.validate()) {
                                    context.read<CreateStoreBloc>().add(
                                          CreateStoreEvent.submitStore(
                                            form: StoreForm(
                                              name: _nameController.text,
                                              desc: _descriptionController.text,
                                              address: _addressController.text,
                                              phone: _phoneController.text,
                                              openTime:
                                                  _openTimeController.text,
                                              closeTime:
                                                  _closeTimeController.text,
                                              imagePath: context
                                                  .read<ImageBloc>()
                                                  .state
                                                  .maybeWhen(
                                                    orElse: () => '',
                                                    imageUpdated: (imagePath) =>
                                                        imagePath,
                                                  ),
                                            ),
                                          ),
                                        );
                                    context
                                        .read<AppBloc>()
                                        .add(const AppEvent.loadingRequested());
                                  } else {
                                    return;
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
                                            'Daftarkan Warung',
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
