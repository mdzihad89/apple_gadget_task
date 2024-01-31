part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final AccountInfo accountInfo;
  ProfileSuccess(this.accountInfo);
}

class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure(this.message);
}