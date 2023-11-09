import 'package:flutter/material.dart';

class BuddyList extends StatelessWidget {
  const BuddyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text("Buddy List"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/buddyspace');
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade800,
                  child: const Text(
                    'JT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Row(
                  children: [
                    Text('Joseph',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Badge(
                      backgroundColor: Colors.green.shade400,
                      label: Text("Online"),
                    )
                  ],
                ),
                subtitle: Text("Working on C#"),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade800,
                  child: const Text(
                    'M',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Min', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Archived Chat"),
              ),
            ),
          ],
        ));
  }
}
