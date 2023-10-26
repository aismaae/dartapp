import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../dummy_data.dart';
import '../widget/members/poster.dart';
import '../widget/members/gallery.dart';
import '../widget/members/profile.dart';
import '../widget/members/solo.dart';
import '../widget/members/award.dart';

class MemberScreen extends StatefulWidget {
  static const routeName = '/kpop/gruop/member';

  @override
  State<StatefulWidget> createState() {
    return _MemberScreen();
  }
}

class _MemberScreen extends State<MemberScreen> {
  int _selectedIndex = 0;

  Widget buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final memberID = routeArgs['id'];
    final color1 = routeArgs['color1'];
    final color2 = routeArgs['color2'];
    final member = DUMMY_MEMBER.firstWhere((member) => member.memberID == memberID);

    return Scaffold(
      backgroundColor: Color(int.parse(color1)),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 5.0,
              right: 5.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(int.parse(color2)),
                  ),
                  onPressed: () => Navigator.pop(context)
                ),
                Text(
                  member.name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse(color2))
                  ),
                  textAlign: TextAlign.center
                ),
                IconButton(
                  icon: new Image.asset(
                    _selectedIndex == 0 ?
                      "assets/icon/heart.png"
                    : _selectedIndex == 1 ?
                      "assets/icon/open-book.png"
                    : _selectedIndex == 2 ?
                      "assets/icon/award.png"
                    : _selectedIndex == 3 ?
                      "assets/icon/music-note.png"
                    : "assets/icon/image.png",
                    height: 26,
                    width: 26,
                    color: Color(int.parse(color2))
                  ),
                  onPressed: null
                )
              ]
            )
          ),
          SizedBox(
            height: 20.0
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 40.0
            ),
            child: Row(
              children: <Widget>[                
                Text(
                  member.fullname,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    color: Color(int.parse(color2))
                  ),
                  textAlign: TextAlign.center
                )
              ]
            ),
          ),
          SizedBox(
            height: 14.0
          ),
          Container(
            height: MediaQuery.of(context).size.height - 210.0,
            margin: EdgeInsets.only(
              top: 5.0
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0)
              )
            ),
            child: _selectedIndex == 0 ?
              Poster(img: member.img)
            : _selectedIndex == 1 ?
              Profile(title: member.histories)
            : _selectedIndex == 2 ?
              Award(title: 'Award')
            : _selectedIndex == 3 ?
              Solo(title: 'Solo')
            : null // Gallery(title: 'Gallery')
          )
        ]
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 55,
        backgroundColor: Colors.white,
        color: new Color(int.parse(color1)),
        items: <Widget>[
          Image.asset(
            _selectedIndex == 0 ? "assets/icon/heart.png" : "assets/icon/S-broken-heart.png",
            height: 25,
            width: 25,
            color: _selectedIndex == 0 ? new Color(int.parse(color2)) : new Color(int.parse('0xFFBDC3C7'))
          ),
          Image.asset(
            _selectedIndex == 1 ? "assets/icon/open-book.png" : "assets/icon/S-book.png",
            height: 25,
            width: 25,
            color: _selectedIndex == 1 ? new Color(int.parse(color2)) : new Color(int.parse('0xFFBDC3C7'))
          ),
          Image.asset(
            _selectedIndex == 2 ? "assets/icon/award.png" : "assets/icon/S-laurel.png",
            height: 25,
            width: 25,
            color: _selectedIndex == 2 ? new Color(int.parse(color2)) : new Color(int.parse('0xFFBDC3C7'))
          ),
          Image.asset(
            _selectedIndex == 3 ? "assets/icon/music-note.png" : "assets/icon/S-music.png",
            height: 25,
            width: 25,
            color: _selectedIndex == 3 ? new Color(int.parse(color2)) : new Color(int.parse('0xFFBDC3C7'))
          ),
          Image.asset(
            _selectedIndex == 4 ? "assets/icon/image.png" : "assets/icon/S-gallery.png",
            height: 25,
            width: 25,
            color: _selectedIndex == 4 ? new Color(int.parse(color2)) : new Color(int.parse('0xFFBDC3C7'))
          )
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      )
    );
  }
}