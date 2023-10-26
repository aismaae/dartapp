import 'package:flutter/material.dart';

import './sidebar/side_layout.dart';
import './screen/kpop_screen.dart';
import './screen/gruop_screen.dart';
import './screen/member_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => SideBarLayout(),
        '/s': (ctx) => KpopsScreen(),
        GruopScreen.routeName: (ctx) => GruopScreen(),
        MemberScreen.routeName: (ctx) => MemberScreen()
      },
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (ctx) => KpopsScreen()),
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (ctx) => KpopsScreen())
    );
  }
}