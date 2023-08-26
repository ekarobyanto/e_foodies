import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state_state.dart';
part 'ingredient_state_cubit.freezed.dart';

class IngredientStateCubit extends Cubit<IngredientStateState> {
  List<String> ingredients = [];
  IngredientStateCubit() : super(const IngredientStateState.initial());

  addIngredient(String ingredient) {
    ingredients = [...ingredients, ingredient];
    emit(IngredientStateState.updated(ingredients));
  }

  void editIngredient(String ingredient, int index) {
    ingredients = List<String>.from(ingredients)
      ..removeAt(index)
      ..insert(index, ingredient);
    emit(IngredientStateState.updated(ingredients));
  }

  void removeIngredient(int index) {
    ingredients = List<String>.from(ingredients)..removeAt(index);
    emit(IngredientStateState.updated(ingredients));
  }

  @override
  void onChange(Change<IngredientStateState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
