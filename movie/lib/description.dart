import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie/utils/text.dart';

class Description extends StatelessWidget {
// ignore: non_constant_identifier_names
  String? name;
  String? description;
  String? bannerurl;
  String? posterurl;
  String? vote;
  String? launch_on;

  Description(
      {this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: <Widget>[
          Container(
              height: 250,
              child: Stack(children: <Widget>[
                Positioned(
                    child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl.toString(),
                            fit: BoxFit.cover))),
                Positioned(
                    bottom: 10,
                    child: Text(" ⭐ Average Rating - " + vote.toString()))
              ])),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(name != null ? name.toString() : 'Not Loaded')),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text("Releasing On - " + launch_on.toString()),
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl.toString())),
              Flexible(
                child: Container(
                  child: Text(description.toString()),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
