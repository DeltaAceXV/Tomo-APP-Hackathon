// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:tracklocation/Repositories/LoginRepository.dart';
import 'package:tracklocation/View/Buddy/InviteBuddy.dart';
import 'package:tracklocation/View/Home/HomePage.dart';
import 'package:tracklocation/View/Profile/ProfilePage.dart';
import 'package:tracklocation/View/Profile/UserProfile.dart';
import 'package:tracklocation/View/Space/BuddyList.dart';
import 'package:tracklocation/View/Space/BuddySpace.dart';
import 'package:tracklocation/View/Stats/StatsPage.dart';

import 'DTO/LoginDTO.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    // List pages = [
    //   HomePage(),
    //   BuddyList(),
    //   BuddySpace(),
    //   InviteBuddy()
    // ];

    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = const BuddyList();
        break;
      case 2:
        page = const StatsPage();
        break;
      case 3:
        page = const ProfilePage();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            // elevation: 1,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: "Home",
                  activeIcon: const Icon(Icons.home_filled)),
              // BottomNavigationBarItem(
              //     icon: const Icon(Icons.favorite),
              //     label: "Favourites",
              //     activeIcon: const Icon(
              //       Icons.favorite,
              //       fill: 1,
              //     )),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.chat_rounded),
                  label: "Space",
                  activeIcon: const Icon(
                    Icons.chat_rounded,
                    fill: 1,
                  )),

              BottomNavigationBarItem(
                  icon: const Icon(Icons.bar_chart_rounded),
                  label: "Stats",
                  activeIcon: const Icon(
                    Icons.bar_chart_rounded,
                    fill: 1,
                  )),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person_rounded),
                  label: "Profile",
                  activeIcon: const Icon(
                    Icons.person_rounded,
                    fill: 1,
                  )),
            ]),
        body: page,

        // Row(
        //   children: [Expanded(child: Container(child: page, color: Colors.green))],
        // )

        // body: Row(
        //   children: [
        //     SafeArea(
        //       child: NavigationRail(
        //         extended: constraints.maxWidth >= 600,
        //         destinations: const [
        //          NavigationRailDestination(
        //             icon: const Icon(Icons.home),
        //             label: const Text('Home', style: TextStyle(inherit: true, color: Colors.black),),
        //             selectedIcon: const Icon(Icons.home_filled)
        //           ),
        //          NavigationRailDestination(
        //             icon: const Icon(Icons.favorite),
        //             label: const Text('Favorites'),
        //             selectedIcon: const Icon(Icons.favorite_rounded)
        //           ),
        //         ],
        //         selectedIndex: selectedIndex,
        //         onDestinationSelected: (value) {
        //           setState(() {
        //             selectedIndex = value;
        //           });
        //         },

        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         color: Theme.of(context).colorScheme.primaryContainer,
        //         child: page,
        //       ),
        //     ),
        //   ],
        // ),
      );
    });
  }
}
