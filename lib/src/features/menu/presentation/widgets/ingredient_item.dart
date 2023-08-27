import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/styles.dart';
import '../../../shared/rounded_container.dart';
import '../../domain/ingredient/ingredient.dart';
import '../add-menu/cubit/ingredient/ingredient_state_cubit.dart';

class IngredientItem extends StatefulWidget {
  const IngredientItem(
      {super.key, required this.ingredient, required this.index});

  final Ingredient ingredient;
  final int index;

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.ingredient.name;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              context
                  .read<IngredientStateCubit>()
                  .removeIngredient(widget.index);
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
              child: Focus(
                onFocusChange: (value) => value
                    ? null
                    : context
                        .read<IngredientStateCubit>()
                        .editIngredient(controller.text, widget.index),
                child: TextField(
                  style: Styles.font.base,
                  controller: controller,
                  cursorColor: Styles.color.primary,
                  decoration: const InputDecoration(
                    hintText: 'Nama komposisi',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
