import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/core/domain/failure.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/menu/data/menu_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../menu/domain/menu-form/menu_form.dart';
import '../../../data/store_repository.dart';
import '../../../domain/store.dart';

part 'user_store_event.dart';
part 'user_store_state.dart';
part 'user_store_bloc.freezed.dart';

class UserStoreBloc extends Bloc<UserStoreEvent, UserStoreState> {
  AuthRepository authRepository;
  StorageRepository storageRepository;
  StoreRepository storeRepository;
  MenuRepository menuRepository;
  UserStoreBloc({
    required this.authRepository,
    required this.storageRepository,
    required this.storeRepository,
    required this.menuRepository,
  }) : super(const _Initial()) {
    on<UserStoreEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(const _Loading());
          try {
            final storeData = await storeRepository.getUserStore(
              token: await storageRepository.read(key: 'access'),
            );
            emit(_Loaded(storeData));
          } on Failure catch (e) {
            tokenHandler(
              e: e,
              onSuccess: () {
                add(const UserStoreEvent.started());
              },
              onError: (e) {
                emit(_Error(e));
              },
            );
          }
        },
        updateMenu: (value) async {
          emit(const _Loading());
          try {
            await menuRepository.editMenuForm(
              await storageRepository.read(key: 'access'),
              value.form,
              value.id,
            );
            if (value.form.image != '') {
              add(UserStoreEvent.updateMenuImage(value.id, value.form.image));
            } else {
              add(const UserStoreEvent.started());
            }
          } on Failure catch (e) {
            tokenHandler(
              e: e,
              onSuccess: () {
                add(UserStoreEvent.updateMenu(value.form, value.id));
              },
              onError: (e) {
                emit(_Error(e));
              },
            );
          }
        },
        updateMenuImage: (value) async {
          emit(const _Loading());
          try {
            if (value.image != '') {
              await menuRepository.updateMenuImage(
                value.id,
                value.image,
                await storageRepository.read(key: 'access'),
              );
            }
            add(const UserStoreEvent.started());
          } on Failure catch (e) {
            tokenHandler(
              e: e,
              onSuccess: () {
                add(UserStoreEvent.updateMenuImage(value.id, value.image));
              },
              onError: (e) {
                emit(_Error(e));
              },
            );
          }
        },
        deleteMenu: (value) async {
          emit(const _Loading());
          try {
            await menuRepository.deleteMenu(
              await storageRepository.read(key: 'access'),
              value.id,
            );
            final storeData = await storeRepository.getUserStore(
              token: await storageRepository.read(key: 'access'),
            );
            emit(_Loaded(storeData, 'Menu Berhasil Dihapus'));
          } on Failure catch (e) {
            tokenHandler(
              e: e,
              onSuccess: () {
                add(UserStoreEvent.deleteMenu(value.id));
              },
              onError: (e) {
                emit(_Error(e));
              },
            );
          }
        },
      );
    });
  }

  tokenHandler({
    required Failure e,
    required Function(String e) onError,
    onSuccess,
  }) async {
    if (e.message == 'Token Expired') {
      try {
        final tokens = await authRepository.refreshToken(
          await storageRepository.read(key: 'refresh'),
        );
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
        onSuccess();
      } on Failure catch (_) {
        onError('Session Expired');
      }
    } else {
      onError(e.message);
    }
  }
}
