import 'package:flutter/material.dart';

import '../../screen/member_screen.dart';

class MemberItem extends StatelessWidget {
  final String id;
  final String title;
  final String img;
  final String color1;
  final String color2;

  MemberItem({
    @required this.id,
    @required this.title,
    @required this.img,
    @required this.color1,
    @required this.color2
  });

  void selectMember(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MemberScreen.routeName, 
      arguments: {
        'id': id,
        'color1': color1,
        'color2': color2
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMember(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 5,
          bottom: 5
        ),
        child: Container(
          height: 70,
          child: Row(
            children: <Widget>[
              ClipRRect( 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                ),
                child: Image.network(
                  img,
                  fit: BoxFit.cover
                )
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: new Color(int.parse(color2)),
                  fontFamily: 'RobotoCondensed',
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w100
                )
              )
            ]
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                new Color(int.parse(color1)),
                new Color(int.parse(color2))
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(10)
          )
        )
      )
    );
  }
}