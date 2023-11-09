import 'package:flutter/material.dart';

class CustomDropdownField extends StatefulWidget {

  final String labelText;
  final String value;
  final List<DropdownMenuItem<String>> items;

  const CustomDropdownField({super.key, required this.labelText, required this.value, required this.items});

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  late String dropdownValue = widget.value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: 
      DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
            labelText: widget.labelText,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down_rounded),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: widget.items,
      ),
    );
  }
}
