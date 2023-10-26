import 'package:flutter/material.dart';

import '../screen/gruop_screen.dart';

class KpopItem extends StatelessWidget {
  final String id;
  final String title;
  final String img;
  final String detail;
  final String color1;
  final String color2;

  KpopItem({
    this.id,
    this.title,
    this.img,
    this.detail,
    this.color1,
    this.color2
  });

  void selectGruop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      GruopScreen.routeName, 
      arguments: {
        'id': id,
        'title': title,
        'img': img,
        'detail': detail,
        'color1': color1,
        'color2': color2
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectGruop(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 4,
        margin: EdgeInsets.only(
          left: 15,
          right: 10,
          top: 5,
          bottom: 5 
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    ),
                    child: Image.network(
                      img,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.audiotrack,
                      color: new Color(int.parse(color2)),
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color:  new Color(int.parse(color1)),
                        fontFamily: 'Raleway',
                      ),
                    )
                  ]
                ),
              )
            ]
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                new Color(int.parse('0xFFF0F3F4')),
                new Color(int.parse('0xFFF0F3F4'))
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(10)
          ),
        )
      )
    );
  }
}