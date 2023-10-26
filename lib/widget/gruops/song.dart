import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Song extends StatelessWidget {
  final String title;
  final String detail;
  final String date;
  final String img;
  final String color1;
  final String color2;

  Song({
    this.title,
    this.detail,
    this.date,
    this.img,
    this.color1,
    this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: new Color(int.parse(color1)),
        size: 50.0,
      )
    );
  }
}