import 'package:flutter/material.dart';

class Nodata extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icon/folder.png",
            width: 30,
            height: 30
          ),
          Text(
            'ไม่พบข้อมูล'
          )
        ]
      )
    );
  }
}