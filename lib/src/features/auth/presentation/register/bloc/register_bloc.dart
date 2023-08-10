import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({required this.authRepository}) : super(const _Initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.whenOrNull(
        started: () {},
        register: (name, email, password, address) async {
          emit(const RegisterState.onRequest());
          try {
            await authRepository.register(
              name: name,
              email: email, 
              password: password,
              address: address,
            );
            emit(const RegisterState.success());
          } catch (e) {
            emit(RegisterState.error(e.toString()));
          }
        },
      );
    });
  }
}
