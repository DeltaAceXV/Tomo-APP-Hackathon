import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracklocation/navigation.dart';
import 'package:tracklocation/View/Login/LoginPage.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return NavigationHomeScreen();
          }
          else{
            return LoginPage();
          }
        },
      )
    );
  }

}

