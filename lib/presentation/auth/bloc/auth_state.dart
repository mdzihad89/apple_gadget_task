part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
}

class LoginFailure extends AuthState {
  final String error;

  LoginFailure({required this.error});
}