import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/failure.dart';
import '../../../../core/domain/pagination.dart';
import '../../data/store_repository.dart';
import '../../domain/store.dart';

part 'store_event.dart';
part 'store_state.dart';
part 'store_bloc.freezed.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StorageRepository storageRepository;
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  StoreBloc({
    required this.storageRepository,
    required this.authRepository,
    required this.storeRepository,
  }) : super(const _Initial()) {
    on<StoreEvent>(
      (event, emit) async {
        await event.map(
          started: (e) async {
            emit(const _Initial());
            try {
              final stores = await storeRepository.getAllStore(
                  await storageRepository.read(key: 'access'), 1, 1);
              emit(_Loaded(stores));
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
                  add(const _Started(1, 1));
                } on Failure catch (_) {
                  emit(const _Error('Refresh Failed'));
                }
              } else {
                emit(_Error(e.message));
              }
            }
          },
        );
      },
    );
  }
}
