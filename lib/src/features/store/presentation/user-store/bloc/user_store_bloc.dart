import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/core/domain/failure.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/store_repository.dart';
import '../../../domain/store.dart';

part 'user_store_event.dart';
part 'user_store_state.dart';
part 'user_store_bloc.freezed.dart';

class UserStoreBloc extends Bloc<UserStoreEvent, UserStoreState> {
  AuthRepository authRepository;
  StorageRepository storageRepository;
  StoreRepository storeRepository;
  UserStoreBloc({
    required this.authRepository,
    required this.storageRepository,
    required this.storeRepository,
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
                add(const UserStoreEvent.started());
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
