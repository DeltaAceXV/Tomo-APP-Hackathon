import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracklocation/View/AuthPage.dart';
import 'package:tracklocation/View/Buddy/BuddySettings.dart';
import 'package:tracklocation/View/Buddy/InviteBuddy.dart';
import 'package:tracklocation/View/Home/AddTasks.dart';
import 'package:tracklocation/View/Home/CheckInTasks.dart';
import 'package:tracklocation/View/Home/HomePage.dart';
import 'package:tracklocation/View/Notifications/BuddyRequest.dart';
import 'package:tracklocation/View/Notifications/Notifications.dart';
import 'package:tracklocation/View/Space/BuddySpace.dart';
import 'package:tracklocation/firebase_options.dart';
import 'package:tracklocation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MainApp()));
  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: (!kIsWeb && Platform.isAndroid)
            ? Brightness.dark
            : Brightness.light));

    return MaterialApp(
      title: 'Tomo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Inter',
          platform: TargetPlatform.android,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
          )),
      home: const AuthPage(),
      routes: {
        '/buddyspace': (context) => const BuddySpace(),
        '/addtasks': (context) => const AddTasks(),
        '/invitebuddy': (content) => const InviteBuddy(),
        '/buddysettings': (context) => const BuddySettings(),
        '/notifications': (context) => const Notifications(),
        '/buddyrequest': (context) => const BuddyRequest(),
        '/checkintasks': (context) => const CheckInTasks(),
        '/homepage': (context) => HomePage()
      },
    );
  }
}
