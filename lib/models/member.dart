import 'package:flutter/foundation.dart';

class Member {
  final String memberID;
  final String fullname;
  final String name;
  final String kpopID;
  final String img;
  final String histories;
  final List<String> gallery;
  
  const Member({
    @required this.memberID,
    @required this.fullname,
    @required this.name,
    @required this.kpopID,
    @required this.img,
    @required this.histories,    
    this.gallery
  });
}