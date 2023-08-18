import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/store/domain/store-form/store_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/storage/storage_repository.dart';
import '../../../../../core/domain/failure.dart';
import '../../../data/store_repository.dart';

part 'create_store_event.dart';
part 'create_store_state.dart';
part 'create_store_bloc.freezed.dart';

class CreateStoreBloc extends Bloc<CreateStoreEvent, CreateStoreState> {
  final StoreRepository storeRepository;
  final StorageRepository storageRepository;
  final AuthRepository authRepository;

  CreateStoreBloc({
    required this.authRepository,
    required this.storeRepository,
    required this.storageRepository,
  }) : super(const _Initial()) {
    on<CreateStoreEvent>((event, emit) async {
      await event.when(
        started: () async {},
        submitStore: (user) async {
          emit(const CreateStoreState.onRequest());
          try {
            await storeRepository.openStore(
              token: await storageRepository.read(key: 'access'),
            );
            await storeRepository.createStore(
              token: await storageRepository.read(key: 'access'),
              form: user.copyWith(
                name: user.name,
                desc: user.desc,
                address: user.address,
                phone: user.phone,
                openTime: user.openTime,
                closeTime: user.closeTime,
                imagePath: user.imagePath,
              ),
            );
            emit(const CreateStoreState.storeCreated());
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
                add(CreateStoreEvent.submitStore(form: user));
              } on Failure catch (_) {
                emit(CreateStoreState.createStoreFailed(error: e.toString()));
              }
            } else {
              emit(CreateStoreState.createStoreFailed(error: e.toString()));
            }
          }
        },
      );
    });
  }
}
