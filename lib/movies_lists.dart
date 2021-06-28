import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app_responsive.dart';
import 'package:flutter_app/description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'side_bar.dart';

class MoviesLists extends StatelessWidget{

  const MoviesLists({Key key, this.movies}) : super(key: key);

  final List<dynamic> movies ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back),
            onPressed:(){ Navigator.pop(context);}
        ),
        centerTitle: true,
        backgroundColor: AppResponsive.isWeb(context) ? Colors.black : null,
        flexibleSpace: AppResponsive.isApp(context) ? Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/image1.png'), fit: BoxFit.cover
              )
          ),
        ): null,
        title: const Text('Movies' , style: TextStyle(
            fontSize: 20,
            color: Colors.white
        ),),
      ),
      drawer: AppResponsive.isApp(context) ? SideBar(trending: movies ,) : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            if(AppResponsive.isWeb(context))
              Expanded(
                  child: SideBar(trending: movies )
              ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute <void> (
                              builder: (BuildContext context) => Description(
                                // ignore: avoid_dynamic_calls
                                name: movies[index]['title'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                bannerUrl: 'https://image.tmdb.org/t/p/w500${movies[index]['backdrop_path']}'?? 'null',
                                // ignore: prefer_interpolation_to_compose_strings, avoid_dynamic_calls
                                posterUrl: 'https://image.tmdb.org/t/p/w500' + movies[index]['poster_path'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                description: movies[index]['overview'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                vote: movies[index]['vote_average'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                relaesDate: movies[index]['release_date'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                languag: movies[index]['original_language'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                firstAirDate: movies[index]['first_air_date'].toString() ?? 'null',
                                // ignore: avoid_dynamic_calls
                                popularity: movies[index]['popularity'].toString()?? 'null',
                                // ignore: avoid_dynamic_calls
                                mediaType: movies[index]['media_type'].toString() ?? 'null',
                              )));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          // ignore: sized_box_for_whitespace
                          if (AppResponsive.isApp(context)) Container(
                            height: MediaQuery.of(context).size.height/3,
//                              width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: <Widget> [
                                CachedNetworkImage(
                                  // ignore: avoid_dynamic_calls
                                  imageUrl: 'https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}' ?? '' ,
                                  fit: BoxFit.fill,
                                ),
                                // ignore: avoid_dynamic_calls
                                if (movies[index]['original_title'] != null) Container(
                                  margin: const EdgeInsets.only(left: 30 , top: 10),
                                  // ignore: avoid_dynamic_calls
                                  child: Text(movies[index]['original_title'].toString()  ?? ' ' , style: const TextStyle(
                                      fontSize: 20
                                  ),),
                                ) else Container(
                                  margin: const EdgeInsets.only(left: 30 , top: 10),
                                  // ignore: avoid_dynamic_calls
                                  child: Text(movies[index]['original_name'].toString() ?? ' ' , style: const TextStyle(
                                      fontSize: 20
                                  ),),
                                )
                              ],
                            ),
                          ) else Row(
                            children: <Widget> [
                              Container(
                                height: 300 ,
                                width: 260,
                                child: ExtendedImage.network(
                                  // ignore: avoid_dynamic_calls
                                  'https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}' ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // ignore: avoid_dynamic_calls
                              if (movies[index]['original_title'] != null) Container(
                                margin: const EdgeInsets.only(left: 30 , top: 10),
                                // ignore: avoid_dynamic_calls
                                child: Text(movies[index]['original_title'].toString()  ?? ' ' , style: const TextStyle(
                                    fontSize: 20
                                ),),
                              ) else Container(
                                margin: const EdgeInsets.only(left: 30 , top: 10),
                                // ignore: avoid_dynamic_calls
                                child: Text(movies[index]['original_name'].toString() ?? ' ' , style: const TextStyle(
                                    fontSize: 20
                                ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
