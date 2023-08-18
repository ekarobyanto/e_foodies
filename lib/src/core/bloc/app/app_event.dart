part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.started() = _Started;
  const factory AppEvent.loadingRequested() = _Request;
  const factory AppEvent.loadingComplete() = _RequestCompleted;
}
