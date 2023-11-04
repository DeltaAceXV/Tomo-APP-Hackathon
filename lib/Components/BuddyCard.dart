import 'package:flutter/material.dart';

class BuddyCard extends StatelessWidget {
  // missing profile link
  final String type;
  final String name;
  final String gender;
  final String educationLevel;
  final String exam;
  final String major;
  final String description;

  const BuddyCard(
      {super.key,
      this.type = "match",
      required this.name,
      required this.gender,
      required this.educationLevel,
      this.exam = "",
      this.major = "",
      required this.description});

  @override
  Widget build(BuildContext context) {
    final String educationLevelString;

    switch (educationLevel) {
      case 'HS':
        educationLevelString = "High School";
        break;
      case 'PU':
        educationLevelString = "Pre-U";
        break;
      case 'UG':
        educationLevelString = "University / College";
        break;
      default:
        educationLevelString = "N/A";
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    // backgroundImage: AssetImage('lib/images/dog_profile.jpg'),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  SizedBox(width: 10),
                  Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 16),
                  Chip(
                    // avatar: Icon(Icons.school_rounded),
                    labelStyle: TextStyle(fontSize: 13),
                    label: gender == 'M' ? Text('Male') : Text('Female'),
                    backgroundColor: gender == 'M'
                        ? Colors.blue.shade50
                        : Colors.pink.shade50,
                  )
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Chip(
                    labelStyle: TextStyle(fontSize: 13),
                    label: Text(educationLevelString),
                    backgroundColor: Colors.lightBlue.shade100,
                  ),
                  if (exam != "") ...[
                    SizedBox(width: 8),
                    Chip(
                      labelStyle: TextStyle(fontSize: 13),
                      backgroundColor: Colors.lightGreen.shade100,
                      label: Text(exam),
                    ),
                  ],
                  if (major != "") ...[
                    SizedBox(width: 8),
                    Chip(
                      labelStyle: TextStyle(fontSize: 13),
                      backgroundColor: Colors.grey.shade200,
                      label: Text(major),
                    ),
                  ],
                ]),
              ),
              Divider(thickness: 1),
              SizedBox(height: 5),
              Text(description),
              if (type == "match") ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      onPressed: () {},
                      child: Text("Invite As Buddy")),
                ),
              ],

              if (type == "request") ...[
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: FilledButton(
                            style: FilledButton.styleFrom(
                                shape: StadiumBorder()),
                            onPressed: () {},
                            child: Text("Accept"))),
                    
                    SizedBox(width: 10),
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              // backgroundColor: Colors.white,
                              // foregroundColor: Colors.blue,
                              side: BorderSide(color: Colors.blue),
                              elevation: 0,
                                shape: StadiumBorder()),
                            onPressed: () {},
                            child: Text("Delete"))),
                  ],
                ),
              ]
            ],
          )),
    );
  }
}
