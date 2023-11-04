import 'package:flutter/material.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Add Tasks"),
        backgroundColor: Colors.grey.shade50,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Text("You may add up to five tasks per day."),

          // SizedBox()

          // TextField(
          //   controller: TextEditingController(text: "Do 10 sets of Chemistry Past Year Papers"),
          //   decoration: InputDecoration(
          //     labelText: "Task 1",
          //     filled: true,
          //     fillColor: Colors.white,
          //     enabledBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.grey.shade400)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.blue))
          //   ),
          // ),

          SizedBox(height: 10),
          TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    ),

          OutlinedButton(onPressed: () {}, child: Text("Add a Task"), style: OutlinedButton.styleFrom(fixedSize: Size(100, 60), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade400))),
          
          SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: Text("Add a Task"), style: OutlinedButton.styleFrom(fixedSize: Size(100, 60), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade400))),
         
          SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: Text("Add a Task"), style: OutlinedButton.styleFrom(fixedSize: Size(100, 60), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade400))),
         
          SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: Text("Add a Task"), style: OutlinedButton.styleFrom(fixedSize: Size(100, 60), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade400))),
         
          SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: Text("Add a Task"), style: OutlinedButton.styleFrom(fixedSize: Size(100, 60), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade400))),

          // TextFieldExample(),
          // TextFieldExample(),
          // TextFieldExample(),
          // TextFieldExample(),
        ]),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            labelText: "Task 1"),
        controller: _controller,
      ),
    );
  }
}
