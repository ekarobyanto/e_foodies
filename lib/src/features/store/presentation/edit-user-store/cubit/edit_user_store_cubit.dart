import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/store/data/store_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/domain/failure.dart';
import '../../../domain/store-form/store_form.dart';

part 'edit_user_store_state.dart';
part 'edit_user_store_cubit.freezed.dart';

class EditUserStoreCubit extends Cubit<EditUserStoreState> {
  AuthRepository authRepository;
  StorageRepository storageRepository;
  StoreRepository storeRepository;
  EditUserStoreCubit({
    required this.authRepository,
    required this.storageRepository,
    required this.storeRepository,
  }) : super(const EditUserStoreState.initial());

  submitEdit({required StoreForm storeForm}) async {
    emit(const EditUserStoreState.loading());
    try {
      await storeRepository.editUserStore(
        form: storeForm,
        token: await storageRepository.read(key: 'access'),
      );
      emit(const EditUserStoreState.updateSucces());
    } on Failure catch (e) {
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
          submitEdit(storeForm: storeForm);
        } on Failure catch (_) {
          emit(const _Error('Refresh Failed'));
        }
      } else {
        emit(_Error(e.message));
      }
    }
  }
}
