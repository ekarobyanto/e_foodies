part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.request() = _Request;
  const factory DashboardState.success(Dashboard dashboard, String greeting) =
      _Success;
  const factory DashboardState.error(String e) = _Error;
}
