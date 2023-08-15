part of 'menu_bloc.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.started(int pageKey, int pageSize) = _Started;
  const factory MenuEvent.nextpage(int pageKey, int pageSize) = _NextPage;
}
