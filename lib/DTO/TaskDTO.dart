import 'package:cloud_firestore/cloud_firestore.dart';

class TaskDTO {
  String? id;
  String? title;
  Timestamp? date;
  // Timestamp? startTime;
  // Timestamp? endTime;
  String? description;
  bool? isCheckedIn;
  String? user;

  TaskDTO({this.id, this.title, this.date, this.description = "", this.isCheckedIn = false, this.user}) {
    date = date ?? Timestamp.now();
  }
  // TaskDTO({this.id, this.title, this.date, this.startTime, this.endTime, this.description = "", this.isCheckedIn = false, this.user}) {
  //   date = date ?? Timestamp.now();
  //   startTime = startTime ?? Timestamp.now();
  //   endTime = endTime ?? Timestamp.now();
  // }

  Map<String, dynamic> toJson() => {
    // 'id': id,
    'title': title,
    'date': date,
    // 'startTime': startTime,
    // 'endTime' : endTime,
    'isCheckedIn': isCheckedIn,
    'user': user
  };

  static TaskDTO fromJson(Map<String,dynamic> json) => TaskDTO(
    id: json['id'],
    title: json['title'],
    date: json['date'],
    // startTime: json['startTime'],
    // endTime: json['endTime'],
    isCheckedIn: json['isCheckedIn'],
    user: json['user']
  );

}