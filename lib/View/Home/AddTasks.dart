import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracklocation/DTO/TaskDTO.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  
  
  final List _tasks = [];

  String task = "";

  Future<void> addTasks() async {
    final db = FirebaseFirestore.instance;

    for(String task in _tasks) {
      final newTaskRef = db.collection('tasks').doc();

      var newTask = TaskDTO(id: newTaskRef.id, title: task, user: FirebaseAuth.instance.currentUser!.uid);

      await newTaskRef.set(
        newTask.toJson()
      );

      print('Task added to Firestore: $task');
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Add Tasks"),
        backgroundColor: Colors.grey.shade50,
        actions: [IconButton(onPressed: addTasks, icon: Icon(Icons.check))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < _tasks.length; i++) ...[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: TextEditingController(text: _tasks[i]),
                  decoration: InputDecoration(
                      labelText: "Task ${i + 1}",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
              ),
            ],
            for (var i = 0; i < 5 - _tasks.length; i++) ...[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                    onPressed: () async {
                      final text = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AddTaskDialog());

                      if (text != null) {
                        setState(() {
                          task = text;
                          _tasks.add(text);
                        });
                      }
                    },
                    child: Text("Add a Task"),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(100, 60),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade400))),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => AddTaskDialogState();
}

class AddTaskDialogState extends State<AddTaskDialog> {
  final addTaskController = TextEditingController();

  // String task = "";

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    addTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: TextField(
        autofocus: true,
        maxLines: 2,
        controller: addTaskController,
        decoration: InputDecoration(
            hintText: "Enter Task Title",
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, addTaskController.text),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
