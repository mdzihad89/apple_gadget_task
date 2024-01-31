import 'package:apple_gadget_task/presentation/profile/view/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List <Widget> pages=[
    const Center(child: Text("Trade"),),
    const ProfilePage(),


  ];

  void updatePage(int page){
    setState(() {
      _currentIndex=page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:IndexedStack(
      //   index: _currentIndex,
      //   children: pages,
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        elevation: 5,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,

        destinations:  const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_filled,color: Colors.white,),
            label: 'Trade',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person,color: Colors.white,),
            label: 'Profile',
          ),

        ],

      ),

    );
  }
}
