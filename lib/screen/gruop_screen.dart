import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../dummy_data.dart';
import '../widget/gruops/home.dart';
import '../widget/gruops/members.dart';
import '../widget/gruops/song.dart';
import '../widget/gruops/award.dart';
import '../widget/nodata.dart';

Future<List<Job>> _fetchJobs() async {

  final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Job.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

//models
class Job {
  final int id;
  final String position;
  final String company;
  final String description;

  Job({
    this.id,
    this.position,
    this.company,
    this.description
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
    );
  }
}

class GruopScreen extends StatefulWidget {
  static const routeName = '/kpop/gruop';

  @override
  State<StatefulWidget> createState() {
    return _GruopScreen();
  }
}

class _GruopScreen extends State<GruopScreen> with TickerProviderStateMixin {
  
  TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final kpopID = routeArgs['id'];
    final kpopTitle = routeArgs['title'];
    final kpopImg = routeArgs['img'];
    final kpopDetail = routeArgs['detail'];
    final color1 = routeArgs['color1'];
    final color2 = routeArgs['color2'];
    final member = DUMMY_MEMBER.where((member) => member.kpopID.contains(kpopID)).toList();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _getCustomAppBar(
          context,
          kpopTitle,
          color1,
          color2
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                child: TabBar(
                  controller: _controller,
                  tabs: [
                    Tab(
                      icon: new Image.asset(
                        "assets/icon/open-book.png",
                        height: 25,
                        width: 25,
                        color: _currentIndex == 0 ? new Color(int.parse(color1)) : new Color(int.parse('0xFFBDC3C7'))
                      )
                    ),
                    Tab(
                      icon: new Image.asset(
                        "assets/icon/member.png",
                        height: 25,
                        width: 25,
                        color: _currentIndex == 1 ? new Color(int.parse(color1)) : new Color(int.parse('0xFFBDC3C7'))
                      )
                    ),
                    Tab(
                      icon: new Image.asset(
                        "assets/icon/music-note.png",
                        height: 25,
                        width: 25,
                        color: _currentIndex == 2 ? new Color(int.parse(color1)) : new Color(int.parse('0xFFBDC3C7'))
                      )
                    ),
                    Tab(
                      icon: new Image.asset(
                        "assets/icon/award.png",
                        height: 25,
                        width: 25,
                        color: _currentIndex == 3 ? new Color(int.parse(color1)) : new Color(int.parse('0xFFBDC3C7'))
                      )
                    )
                  ],
                  indicatorColor: new Color(int.parse(color1)),
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height-150,
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    FutureBuilder<List<Job>>(
                      future: _fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Job> data = snapshot.data;
                          return data.length > 0 ?
                            Home(
                              txt: kpopDetail,
                              img: kpopImg,
                              color: color1,
                            )
                          : Nodata();
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: SpinKitCubeGrid(
                            color: new Color(int.parse(color1)),
                            size: 50.0,
                          )
                        );
                      }
                    ),
                    FutureBuilder<List<Job>>(
                      future: _fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Job> data = snapshot.data;
                          return data.length > 0 ?
                            ListView.builder(
                              itemBuilder: (ctx, index) {
                                return MemberItem(
                                  id: member[index].memberID,
                                  title: member[index].name,
                                  img: member[index].img,
                                  color1: color1,
                                  color2: color2,
                                );
                              },
                              itemCount: member.length
                            )
                          : Nodata();
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: SpinKitFadingCube(
                            color: new Color(int.parse(color1)),
                            size: 50.0,
                          )
                        );
                      }
                    ),
                    FutureBuilder<List<Job>>(
                      future: _fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Job> data = snapshot.data;
                          return data.length > 10 ?
                            ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Song(
                                  title: 'Song',
                                  color1: color1
                                );
                              }
                            )
                          : Nodata();
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: SpinKitThreeBounce(
                            color: new Color(int.parse(color1)),
                            size: 30.0,
                          )
                        );
                      }
                    ),
                    FutureBuilder<List<Job>>(
                      future: _fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Job> data = snapshot.data;
                          return data.length > 0 ?
                            ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Award(
                                  title: data[index].company,
                                  subtitle: data[index].company,
                                  icon: Icons.work
                                );
                              }
                            )
                          : Nodata();
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: SpinKitCircle(
                            color: new Color(int.parse(color1)),
                            size: 50.0,
                          )
                        );
                      }
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _controller.index;
    });
  }
}

_getCustomAppBar(context, String title, String color1, String color2) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            new Color(int.parse(color2)),
            new Color(int.parse(color1))
          ]
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(int.parse(color2)),
              ),
              onPressed: () => Navigator.pop(context)
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Color(int.parse(color2))
              ),
              textAlign: TextAlign.center
            )
          ),
          Container(
            width: 50,
            child: SizedBox(
              width: 50
            )
          )
        ]
      )
    )
  );
}