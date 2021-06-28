import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_responsive.dart';

import '../description.dart';

class Widgets extends StatelessWidget {

  const Widgets({Key key, this.moviesList, this.trend}) : super(key: key);

  final List <dynamic> moviesList;
  final bool trend ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const SizedBox(height: 10,),
        // ignore: sized_box_for_whitespace
        Container(
          height:  MediaQuery.of(context).size.height/2.3 ,
          child: ListView.builder(
//              itemCount: moviesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context , int index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute <void> (
                            builder: (BuildContext context) => Description(
                              // ignore: avoid_dynamic_calls
                              name: moviesList[index]['title'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              bannerUrl: 'https://image.tmdb.org/t/p/w500${moviesList[index]['backdrop_path']}'?? 'null',
                              // ignore: prefer_interpolation_to_compose_strings, avoid_dynamic_calls
                              posterUrl: 'https://image.tmdb.org/t/p/w500' + moviesList[index]['poster_path'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              description: moviesList[index]['overview'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              vote: moviesList[index]['vote_average'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              relaesDate: moviesList[index]['release_date'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              languag: moviesList[index]['original_language'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              firstAirDate: moviesList[index]['first_air_date'].toString() ?? 'null',
                              // ignore: avoid_dynamic_calls
                              popularity: moviesList[index]['popularity'].toString()?? 'null',
                              // ignore: avoid_dynamic_calls
                              mediaType: moviesList[index]['media_type'].toString() ?? 'null',
                            )
                        )
                    );
                  },
                  // ignore: sized_box_for_whitespace
                  child: Column(
                    children: <Widget> [
                      if (moviesList != null && moviesList.isNotEmpty)
                        if( AppResponsive.isWeb(context))
                      if (trend == false) Column(
                        children: <Widget> [
                          const SizedBox(height: 10,),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: 200,
                            child: Column(
                              children: <Widget>[
                                ExtendedImage.network(
                                  // ignore: avoid_dynamic_calls
                                  'https://image.tmdb.org/t/p/w500${moviesList[index]['poster_path']}' ?? '',
                                  fit: BoxFit.fill,
                                ),
                                // ignore: avoid_dynamic_calls
                                if (moviesList[index]['original_title'] != null)
                                  // ignore: avoid_dynamic_calls
                                  Text(moviesList[index]['original_title'].toString()  ?? ' ')
                                // ignore: avoid_dynamic_calls
                                else Text(moviesList[index]['original_name'].toString() ?? ' ')
                              ],
                            ),
                          ),
                        ],
                      )else Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: <Widget>[
                            // ignore: sized_box_for_whitespace
                            Container(
                              height:340 ,
                              width: 260,
//                                decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                        image: NetworkImage(
//                                          // ignore: prefer_interpolation_to_compose_strings, avoid_dynamic_calls
//                                            'https://image.tmdb.org/t/p/w500'+moviesList[index]['poster_path'].toString() ?? ''
//                                        ),fit: BoxFit.fill
//                                    )),
                             child: ExtendedImage.network(
                                // ignore: avoid_dynamic_calls
                                'https://image.tmdb.org/t/p/w500${moviesList[index]['poster_path']}' ?? '',
                              fit: BoxFit.fill,
                            ),
                            ),
                          ],
                        ),
                      ) else
                        if (trend == false) Column(
                        children: <Widget>[
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: 140,
                            child: Column(
                              children: <Widget> [
                                CachedNetworkImage(
                                    // ignore: avoid_dynamic_calls
                                    imageUrl: 'https://image.tmdb.org/t/p/w500${moviesList[index]['poster_path']}' ?? ' '
                                ),
                                // ignore: avoid_dynamic_calls
                                if (moviesList[index]['original_title'] != null)
                                  // ignore: avoid_dynamic_calls
                                  Text(moviesList[index]['original_title'].toString()  ?? ' ')
                                // ignore: avoid_dynamic_calls
                                else Text(moviesList[index]['original_name'].toString() ?? ' ')
                              ],
                            ),
                          ),
                        ],
                      )else Container(
                        margin: const EdgeInsets.all(10),
                          width:  MediaQuery.of(context).size.width /2,
                          height:  MediaQuery.of(context).size.height /2.5 ,
                          child: CachedNetworkImage(
                            // ignore: avoid_dynamic_calls
                              imageUrl: 'https://image.tmdb.org/t/p/w500${moviesList[index]['poster_path']}' ?? ' ',
                            fit: BoxFit.fill,
                          ),
                      ) else Column(
                        children: [
                          if (trend == true) Container(
                            height: MediaQuery.of(context).size.height/3,
                            width: MediaQuery.of(context).size.width,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: AssetImage('images/image1.png'), fit: BoxFit.cover
                                )
                            ),
                          )else Container(
                            height: MediaQuery.of(context).size.height/3,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          )
                        ],
                      ) ,
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}