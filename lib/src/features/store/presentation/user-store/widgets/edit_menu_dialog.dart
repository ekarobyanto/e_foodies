import 'package:e_foodies/src/features/menu/presentation/add-menu/cubit/ingredient/ingredient_state_cubit.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/styles.dart';
import '../../../../../core/bloc/image/image_bloc.dart';
import '../../../../menu/domain/menu/menu.dart';
import '../../../../shared/circle_net_pic.dart';
import '../../../../shared/rounded_container.dart';
import 'edit_ingredient_item.dart';

class EditMenuDialog extends StatefulWidget {
  const EditMenuDialog({
    super.key,
    required this.menu,
  });

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
                    Text('Data Menu', style: Styles.font.blg),
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
                Align(
                  alignment: Alignment.center,
                  child: CircleNetPic(
                    src: widget.menu.img,
                    height: 150.h,
                    width: 150.h,
                  ),
                ),
                TextInput(
                  label: 'Nama Menu',
                  validator: (value) {
                    return null;
                  },
                  textController: nameController,
                  disableInput: false,
                ),
                TextInput(
                  label: 'Deskripsi Menu',
                  validator: (value) {
                    return null;
                  },
                  textController: descController,
                  disableInput: false,
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
                                key: ValueKey(index),
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
                          context
                              .read<IngredientStateCubit>()
                              .addIngredient('');
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
                      RoundedContainer(
                        radius: 10.r,
                        color: Styles.color.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Ubah Data Menu',
                            style:
                                Styles.font.bold.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
