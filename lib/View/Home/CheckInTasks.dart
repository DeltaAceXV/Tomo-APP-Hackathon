import 'package:flutter/material.dart';

class CheckInTasks extends StatefulWidget {
  const CheckInTasks({super.key});

  @override
  State<CheckInTasks> createState() => _CheckInTasksState();
}

class _CheckInTasksState extends State<CheckInTasks> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  void _showStartTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => setState(() {
              startTime = value!;
              startTimeController.text = startTime.format(context).toString();
            }));
  }

  void _showEndTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => setState(() {
              endTime = value!;
              endTimeController.text = endTime.format(context).toString();
            }));
  }

  bool done = false;

  @override
  Widget build(BuildContext context) {
    startTimeController.text = startTime.format(context).toString();
    endTimeController.text = endTime.format(context).toString();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Check In Task"),
        backgroundColor: Colors.grey.shade50,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              TextField(
                  // onTap: _showStartTimePicker,
                  readOnly: false,
                  controller: TextEditingController(
                      text:
                          "Study Bio Chapter 4"),
                  decoration: InputDecoration(
                      labelText: 'Task Name',
                      // labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)))),
              SizedBox(height: 25),
              Row(
                children: [
                  Flexible(
                      child: TextField(
                          onTap: _showStartTimePicker,
                          readOnly: true,
                          controller: startTimeController,
                          decoration: InputDecoration(
                              labelText: 'Start Time',
                              // labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue))))),
                  SizedBox(width: 15),
                  Flexible(
                      child: TextField(
                          onTap: _showEndTimePicker,
                          readOnly: true,
                          controller: endTimeController,
                          decoration: InputDecoration(
                              labelText: 'End Time',
                              // labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue))))),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                  maxLines: 5,
                  readOnly: false,
                  controller: TextEditingController(
                      text:
                          "Learned new Bio concepts"),
                  decoration: InputDecoration(
                      labelText: 'Description',
                      // labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)))),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text("Upload Image")),
            ],
          )),
    );
  }
}
