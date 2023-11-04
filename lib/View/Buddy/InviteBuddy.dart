import 'package:flutter/material.dart';
import 'package:tracklocation/Components/BuddyCard.dart';

class InviteBuddy extends StatelessWidget {
  const InviteBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Suggested Buddies"),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            BuddyCard(name: "Denise", gender: "F", educationLevel: "UG", major: "Computer Science", description: "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
            BuddyCard(name: "Joseph", gender: "M", educationLevel: "UG", major: "Software Development", description: "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
            BuddyCard(name: "Mei 🌸", gender: "F", educationLevel: "HS", exam: "SPM", major: "Science", description: "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
            BuddyCard(name: "Jane", gender: "F", educationLevel: "PU", exam: "A-Levels", description: "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
          ]),
    );
  }
}
