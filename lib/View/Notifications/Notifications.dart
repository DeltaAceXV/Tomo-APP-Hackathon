import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: Text("Notifications"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Requests",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            Card(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(children: [
                Icon(Icons.people_alt_rounded),
                SizedBox(width: 15),
                Expanded(
                    child: Text("5 Buddy Requests",
                        style: TextStyle(fontSize: 16))),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/buddyrequest');
                    },
                    child: const Text("View")),
              ]),
            )),
            // BuddyCard(
            //     name: "Denise",
            //     gender: "F",
            //     educationLevel: "HS",
            //     description: "Lorem Ipsum..."),

            SizedBox(height: 20),

            Text("Activities",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),

            Card(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Joseph checked in one of his tasks"),
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                "Joseph accepted your buddy request. You may start to get to know each other.")),
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                "Joseph accepted your buddy request. You may start to get to know each other.")),
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                "Joseph accepted your buddy request. You may start to get to know each other.")),
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                "Joseph accepted your buddy request. You may start to get to know each other.")),
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'JT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                "Joseph accepted your buddy request. You may start to get to know each other.")),
                      ],
                    ),
                  ]),
            ))
          ],
        ),
      ),
    );
  }
}
