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
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileEvent());
    super.initState();
  }

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
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.2, horizontal: MediaQuery.sizeOf(context).width*0.1  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.accountInfo.name ?? "", style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  Text("\$ ${state.accountInfo.balance.toString()}", style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  Text(state.accountInfo.address??"", style: const TextStyle(fontSize: 16),),
                  Text(state.accountInfo.city??"", style: const TextStyle(fontSize: 16),),
                  Text(state.accountInfo.country??"", style: const TextStyle(fontSize: 16),),
                  const SizedBox(height: 20,),
                  Card(
                    child: ListTile(

                      title:  Center(child: Text(state.lastFourNumbersPhone, style: const TextStyle(fontSize: 20,),)),

                  ),
                  ),

                ],
              ),
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
