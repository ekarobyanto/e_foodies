import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/core/domain/pagination.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/menu/data/menu_repository.dart';
import 'package:e_foodies/src/service/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/storage/storage_repository.dart';
import '../../../../core/domain/failure.dart';
import '../../domain/menu/menu.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuRepository menuRepository;
  StorageRepository storageRepository;
  AuthRepository authRepository;
  MenuBloc({
    required this.authRepository,
    required this.storageRepository,
    required this.menuRepository,
  }) : super(const _Initial()) {
    on<MenuEvent>((event, emit) async {
      await event.when(
        started: (pageKey, pageSize) async {
          emit(const _Initial());
          try {
            final menus = await menuRepository.allMenu(
              await storageRepository.read(key: 'access'),
              pageKey,
              pageSize,
            );
            emit(MenuState.success(menus));
          } on Failure catch (e) {
            if (e.message == 'Token Expired') {
              try {
                final token = await authRepository.refreshToken(
                  await storageRepository.read(key: 'refresh'),
                );
                log(token.toString());
                await Future.any(
                  [
                    storageRepository.write(
                      key: 'access',
                      value: token['access'],
                    ),
                    storageRepository.write(
                      key: 'refresh',
                      value: token['refresh'],
                    ),
                  ],
                );
                add(_Started(pageKey, pageSize));
              } on Failure catch (_) {
                emit(const _Error('Refresh Failed'));
              }
            } else {
              emit(_Error(e.message));
            }
          }
        },
        nextpage: (pageKey, pageSize) async {
          try {
            final menus = await menuRepository.allMenu(
              await storageRepository.read(key: 'access'),
              pageKey,
              pageSize,
            );
            emit(MenuState.pageUpdated(menus));
          } on Failure catch (e) {
            if (e.message == 'Token Expired') {
              try {
                final token = await authRepository.refreshToken(
                  await storageRepository.read(key: 'refresh'),
                );
                log(token.toString());
                await Future.any(
                  [
                    storageRepository.write(
                      key: 'access',
                      value: token['access'],
                    ),
                    storageRepository.write(
                      key: 'refresh',
                      value: token['refresh'],
                    ),
                  ],
                );
                add(_NextPage(pageKey, pageSize));
              } on Failure catch (_) {
                emit(const _Error('Refresh Failed'));
              }
            } else {
              emit(_Error(e.message));
            }
          }
        },
      );
    });
  }
}
