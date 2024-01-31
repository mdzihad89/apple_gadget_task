
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/account_info.dart';
import '../../../domain/repository/repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository repository;

  ProfileBloc({ required this.repository}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async{

      emit(ProfileLoading());
      final result =await repository.getAccountInformation();

      result.fold((l) => emit(ProfileFailure(l.message)), (r) => emit(ProfileSuccess(r)));

    });
  }
}
