import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (state is ProfileSuccess) {
            return Center(
              child: Text(state.accountInfo.name ?? ""),
            );

          }else if(state is ProfileFailure){
            return Center(
              child: Text(state.message ),
            );

          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
