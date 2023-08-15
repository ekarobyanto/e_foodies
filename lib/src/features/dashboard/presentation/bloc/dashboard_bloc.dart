import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/dashboard/data/dashboard_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/storage/storage_repository.dart';
import '../../../../core/domain/failure.dart';
import '../../../auth/data/auth_repository.dart';
import '../../domain/dashboard.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  AuthRepository authRepository;
  StorageRepository storageRepository;
  DashboardRepository dashboardRepository;
  DashboardBloc({
    required this.authRepository,
    required this.storageRepository,
    required this.dashboardRepository,
  }) : super(const _Initial()) {
    on<DashboardEvent>((event, emit) async {
      await event.when(
        refresh: () async {
          emit(const _Request());
          try {
            Dashboard data = await dashboardRepository.fetchDashboard(
              await storageRepository.read(key: 'access'),
            );
            String greeting = '';
            int currentHour = DateTime.now().hour;
            if (currentHour < 12) {
              greeting = 'Selamat Pagi';
            } else if (currentHour < 17) {
              greeting = 'Selamat Siang';
            } else if (currentHour < 19) {
              greeting = 'Selamat Sore';
            } else {
              greeting = 'Selamat Malam';
            }
            emit(_Success(data, greeting));
          } on Failure catch (e) {
            if (e.message == 'Token Expired') {
              try {
                final tokens = await authRepository.refreshToken(
                  await storageRepository.read(key: 'refresh'),
                );
                log(tokens.toString());
                await Future.any(
                  [
                    storageRepository.write(
                      key: 'access',
                      value: tokens['access'],
                    ),
                    storageRepository.write(
                      key: 'refresh',
                      value: tokens['refresh'],
                    ),
                  ],
                );
                add(const DashboardEvent.started());
              } on Failure catch (_) {
                emit(const _Error('Refresh Failed'));
              }
            } else {
              emit(_Error(e.message));
            }
          }
        },
        started: () async {
          emit(const _Request());
          try {
            Dashboard data = await dashboardRepository.fetchDashboard(
              await storageRepository.read(key: 'access'),
            );
            String greeting = '';
            int currentHour = DateTime.now().hour;
            if (currentHour < 12) {
              greeting = 'Selamat Pagi';
            } else if (currentHour < 17) {
              greeting = 'Selamat Siang';
            } else if (currentHour < 19) {
              greeting = 'Selamat Sore';
            } else {
              greeting = 'Selamat Malam';
            }
            emit(_Success(data, greeting));
          } on Failure catch (e) {
            emit(_Error(e.message));
          }
        },
      );
    });
  }
}
