import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String alignment;

  const ChatBubble({super.key, required this.message, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment == 'right' ? Alignment.topRight : Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(message),
            // color: Colors.blue.shade300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: alignment == 'right' ? Colors.blue.shade100 : Colors.grey.shade300)));
  }
}
