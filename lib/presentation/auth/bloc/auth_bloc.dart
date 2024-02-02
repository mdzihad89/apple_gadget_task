import 'dart:async';

import 'package:apple_gadget_task/data/model/login_response_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/login_request_dto.dart';
import '../../../domain/repository/repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        emit(AuthLoading());
        final result = await repository.login(event.loginRequestDto);
        result.fold((l) => emit(AuthFailure(error: l.message)),
            (r) {
              if (r.result) {

                emit(AuthSuccess());

              } else {
                emit(AuthFailure(error: "Incorrect Credentials"));
              }
            }

        );
      }

        if (event is LogoutButtonPressed) {
          emit(AuthLoading());
          final result = await repository.logOut();
          result.fold((l) => emit(AuthFailure(error: l.message)),
              (r) {
                  emit(AuthInitial());
              }

          );
        }
    });
  }
}
