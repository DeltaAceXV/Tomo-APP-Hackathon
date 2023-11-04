import 'package:flutter/material.dart';
import 'package:tracklocation/Components/BuddyStatus.dart';

class HomePage extends StatelessWidget {
  void onChanged() {}

  @override
  Widget build(BuildContext context) {
    bool hasTasks = false;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Home", style: TextStyle(fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                icon: Icon(Icons.notifications_rounded)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        Text("Working on C#", style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/buddysettings');
                      },
                      child: const Text("Update")),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("Today's Task",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
          AddTasksCard(),
          SizedBox(height: 5),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Do 2 sets of Past Year Papers for Chemistry",
                          style: TextStyle(fontSize: 14)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkintasks');
                        },
                        child: const Text("Check In")),
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Memorize Periodic Table",
                          style: TextStyle(fontSize: 14)),
                    ),
                    TextButton(
                        onPressed: () {/* ... */},
                        child: const Text("Check In")),
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Study Physics Chapter 4",
                          style: TextStyle(fontSize: 14)),
                    ),
                    TextButton(
                        onPressed: () {/* ... */},
                        child: const Text("Check In")),
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Practice HTML CSS",
                          style: TextStyle(fontSize: 14)),
                    ),
                    TextButton(
                        onPressed: () {/* ... */},
                        child: const Text("Check In")),
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Study Bio Chapter 4",
                          style: TextStyle(fontSize: 14)),
                    ),
                    TextButton(
                        onPressed: () {/* ... */},
                        child: const Text("Check In")),
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(height: 20),
          Text("Buddy's Activity",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
          SizedBox(height: 5),
          BuddyStatus(name: "Joseph", description: "C# Project"),
          SizedBox(height: 20),
          Text("Upcoming Events",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
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

class AddTasksCard extends StatelessWidget {
  const AddTasksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("What are your plans for today?",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () {
                  Navigator.pushNamed(context, '/addtasks');
                },
                child: const Text("Add Tasks")),
          ],
        ),
      ),
    );
  }
}
