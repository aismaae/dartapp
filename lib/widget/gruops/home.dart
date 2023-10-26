import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String txt;
  final String img;
  final String color;

  Home({
    this.txt,
    this.img,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(
              img,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                ),
                border: Border.all(
                  color: new Color(int.parse(color)),
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: new Color(int.parse(color)),
                    offset: Offset(0.5, 1.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10
                ),
                child: SingleChildScrollView(
                  child: Text(
                    txt
                  )
                )
              )
            )
          )
        ],
      )
    );
  }
}