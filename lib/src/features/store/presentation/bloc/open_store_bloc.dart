import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/storage/storage_repository.dart';
import '../../../../core/domain/failure.dart';
import '../../../auth/data/auth_repository.dart';
import '../../data/store_repository.dart';
import '../../domain/store.dart';

part 'open_store_event.dart';
part 'open_store_state.dart';
part 'open_store_bloc.freezed.dart';

class OpenStoreBloc extends Bloc<OpenStoreEvent, OpenStoreState> {
  final StorageRepository storageRepository;
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  OpenStoreBloc({
    required this.storageRepository,
    required this.authRepository,
    required this.storeRepository,
  }) : super(const _Initial()) {
    on<OpenStoreEvent>((event, emit) async {
      await event.map(
        started: (value) async => {},
        viewStore: (value) async {
          emit(const _Initial());
          try {
            final store = await storeRepository.getStoreById(
                await storageRepository.read(key: 'access'), value.storeId);
            emit(_StoreLoaded(store));
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
                add(_ViewStore(value.storeId));
              } on Failure catch (_) {
                emit(const _StoreError('Refresh Failed'));
              }
            } else {
              emit(_StoreError(e.message));
            }
          }
        },
      );
    });
  }
}
