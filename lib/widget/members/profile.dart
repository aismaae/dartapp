import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title;

  Profile({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 10
      ),
      child: SingleChildScrollView(
        child: Text(
          title
        )
      )
    );
  }
}