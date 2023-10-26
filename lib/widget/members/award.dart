import 'package:flutter/material.dart';

import '../loader.dart';

class Award extends StatelessWidget {
  final String title;

  Award({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Loader(),
    );
  }
}