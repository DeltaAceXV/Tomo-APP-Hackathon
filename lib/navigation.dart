// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:tracklocation/Repositories/LoginRepository.dart';
import 'package:tracklocation/View/Home/HomePage.dart';
import 'package:tracklocation/View/Profile/UserProfile.dart';

import 'DTO/LoginDTO.dart';

class NavigationHomeScreen extends StatefulWidget{
  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  var selectedIndex = 0;

  @override
   Widget build(BuildContext context) {

    Widget page;
    switch(selectedIndex){
      case 0:
        page = HomePage();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: const MouseRegion(
                        child: Icon(Icons.add_rounded),
                        cursor: SystemMouseCursors.click,
                      ),
                    ),

                    SizedBox(width: 100,),

                    GestureDetector(
                      onTap: () async {
                        UserDTO? currentUser = (await LoginRepository().getLoginUser()).first;

                        if(currentUser.AuthenticationID == "-"
                        || currentUser.AuthenticationID == ""){
                          currentUser = UserDTO();

                          await LoginRepository().addUserDetails(currentUser);
                        }
                        
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) {
                              return UserProfile();
                            },
                          )
                        );
                      },
                      child: const MouseRegion(
                        child: Icon(Icons.person),
                        cursor: SystemMouseCursors.click,
                      ),
                    ),
                    
                  ],
                )
              ],
            )
          ),

          bottomNavigationBar: BottomNavigationBar(
            
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,

            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },

            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: "Home",
                activeIcon: const Icon(Icons.home_filled)
            ),BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: "Favourites",
                activeIcon: const Icon(Icons.favorite, fill: 1,)
            ),
            
          ]),


          body: Row(
            children: [
              Expanded(child: Container(
                child: page
              ))
            ],
          )
          
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
      }
    );
  }
}







