import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String label;

  const CustomTextField(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
