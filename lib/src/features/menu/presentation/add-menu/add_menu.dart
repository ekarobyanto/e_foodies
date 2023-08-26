import 'dart:io';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/menu/domain/menu-form/menu_form.dart';
import 'package:e_foodies/src/features/menu/presentation/add-menu/cubit/add-menu/add_menu_cubit.dart';
import 'package:e_foodies/src/features/menu/presentation/add-menu/cubit/ingredient/ingredient_state_cubit.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/shared/error_dialog.dart';
import 'package:e_foodies/src/features/shared/success_dialog.dart';
import 'package:e_foodies/src/features/store/presentation/user-store/bloc/user_store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/image_path.dart';
import '../../../../constants/styles.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/image/image_bloc.dart';
import '../../../../core/data/storage/storage_repository.dart';
import '../../../../utills/show_scaled_dialog.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import '../../../shared/text_input.dart';
import '../../data/menu_repository.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _formController = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
        BlocProvider(
          create: (context) => IngredientStateCubit(),
        ),
        BlocProvider(
          create: (context) => AddMenuCubit(
              authRepository: context.read<AuthRepository>(),
              storageRepository: context.read<StorageRepository>(),
              menuRepository: MenuRepository()),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          final appState = context.read<AppBloc>().state;
          if (appState == const AppState.loading()) {
            return false;
          } else {
            return true;
          }
        },
        child: BlocListener<AddMenuCubit, AddMenuState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                    context,
                    SuccessDialog(
                      title: 'Menu Berhasil Ditambahkan',
                      action: () {
                        context.pop();
                        context.pop();
                        context
                            .read<UserStoreBloc>()
                            .add(const UserStoreEvent.started());
                      },
                    ),
                    false);
              },
              error: (error) {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                  context,
                  ErrorDialog(
                    title: error,
                    action: () {
                      context.pop();
                    },
                  ),
                  null,
                );
              },
            );
          },
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Styles.color.darkGreen,
                elevation: 0,
                toolbarHeight: 0,
              ),
              body: SingleChildScrollView(
                child: Background(
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Form(
                            key: _formController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 0.1.sh,
                                ),
                                Text(
                                  'Tambahkan Menu',
                                  style: Styles.font.bxl2,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Isi data menu',
                                  style: Styles.font.base,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                BlocBuilder<ImageBloc, ImageState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
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
                                                      context
                                                          .read<ImageBloc>()
                                                          .add(
                                                            const ImageEvent
                                                                    .pickImage(
                                                                ImageSource
                                                                    .camera),
                                                          );
                                                      Navigator.pop(context);
                                                    },
                                                    leading: const Icon(
                                                        Icons.camera),
                                                    title: Text(
                                                      'Kamera',
                                                      style: Styles.font.base,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    onTap: () {
                                                      context
                                                          .read<ImageBloc>()
                                                          .add(const ImageEvent
                                                                  .pickImage(
                                                              ImageSource
                                                                  .gallery));
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
                                          child: RoundedContainer(
                                            radius: 180.r,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(180.r),
                                              clipBehavior: Clip.antiAlias,
                                              child: Image.asset(
                                                Assets.defaultImage,
                                                height: 150.h,
                                                width: 150.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      imageUpdated: (imagePath) => InkWell(
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
                                                    context
                                                        .read<ImageBloc>()
                                                        .add(
                                                          const ImageEvent
                                                                  .pickImage(
                                                              ImageSource
                                                                  .camera),
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
                                                    context
                                                        .read<ImageBloc>()
                                                        .add(const ImageEvent
                                                                .pickImage(
                                                            ImageSource
                                                                .gallery));
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
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: RoundedContainer(
                                            radius: 180.r,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(180.r),
                                              child: Image.file(
                                                File(imagePath),
                                                height: 150.h,
                                                width: 150.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                  label: 'Nama Menu',
                                  hint: 'Masukan nama menu',
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Nama menu tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  textController: _nameController,
                                ),
                                TextInput(
                                  disableInput: context.read<AppBloc>().state ==
                                      const AppState.loading(),
                                  label: 'Deskripsi Menu',
                                  hint: 'Masukan deskripsi menu',
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Deskripsi menu tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  textController: _descController,
                                ),
                                TextInput(
                                  disableInput: context.read<AppBloc>().state ==
                                      const AppState.loading(),
                                  label: 'Harga',
                                  hint: 'Masukan harga menu',
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Harga menu tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  textController: _priceController,
                                  keyboardType: TextInputType.number,
                                ),
                                Text(
                                  'Komposisi',
                                  style: Styles.font.bold,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                BlocBuilder<IngredientStateCubit,
                                    IngredientStateState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      updated: (ingredients) {
                                        return IngredientItems(
                                          ingredients: ingredients,
                                        );
                                      },
                                      orElse: () => const SizedBox(),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Builder(builder: (context) {
                                  return InkWell(
                                    onTap: () {
                                      context
                                          .read<IngredientStateCubit>()
                                          .addIngredient('');
                                    },
                                    child: RoundedContainer(
                                      radius: 20.r,
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          RoundedContainer(
                                            radius: 180.r,
                                            color: Styles.color.primary,
                                            padding: const EdgeInsets.all(10),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            'Tambahkan Komposisi',
                                            style: Styles.font.lg,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 0.1.sh,
                                ),
                                BlocBuilder<AppBloc, AppState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => ShrinkProperty(
                                        onTap: () {
                                          if (_formController.currentState!
                                                  .validate() &&
                                              context
                                                  .read<IngredientStateCubit>()
                                                  .ingredients
                                                  .isNotEmpty &&
                                              !context
                                                  .read<IngredientStateCubit>()
                                                  .ingredients
                                                  .contains('') &&
                                              context.read<ImageBloc>().state !=
                                                  const ImageState.initial()) {
                                            context.read<AppBloc>().add(
                                                const AppEvent
                                                    .loadingRequested());
                                            context
                                                .read<AddMenuCubit>()
                                                .submitMenu(
                                                  MenuForm(
                                                    name: _nameController.text,
                                                    description:
                                                        _descController.text,
                                                    price:
                                                        _priceController.text,
                                                    ingredients: context
                                                        .read<
                                                            IngredientStateCubit>()
                                                        .ingredients,
                                                    image: context
                                                        .read<ImageBloc>()
                                                        .state
                                                        .maybeWhen(
                                                          orElse: () => '',
                                                          imageUpdated:
                                                              (imagePath) =>
                                                                  imagePath,
                                                        ),
                                                  ),
                                                );
                                          } else {
                                            showScaleDialog(
                                                context,
                                                ErrorDialog(
                                                  title:
                                                      'Cek Kembali Data Menu Anda',
                                                  action: () {
                                                    context.pop();
                                                  },
                                                ),
                                                null);
                                          }
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
                                              'Tambahkan Menu',
                                              style: Styles.font.bold.copyWith(
                                                  color: Colors.white),
                                            ),
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
                                SizedBox(
                                  height: 0.01.sh,
                                ),
                              ],
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
        ),
      ),
    );
  }
}

class IngredientItems extends StatelessWidget {
  const IngredientItems({
    super.key,
    required this.ingredients,
  });

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 10.h,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredients.length,
      itemBuilder: (context, index) => IngredientItem(
        ingredient: ingredients[index],
        index: index,
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key, required this.ingredient, required this.index});

  final String ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      radius: 10.r,
      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        )
      ],
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.read<IngredientStateCubit>().removeIngredient(index);
            },
            child: Icon(
              Icons.delete,
              color: Styles.color.danger,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(
              width: 0.7.sw,
              child: TextField(
                onChanged: (v) {
                  context.read<IngredientStateCubit>().editIngredient(v, index);
                },
                style: Styles.font.base,
                cursorColor: Styles.color.primary,
                decoration: const InputDecoration(
                  hintText: 'Nama komposisi',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
