import 'package:flutter/material.dart';
import 'package:tracklocation/Components/ChatBubble.dart';

class BuddySpace extends StatefulWidget {
  const BuddySpace({super.key});

  @override
  State<BuddySpace> createState() => BuddySpaceState();
}

class BuddySpaceState extends State<BuddySpace> {

  final chatFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        flexibleSpace: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.blue.shade800,
                child: const Text(
                  'JT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Joseph", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Text("Working on C#", style: TextStyle(fontSize: 13))
                ],
              )),
              // IconButton(onPressed: () {}, icon: Icon(Icons.menu))
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    ChatBubble(message: "Hey Denise!", alignment: "left"),
                    ChatBubble(
                        message: "What are you planning to do today?", alignment: "left"),
                    ChatBubble(
                        message:
                            "My Todos for Today: \n\n- Study Bio Chapter 4\n- Memorize Periodic Table",
                        alignment: "right"),
                    ChatBubble(
                        message: "Hey pal! I just updated them and these are my todos for today 😊",
                        alignment: "right"),
                    ChatBubble(
                        message: "Great! I'll be updating mine in a bit",
                        alignment: "left"),
                    ChatBubble(
                        message: "All the best to you and have a great day!",
                        alignment: "left"),
                    ChatBubble(
                        message: "Thanks! And the same goes to you :D",
                        alignment: "right"),
  
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatFieldController,
                    decoration: InputDecoration(
                        hintText: "Type here...",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

