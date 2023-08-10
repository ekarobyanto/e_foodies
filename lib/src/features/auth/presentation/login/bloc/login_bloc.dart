import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final StorageRepository storageRepository;
  LoginBloc(
    this.authRepository,
    this.storageRepository,
  ) : super(const _Initial()) {
    on<LoginEvent>((event, emit) {
      event.when(
        started: () {},
        login: (email, password) async {
          try {
            final data = await authRepository.login(
              email: email,
              password: password,
            );
            await Future.any(
              [
                storageRepository.write(
                  key: 'access',
                  value: data['access'],
                ),
                storageRepository.write(
                  key: 'refresh',
                  value: data['refresh'],
                ),
              ],
            );
            emit(const LoginState.success());
          } catch (e) {
            emit(LoginState.error(e.toString()));
          }
        },
      );
    });
  }
}
