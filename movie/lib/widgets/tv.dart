import 'package:flutter/material.dart';
import 'package:movie/tvdes.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Popular TV Shows',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => tvDesc(
                                      name: tv[index]['original_name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['poster_path'],
                                      description: tv[index]['overview'],
                                      vote:
                                          tv[index]['vote_average'].toString(),
                                      launch_on: tv[index]['first_air_date'],
                                    ))));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(children: <Widget>[
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading'))
                        ]),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
