import 'package:flutter/material.dart';

class DialogPrompt extends StatelessWidget{

  final String? titleMessage;
  final String? mainMessage;
  final IconData? iconType;

  DialogPrompt({this.titleMessage, this.mainMessage, this.iconType});

  @override
  Widget build(BuildContext context){

    return WillPopScope(
      child: AlertDialog(
        title: Text(this.titleMessage ?? ""),
        icon: Icon(this.iconType),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.mainMessage ?? "")
          ]
        ),
      ), 
      onWillPop: () async { 
        return true; 
      }
    );
  }
}