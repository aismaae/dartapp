import 'package:flutter/material.dart';

class Solo extends StatelessWidget {
  final String title;

  Solo({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title)
    );
  }
}