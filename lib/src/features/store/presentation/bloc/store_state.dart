part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = _Loading;
  const factory StoreState.loaded(Pagination<Store> stores) = _Loaded;
  const factory StoreState.error(String e) = _Error;
  
}
