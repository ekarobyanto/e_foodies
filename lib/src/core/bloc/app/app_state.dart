part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.loading() = _Loading;
  const factory AppState.authenticated() = _Authenticated;
  const factory AppState.unauthenticated() = _Unauthenticated;
}
