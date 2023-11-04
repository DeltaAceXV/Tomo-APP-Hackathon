import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Stats"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 1000000)),
                    onDateChanged: (DateTime value) {})),
            Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Study Bio Chapter 4",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("10:00 AM - 12:00 PM",
                                    style: TextStyle(fontSize: 13)),
                              ]),
                        ),
                        TextButton(onPressed: () {}, child: Text("See Details"))
                      ],
                    ))),
            Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Study Bio Chapter 4",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("10:00 AM - 12:00 PM",
                                    style: TextStyle(fontSize: 13)),
                              ]),
                        ),
                        TextButton(onPressed: () {}, child: Text("See Details"))
                      ],
                    ))),
            Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Study Bio Chapter 4",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("10:00 AM - 12:00 PM",
                                    style: TextStyle(fontSize: 13)),
                              ]),
                        ),
                        TextButton(onPressed: () {}, child: Text("See Details"))
                      ],
                    ))),
            Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Study Bio Chapter 4",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("10:00 AM - 12:00 PM",
                                    style: TextStyle(fontSize: 13)),
                              ]),
                        ),
                        TextButton(onPressed: () {}, child: Text("See Details"))
                      ],
                    ))),
            Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Study Bio Chapter 6",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("10:00 AM - 12:00 PM",
                                    style: TextStyle(fontSize: 13)),
                              ]),
                        ),
                        TextButton(onPressed: () {}, child: Text("See Details"))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
