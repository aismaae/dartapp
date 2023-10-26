import 'package:flutter/material.dart';

class Award extends StatelessWidget {
  // final String award;
  // final String year;
  // final String category;
  // final String nominee;
  // final String result;
  // final String color1;
  // final String color2;

  // Award({
  //   this.award,
  //   this.year,
  //   this.category,
  //   this.nominee,
  //   this.result,
  //   this.color1,
  //   this.color2
  // });
  final String title;
  final String subtitle;
  final IconData icon;

  Award({
    this.title,
    this.subtitle,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
    // Center(
    //   child: Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15)
    //   ),
    //   elevation: 4,
    //   margin: EdgeInsets.only(
    //     left: 10,
    //     right: 10,
    //     top: 5,
    //     bottom: 5
    //   ),
    //   child: Container(
    //     height: 70,
    //     child: Row(
    //       children: <Widget>[
    //         // ClipRRect( 
    //         //   borderRadius: BorderRadius.only(
    //         //     topLeft: Radius.circular(10),
    //         //     bottomLeft: Radius.circular(10)
    //         //   ),
    //         //   child: Image.network(
    //         //     img,
    //         //     fit: BoxFit.cover
    //         //   )
    //         // ),
    //         SizedBox(width: 15),
    //         Text(
    //           award,
    //           style: TextStyle(
    //             color: new Color(int.parse(color2)),
    //             fontFamily: 'RobotoCondensed',
    //             fontSize: 18,
    //             fontStyle: FontStyle.italic,
    //             fontWeight: FontWeight.w100
    //           )
    //         )
    //       ]
    //     ),
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           new Color(int.parse(color1)),
    //           new Color(int.parse(color2))
    //         ],
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomRight
    //       ),
    //       borderRadius: BorderRadius.circular(10)
    //     )
    //   )
    //   )
    // );
  }
}