import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracklocation/Components/BuddyStatus.dart';
import 'package:tracklocation/Components/CustomDropdownField.dart';
import 'package:tracklocation/Components/SectionHeader.dart';
import 'package:tracklocation/DTO/TaskDTO.dart';

class Task {
  final String title;
  final String id;
  final DateTime date;

  Task(this.title, this.id, this.date);
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final querySnapshot = await db
        .collection('tasks')
        .where('user', isEqualTo: user.uid)
        .where('date', isGreaterThanOrEqualTo: startOfDay)
        .where('date', isLessThan: endOfDay)
        .get();

    final tasks = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Task(data['title'], doc.id, data['date'].toDate());
    }).toList();

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 24)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              icon: const Icon(Icons.notifications_rounded)),
          IconButton(
              onPressed: signOut, icon: const Icon(Icons.logout_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SectionHeader(title: "Welcome Denise 👋"),
          SizedBox(height: 5),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.yellow.shade800,
                    child: const Text(
                      'DK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Denise",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(height: 3),
                        Text("Study Bio Chapter 4",
                            style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      onPressed: () async {
                        final text = await showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                UpdateActivityDialog());
                      },
                      child: const Text("Update")),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          SectionHeader(title: "Today's Task"),
          SizedBox(height: 5),
          FutureBuilder(
              future: getTasks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final tasks = snapshot.data;
                  if (tasks!.length == 0) {
                    return Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("What are your plans for today?",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(height: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder()),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/addtasks')
                                      .then((_) => setState(() {}));
                                },
                                child: const Text("Add Tasks")),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Column(
                          children: tasks!.map((task) {
                            int index = tasks.indexOf(task);

                            return Column(
                              children: [
                                if (index != 0) Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(task.title,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                    // Text(task.date.toDate().toString(),
                                    //       style: TextStyle(fontSize: 14)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/checkintasks');
                                        },
                                        child: const Text("Check In")),
                                  ],
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
                }
              }),
          SizedBox(height: 20),
          SectionHeader(title: "Buddy's Activity"),
          SizedBox(height: 5),
          BuddyStatus(name: "Joseph", description: "C# Project"),
          SizedBox(height: 20),
          SectionHeader(title: "Upcoming Events"),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Study together",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("2023/10/25 2:00pm - 4:00pm",
                      style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class InviteBuddyCard extends StatelessWidget {
  const InviteBuddyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Find yourself an accountability buddy!",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () {
                  Navigator.pushNamed(context, '/invitebuddy');
                },
                child: const Text("Invite Buddy")),
          ],
        ),
      ),
    );
  }
}

class UpdateActivityDialog extends StatelessWidget {
  final String taskValue = "Task1";

  final List<DropdownMenuItem<String>> taskItems = [
    DropdownMenuItem<String>(
        value: 'Task1', child: Text("Study Bio Chapter 4")),
    DropdownMenuItem<String>(
        value: 'Task2', child: Text("Memorize Periodic Table")),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Activity'),
      content: CustomDropdownField(
          labelText: "Tasks", value: taskValue, items: taskItems),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
