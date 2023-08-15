import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/account/data/account_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/storage/storage_repository.dart';
import '../../../../core/domain/failure.dart';
import '../../../auth/data/auth_repository.dart';
import '../../domain/account.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;
  final AuthRepository authRepository;
  final StorageRepository storageRepository;
  AccountBloc({
    required this.accountRepository,
    required this.authRepository,
    required this.storageRepository,
  }) : super(const _Initial()) {
    on<AccountEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(const AccountState.initial());
          try {
            final account = await accountRepository.getAccount(
                token: await storageRepository.read(key: 'access'));
            emit(AccountState.succes(account));
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
                add(const _Started());
              } on Failure catch (_) {
                emit(const AccountState.error('Refresh Failed'));
              }
            }
            emit(AccountState.error(e.message));
          }
        },
        updateAccount: (value) async {
          try {
            await accountRepository.updateAccount(
              token: await storageRepository.read(key: 'access'),
              data: value.account,
              password: value.password,
            );
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
                add(const _Started());
              } on Failure catch (_) {
                emit(const AccountState.error('Refresh Failed'));
              }
            }
            emit(AccountState.error(e.message));
          }
        },
      );
    });
  }
}
