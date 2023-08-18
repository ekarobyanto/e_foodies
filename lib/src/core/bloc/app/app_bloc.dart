import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/storage/storage_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  StorageRepository storageRepository;
  AppBloc({required this.storageRepository}) : super(const _Initial()) {
    on<AppEvent>((event, emit) async {
      await event.whenOrNull(
        started: () async {
          String? token = await storageRepository.read(key: 'access');
          if (token == null) {
            emit(const AppState.unauthenticated());
          } else {
            emit(const AppState.authenticated());
          }
        },
        loadingRequested: () {
          emit(const AppState.loading());
        },
        loadingComplete: () {
          emit(const AppState.initial());
        },
      );
    });
  }
}
