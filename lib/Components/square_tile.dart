import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget{
  final String imagePath;

  final double height;
  final double? width;
  final double borderRadius;
  final double padding;

  final bool isNetworkPath;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.height,

    this.width = null,
    this.padding = 20,
    this.borderRadius = 16,
    this.isNetworkPath = false
  });

  @override
  Widget build(BuildContext context){
    var childElement = this.isNetworkPath ? 
    Image.network(
      imagePath
      , width: width
      , height: this.height
      , fit: BoxFit.cover,
    ) 
    : 
    Image.asset(
      imagePath, 
      height: height,
    );

    return Container(
      padding: EdgeInsets.all(this.padding),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(this.borderRadius),
        color: Colors.white,
      ),
      child: childElement,
    );
  }
}









