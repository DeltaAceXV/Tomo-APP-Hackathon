import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget {

  MyCustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.all(0),
            child: AppBar(
                title: Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: () => null,
                  ),
                ],
              ) ,
          ),
        ),
      ],
    );
  }

}