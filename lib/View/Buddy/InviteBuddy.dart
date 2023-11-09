import 'package:flutter/material.dart';
import 'package:tracklocation/Components/BuddyCard.dart';

class InviteBuddy extends StatelessWidget {
  const InviteBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Invite A Buddy"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/buddysettings');
                  },
                  icon: Icon(Icons.settings_rounded))),
        ],
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            BuddyCard(
                name: "Joseph",
                gender: "M",
                educationLevel: "HS",
                exam: "SPM",
                major: "Science",
                description:
                    "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
            BuddyCard(
                name: "Mei 🌸",
                gender: "F",
                educationLevel: "HS",
                exam: "SPM",
                major: "Science",
                description:
                    "Seeking a buddy to motivate each other and work towards getting good results in SPM! Excited to meet you!"),
            BuddyCard(
                name: "Ying",
                gender: "F",
                educationLevel: "UG",
                exam: "NA",
                major: "Computer Science",
                description:
                    "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
            BuddyCard(
                name: "Jane",
                gender: "F",
                educationLevel: "PU",
                exam: "A-Levels",
                description:
                    "Looking for an accountability buddy who can keep me motivated and focused on my schoolwork. Let's support each other in achieving our goals and be study partners for success!"),
          ]),
    );
  }
}
