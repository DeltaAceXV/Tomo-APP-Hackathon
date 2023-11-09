import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracklocation/Components/CustomDropdownField.dart';
import 'package:tracklocation/Components/CustomTextField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController(text: "Denise 🌸");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  String genderValue = "F";
  String studyLevelValue = "HS";
  String examValue = "SPM";
  String majorValue = "Sciences";

  List<DropdownMenuItem<String>> genderItems = [
    DropdownMenuItem<String>(value: 'F', child: Text("Female")),
    DropdownMenuItem<String>(value: 'M', child: Text("Male")),
  ];

  List<DropdownMenuItem<String>> studyLevelItems = [
    DropdownMenuItem<String>(value: 'HS', child: Text("High School")),
    DropdownMenuItem<String>(value: 'PU', child: Text("Pre-University")),
    DropdownMenuItem<String>(value: 'UG', child: Text("College / University")),
  ];

  List<DropdownMenuItem<String>> examItems = [
    DropdownMenuItem<String>(value: 'SPM', child: Text("SPM")),
    DropdownMenuItem<String>(value: 'IGCSE', child: Text("IGCSE")),
    DropdownMenuItem<String>(value: 'A-Levels', child: Text("A-Levels")),
    DropdownMenuItem<String>(value: 'NA', child: Text("N/A")),
  ];

  List<DropdownMenuItem<String>> majorItems = [
    DropdownMenuItem<String>(value: 'Sciences', child: Text("Sciences")),
    DropdownMenuItem<String>(value: 'Arts', child: Text("Arts")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.yellow.shade800,
            child: const Text(
              'DK',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(label: "Name", controller: nameController),
          CustomDropdownField(
              labelText: "Gender", value: genderValue, items: genderItems),
          CustomDropdownField(
              labelText: "Study Level",
              value: studyLevelValue,
              items: studyLevelItems),
          CustomDropdownField(
              labelText: "Major Exams", value: examValue, items: examItems),
          CustomDropdownField(
              labelText: "Stream / Majors",
              value: majorValue,
              items: majorItems)
        ]),
      ),
    );
  }
}
