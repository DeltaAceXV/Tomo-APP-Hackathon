import 'package:flutter/material.dart';
import 'package:tracklocation/Components/BuddyCard.dart';

class BuddyRequest extends StatelessWidget {
  const BuddyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Buddy Requests"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
        BuddyCard(type: "request", name: "Jane", gender: "F", educationLevel: "HS", exam: "IGCSE", description: "Hi I'm looking for a buddy who is also preparing for IGCSE!"),
        BuddyCard(type: "request", name: "Kheng Pin", gender: "M", educationLevel: "HS", exam: "SPM", major: "Sciences", description: "Hi I'm looking for a buddy who is also preparing for SPM. Let's motivate each other and work towards our goals!"),
        BuddyCard(type: "request", name: "Bean", gender: "F", educationLevel: "HS", exam: "SPM", description: "Hi I'm looking for a buddy who is also preparing for SPM!"),
      ],)
    );
  }
}