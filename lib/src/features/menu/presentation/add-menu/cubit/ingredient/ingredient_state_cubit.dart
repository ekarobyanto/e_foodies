import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/ingredient/ingredient.dart';

part 'ingredient_state_state.dart';
part 'ingredient_state_cubit.freezed.dart';

class IngredientStateCubit extends Cubit<IngredientStateState> {
  List<Ingredient> ingredients = [];
  IngredientStateCubit() : super(const IngredientStateState.initial());

  initializeIngredients(List<Ingredient> ingredients) {
    this.ingredients = ingredients;
    emit(IngredientStateState.updated(ingredients.cast<Ingredient>()));
  }

  addIngredient(String ingredient) {
    ingredients = [
      ...ingredients,
      Ingredient(id: (ingredients.length + 1).toString(), name: ingredient)
    ];
    emit(IngredientStateState.updated(ingredients));
  }

  void editIngredient(String ingredient, int index) {
    ingredients = [
      ...ingredients.getRange(0, index),
      Ingredient(id: index.toString(), name: ingredient),
      ...ingredients.getRange(index + 1, ingredients.length)
    ];
    emit(IngredientStateState.updated(ingredients));
  }

  void removeIngredient(int index) {
    ingredients = [
      ...ingredients.getRange(0, index),
      ...ingredients.getRange(index + 1, ingredients.length)
    ];
    emit(IngredientStateState.updated(ingredients));
  }

  @override
  void onChange(Change<IngredientStateState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
