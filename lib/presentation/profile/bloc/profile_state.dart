part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final AccountInfo accountInfo;
  final String lastFourNumbersPhone;
  ProfileSuccess({required this.accountInfo, required this.lastFourNumbersPhone});
}

class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure(this.message);
}