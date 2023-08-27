import 'dart:io';

import 'package:e_foodies/src/features/menu/domain/menu-form/menu_form.dart';
import 'package:e_foodies/src/features/menu/presentation/add-menu/cubit/ingredient/ingredient_state_cubit.dart';
import 'package:e_foodies/src/features/shared/error_dialog.dart';
import 'package:e_foodies/src/features/shared/pick_image_from.dart';
import 'package:e_foodies/src/features/shared/success_dialog.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:e_foodies/src/utills/show_scaled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/styles.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/image/image_bloc.dart';
import '../../../../menu/domain/menu/menu.dart';
import '../../../../shared/circle_net_pic.dart';
import '../../../../shared/rounded_container.dart';
import '../../../../shared/shrink_property.dart';
import '../bloc/user_store_bloc.dart';
import 'edit_ingredient_item.dart';

class EditMenuDialog extends StatefulWidget {
  const EditMenuDialog({super.key, required this.menu});

  final Menu menu;

  @override
  State<EditMenuDialog> createState() => _EditMenuDialogState();
}

class _EditMenuDialogState extends State<EditMenuDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.menu.name;
    descController.text = widget.menu.desc;
    priceController.text = widget.menu.price.toString();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
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
          create: (context) => IngredientStateCubit()
            ..initializeIngredients(
              widget.menu.ingredients,
            ),
        ),
      ],
      child: BlocListener<UserStoreBloc, UserStoreState>(
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
            loaded: (store) {
              context.read<AppBloc>().add(const AppEvent.loadingComplete());
              showScaleDialog(
                  context,
                  SuccessDialog(
                    title: 'Data Menu Berhasil Dirubah',
                    action: () => context.pop(),
                  ),
                  null);
            },
          );
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Data Menu',
                        style: Styles.font.blg,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text('Hapus Menu',
                            style: Styles.font.sm
                                .copyWith(color: Styles.color.danger)),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Builder(builder: (context) {
                    return Align(
                      alignment: Alignment.center,
                      child: context.watch<ImageBloc>().state.maybeMap(
                            orElse: () => InkWell(
                              onTap: () => context.read<AppBloc>().state !=
                                      const AppState.loading()
                                  ? showScaleDialog(
                                      context,
                                      PickImageFromDialog(
                                        imageBloc: context.read<ImageBloc>(),
                                      ),
                                      null)
                                  : null,
                              child: CircleNetPic(
                                src: widget.menu.img,
                                height: 150.h,
                                width: 150.h,
                              ),
                            ),
                            imageUpdated: (value) {
                              return InkWell(
                                onTap: () => showScaleDialog(
                                    context,
                                    PickImageFromDialog(
                                      imageBloc: context.read<ImageBloc>(),
                                    ),
                                    null),
                                child: RoundedContainer(
                                  radius: 180.r,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(180.r),
                                    child: Image.file(
                                      File(value.imagePath),
                                      height: 150.h,
                                      width: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    );
                  }),
                  TextInput(
                    label: 'Nama Menu',
                    validator: (value) {
                      return null;
                    },
                    textController: nameController,
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
                  ),
                  TextInput(
                    label: 'Deskripsi Menu',
                    validator: (value) {
                      return null;
                    },
                    textController: descController,
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
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
                    textController: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Komposisi',
                    style: Styles.font.bsm,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<IngredientStateCubit, IngredientStateState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const SizedBox();
                        },
                        updated: (ingredients) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: context
                                .read<IngredientStateCubit>()
                                .ingredients
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: EditIngredientItem(
                                  key: ValueKey(ingredients[index].id),
                                  ingredient: context
                                      .read<IngredientStateCubit>()
                                      .ingredients[index],
                                  index: index,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  Builder(builder: (context) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<AppBloc>().state !=
                                    const AppState.loading()
                                ? context
                                    .read<IngredientStateCubit>()
                                    .addIngredient('')
                                : null;
                          },
                          child: RoundedContainer(
                            radius: 20.r,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Styles.color.primary,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'Tambahkan Komposisi',
                                  style: Styles.font.sm,
                                )
                              ],
                            ),
                          ),
                        ),
                        BlocBuilder<AppBloc, AppState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => ShrinkProperty(
                                onTap: () {
                                  if (context.read<ImageBloc>().state !=
                                      const ImageState.initial()) {
                                    context
                                        .read<AppBloc>()
                                        .add(const AppEvent.loadingRequested());
                                    context.read<UserStoreBloc>().add(
                                          UserStoreEvent.updateMenuImage(
                                            widget.menu.id,
                                            context
                                                .read<ImageBloc>()
                                                .state
                                                .maybeMap(
                                                    imageUpdated: (value) =>
                                                        value.imagePath,
                                                    orElse: () => ''),
                                          ),
                                        );
                                  } else if (nameController.text !=
                                          widget.menu.name ||
                                      descController.text != widget.menu.desc ||
                                      priceController.text !=
                                          widget.menu.price.toString() ||
                                      context
                                              .read<IngredientStateCubit>()
                                              .ingredients !=
                                          widget.menu.ingredients) {
                                    context
                                        .read<AppBloc>()
                                        .add(const AppEvent.loadingRequested());
                                    context.read<UserStoreBloc>().add(
                                          UserStoreEvent.updateMenu(
                                            MenuForm(
                                              name: nameController.text,
                                              description: descController.text,
                                              price: priceController.text,
                                              ingredients: context
                                                  .read<IngredientStateCubit>()
                                                  .ingredients
                                                  .map((e) => e.name)
                                                  .toList(),
                                              image: context
                                                  .read<ImageBloc>()
                                                  .state
                                                  .maybeMap(
                                                      imageUpdated: (value) =>
                                                          value.imagePath,
                                                      orElse: () => ''),
                                            ),
                                            widget.menu.id,
                                          ),
                                        );
                                  }
                                },
                                child: RoundedContainer(
                                  radius: 10.r,
                                  color: Styles.color.primary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Ubah Data Menu',
                                      style: Styles.font.bold
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              loading: () => CircularProgressIndicator(
                                color: Styles.color.primary,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
