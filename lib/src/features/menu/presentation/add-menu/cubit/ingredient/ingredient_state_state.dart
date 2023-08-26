part of 'ingredient_state_cubit.dart';

@freezed
class IngredientStateState with _$IngredientStateState {
  const factory IngredientStateState.initial() = _Initial;
  const factory IngredientStateState.updated(List<String> ingredients) =
      _Updated;
}
