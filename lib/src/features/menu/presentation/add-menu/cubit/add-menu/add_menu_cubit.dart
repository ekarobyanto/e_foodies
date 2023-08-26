import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/menu/data/menu_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/data/storage/storage_repository.dart';
import '../../../../../../core/domain/failure.dart';
import '../../../../domain/menu-form/menu_form.dart';

part 'add_menu_state.dart';
part 'add_menu_cubit.freezed.dart';

class AddMenuCubit extends Cubit<AddMenuState> {
  AuthRepository authRepository;
  StorageRepository storageRepository;
  MenuRepository menuRepository;
  AddMenuCubit({
    required this.authRepository,
    required this.storageRepository,
    required this.menuRepository,
  }) : super(const AddMenuState.initial());

  Future submitMenu(MenuForm form) async {
    emit(const AddMenuState.loading());
    try {
      Map<String, dynamic> data = await menuRepository.createMenu(
          await storageRepository.read(key: 'access'), form);
      updateMenuImage(form, data['id']);
    } on Failure catch (e) {
      await tokenHandler(
        e: e,
        onSuccess: () {
          submitMenu(form);
        },
        onError: (e) {
          emit(_Error(e));
        },
      );
    }
  }

  updateMenuImage(MenuForm form, String menuId) async {
    try {
      await menuRepository.updateMenuImage(
          menuId, form.image, await storageRepository.read(key: 'access'));
      emit(const _Success());
    } on Failure catch (e) {
      await tokenHandler(
        e: e,
        onSuccess: () {
          updateMenuImage(form, menuId);
        },
        onError: (e) {
          emit(_Error(e));
        },
      );
    }
  }

  tokenHandler({
    required Failure e,
    required Function(String e) onError,
    onSuccess,
  }) async {
    log(e.message);
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
        ).then((_) => onSuccess());
      } on Failure catch (_) {
        onError('Session Expired');
      }
    } else {
      onError(e.message);
    }
  }

  @override
  void onChange(Change<AddMenuState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
