import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../dummy_data.dart';
import '../widget/kpop_item.dart';
import '../widget/loader.dart';
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

class KpopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kpops = DUMMY_KPOPS.toList();

    return Scaffold(
      appBar: _getCustomAppBar(context),
      body: 
      // FutureBuilder<List<Job>>(
      //   future: _fetchJobs(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       List<Job> data = snapshot.data;
      //       return data.length > 0 ?
              SafeArea(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return KpopItem(
                      id: kpops[index].kpopID,
                      title: kpops[index].kpopname,
                      img: kpops[index].img,
                      detail: kpops[index].detail,
                      color1: kpops[index].color1,
                      color2: kpops[index].color2,
                    );
                  },
                  itemCount: kpops.length
                )
      //         )
      //       : Nodata();
      //     } else if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
      //     }
      //     return Center(
      //       child: Loader()
      //     );
      //   }
      )
    );
  }
}

_getCustomAppBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.redAccent
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
              icon: Icon(Icons.favorite),
              onPressed: () =>  null
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
              'K-POP',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: new Color(int.parse('0xFF000000'))
              ),              
              textAlign: TextAlign.center
            )
          ),
          Container(
            width: 50,
            child: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () =>  null
            )
          )
        ]
      )
    )
  );
}