import 'package:flutter/material.dart';

import '../sidebar/sidebar.dart';
import '../screen/kpop_screen.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          KpopsScreen(),
          SideBar()
        ]
      )
    );
  }
}