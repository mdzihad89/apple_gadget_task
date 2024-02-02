part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class LoginButtonPressed extends AuthEvent {
 LoginRequestDto loginRequestDto;
  LoginButtonPressed({required this.loginRequestDto});
}

class LogoutButtonPressed extends AuthEvent {
  LogoutButtonPressed();
}