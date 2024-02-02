import 'package:apple_gadget_task/presentation/auth/view/login_page.dart';
import 'package:apple_gadget_task/presentation/profile/view/profile_page.dart';
import 'package:apple_gadget_task/presentation/trade/view/trade_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List <Widget> pages = [
    const TradePage(),
    const ProfilePage(),


  ];

  void updatePage(int page) {
    setState(() {
      _currentIndex = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LogoutButtonPressed());
              }
          )
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthInitial){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false );
          }
          if(state is AuthFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );}
        },
        builder: (context, state) {

          if(state is AuthLoading){
            return const Center(child: CircularProgressIndicator());
          }
           return IndexedStack(
            index: _currentIndex,
            children: pages,
           );


        },
      ),

      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        elevation: 5,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_filled, color: Colors.white,),
            label: 'Trade',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Colors.white,),
            label: 'Profile',
          ),

        ],

      ),

    );
  }
}
