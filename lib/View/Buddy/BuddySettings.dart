import 'package:flutter/material.dart';

class BuddySettings extends StatelessWidget {
  const BuddySettings({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Buddy Settings"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("You may specify your preferences for your buddy. "),
                    Text("Age / Study Level", style: TextStyle(fontSize: 18)),
                    Wrap(
                      spacing: 5,
                      children: [
                        Chip(label: Text("Same Age")),
                        Chip(label: Text("Same Study Level"))
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Text("Gender", style: TextStyle(fontSize: 18)),
                    Wrap(
                      spacing: 5,
                      children: [
                        // ChoiceChip(label: Text("Female"), selected: isSelected, backgroundColor: Colors.blue, onSelected: (bool selected) {setState(() {
                        //   isSelected = selected;
                        // }),
                        Chip(label: Text("Female")),
                        Chip(label: Text("Male")),
                        Chip(label: Text("Both"))
                      ],
                    ),
                    Divider(thickness: 1, height: 30),
                    Text("Others", style: TextStyle(fontSize: 18)),
                    Wrap(
                      spacing: 5,
                      children: [
                        Chip(label: Text("Same stream / major")),
                        Chip(label: Text("Same major exam")),
                      ],
                    ),
                    ActionChoiceExample(),
                  ]),
            ),
          )),
    );
  }
}

class ActionChoiceExample extends StatefulWidget {
  const ActionChoiceExample({super.key});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 0;
  bool isSelected = false;

  // Map<String, String> gender = {'F': 'Female', 'M': 'Male', 'B': 'Both'};

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text('Female'),
      backgroundColor: Colors.grey,
      selected: isSelected,
      selectedColor: Colors.amber,
      onSelected: (bool selected) {
        setState(() {
          isSelected = selected;
        });
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return
  //           Wrap(
  //             spacing: 5.0,
  //             children: List<Widget>.generate(
  //               3,
  //               (int index) {
  //                 return ChoiceChip(
  //                   label: Text('Item $index'),
  //                   backgroundColor: Colors.green,
  //                   selected: _value == index,
  //                   onSelected: (bool selected) {
  //                     setState(() {
  //                       _value = selected ? index : null;
  //                     });
  //                   },
  //                 );
  //               },
  //             ).toList(),
  //           );
  // }
}
