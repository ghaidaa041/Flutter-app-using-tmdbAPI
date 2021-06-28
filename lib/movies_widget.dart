import 'package:flutter/material.dart';
import 'package:flutter_app/app_responsive.dart';
import 'package:flutter_app/widgets.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'side_bar.dart';

class MoviesWidget extends StatefulWidget {

  const MoviesWidget({Key key}) : super(key: key);
  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();


}

class _MoviesWidgetState extends State<MoviesWidget> {

  @override
  void initState(){
    load_movies();
    super.initState();
  }

  final String kayApi = '06d4bdc1b64b1dad62ed7c564068e3d4';
  final String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNmQ0YmRjMWI2NGIxZGFkNjJlZDdjNTY0MDY4ZTNkNCIsInN1YiI6IjYwY2Q5Njk0NWZmMzRlMDA2Y2Y0NmNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ayMvnO4Hz5fbR1qScbl3MFDvYe4DPkKcIIy-lJLQFGk';

  List <dynamic> trendingMovies  ;
  List <dynamic> popularMovies ;
  List <dynamic> popularTvShows ;
  List <dynamic> onAirTvShows ;

 // ignore: avoid_void_async, non_constant_identifier_names
 void load_movies() async{
    final TMDB tmdbmovies = TMDB(ApiKeys(kayApi, token),
        logConfig: ConfigLogger(
            showLogs: true ,
            showErrorLogs: true
        )
    );

    final Map<dynamic, dynamic> trendingRes = await tmdbmovies.v3.trending.getTrending();
    final Map <dynamic, dynamic> popularRes = await tmdbmovies.v3.movies.getPouplar();
    final Map <dynamic, dynamic> tvShowRes = await tmdbmovies.v3.tv.getPouplar();
    final Map <dynamic, dynamic> tvShowOnAirRes = await tmdbmovies.v3.tv.getOnTheAir();



    setState(() {
      trendingMovies = trendingRes['results'] as List <dynamic>  ;
      popularMovies = popularRes['results'] as List <dynamic> ;
      popularTvShows = tvShowRes['results'] as List <dynamic>;
      onAirTvShows = tvShowOnAirRes['results'] as List <dynamic>;
    });
//    print(popularMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppResponsive.isWeb(context) ? Colors.black : null ,
        flexibleSpace: AppResponsive.isApp(context) ?  Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/image1.png'), fit: BoxFit.cover
              )
          ),
        ): null ,
        title: const Text('Movies' , style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),),
      ) ,
      drawer: AppResponsive.isApp(context) ?
      SideBar(trending: trendingMovies, popular: popularMovies,popularTv: popularTvShows,onAir: onAirTvShows ,) : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            if(AppResponsive.isWeb(context))
              // ignore: sized_box_for_whitespace
              Container(
                  height: MediaQuery.of(context).size.height ,
                  width:  MediaQuery.of(context).size.width *0.2,
                child: SideBar(trending: trendingMovies, popular: popularMovies,popularTv: popularTvShows,onAir: onAirTvShows ,)
            ),
            Container(
              height: MediaQuery.of(context).size.height ,
              width: AppResponsive.isWeb(context) ? MediaQuery.of(context).size.width *0.8 : MediaQuery.of(context).size.width,
              color: Colors.black,
              child: ListView(
                children: <Widget> [
                  const SizedBox(height: 10,),
                  const Text('Trending Movies' , style: TextStyle(
                      fontSize: 20
                  ),),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: <Widget> [
                        Container(
                        height: MediaQuery.of(context).size.height/1.9,
//                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage('images/image1.png'), fit: BoxFit.cover
                            )
                        ),
                         padding: const EdgeInsets.all(20),
                         child:Widgets(moviesList: trendingMovies, trend: true,),
                      ) ,
                      const SizedBox(height: 10,),
                      const Text('Popular Movies' , style: TextStyle(
                        fontSize: 20
                      ),),
                      Widgets(moviesList: popularMovies , trend: false,),
                      const Text('Popular TV Shows ', style: TextStyle(
                          fontSize: 20
                      ),),
                      Widgets(moviesList: popularTvShows ,trend: false,),
                      const Text('On Air TV Shows', style: TextStyle(
                          fontSize: 20
                      ),),
                      Widgets(moviesList:onAirTvShows,trend: false,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}