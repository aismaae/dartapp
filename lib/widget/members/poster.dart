import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String img;

  Poster({
    this.img
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 3,
        top: 3
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(73.0)
        ),
        child: Image.network(
          img,
          fit: BoxFit.cover
        )
      )
    );
  }
}