import 'package:flutter/material.dart';
import 'package:movie/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Top Rated Movies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launch_on: toprated[index]
                                          ['release_date'],
                                    )));
                      },
                      child: Container(
                        width: 140,
                        child: Column(children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(toprated[index]['title'] != null
                                  ? toprated[index]['title']
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
