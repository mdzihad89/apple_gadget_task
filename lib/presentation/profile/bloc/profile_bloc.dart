
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/account_info.dart';
import '../../../domain/repository/repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository repository;

  ProfileBloc({ required this.repository}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
        final accountInfoResult = await repository.getAccountInformation();
        final lastPhoneNumberResult = await repository.getLastFourNumbersPhone();
        accountInfoResult.fold(
              (failure) {
            emit(ProfileFailure(failure.message));
          },
              (accountInfo) async {


            lastPhoneNumberResult.fold(
                  (failure) {
                emit(ProfileFailure(failure.message));
              },
                  (lastPhoneNumber) {
                emit(ProfileSuccess(
                   accountInfo:  accountInfo,
                  lastFourNumbersPhone: lastPhoneNumber,
                ));
              },
            );
          },
        );

    });

  }
}
