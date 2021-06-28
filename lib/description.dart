import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app_responsive.dart';

import 'side_bar.dart';

class Description extends StatelessWidget {

  const Description({Key key, this.name, this.description, this.bannerUrl, this.posterUrl, this.vote, this.relaesDate, this.languag, this.firstAirDate, this.mediaType, this.popularity}) : super(key: key);

  final String name, description, bannerUrl, posterUrl, vote, relaesDate, languag , firstAirDate , mediaType , popularity ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      title:  Text( name , style: const TextStyle(
          fontSize: 20,
          color: Colors.white
      ),),
    ) ,
      // ignore: avoid_unnecessary_containers
      body: SafeArea(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              if(AppResponsive.isWeb(context))
                const Expanded(
                    child: SideBar()
                ),
              // ignore: avoid_unnecessary_containers
              Expanded(
                flex: 4,
                child: Container(
                    color: Colors.black,
                  child: ListView(
                    children: <Widget> [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: MediaQuery.of(context).size.height/2,
                        child: Stack(
                          children: <Widget> [
                            if (AppResponsive.isApp(context))
                              Positioned(
                              child: Container(
                                height: MediaQuery.of(context).size.height /2 ,
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  imageUrl: bannerUrl ?? ' ' ,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ) else Positioned(
                              child: Container(
                                height: MediaQuery.of(context).size.height /2 ,
                                width: MediaQuery.of(context).size.width,
                                 child: ExtendedImage.network(
                                   bannerUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ) ,
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height:MediaQuery.of(context).size.height/10 ,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage('images/image1.png'),fit: BoxFit.cover
                                  ),
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.grey[850],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
//                              crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget> [
                                        const Icon(Icons.star, color: Colors.yellow,),
                                        Text('$vote/10'),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget> [
                                        const Icon(Icons.movie, color: Colors.white,),
                                        Text(mediaType)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget> [
                                        const Icon(Icons.public , color: Colors.white,),
                                        Text(popularity)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget> [
                                        const Icon(Icons.live_tv , color: Colors.white,),
                                        Text(firstAirDate ?? 'null')
                                      ],
                                    )
                                  ],
                                ),
                              ) ,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01 ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(name ?? 'null' , style: const TextStyle(
                                  fontSize: 40
                              ),)
                          ),
                          Row(
                            children: <Widget> [
                              const Icon(Icons.date_range , color: Colors.white60,),
                              Text(relaesDate , style: const TextStyle(
                                  color: Colors.white60
                              ),),
                              const SizedBox(width: 3,),
                              const Icon(Icons.language , color: Colors.white60,),
                              Text(languag , style: const TextStyle(
                                  color: Colors.white60
                              ),)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          if (AppResponsive.isApp(context))
                            // ignore: sized_box_for_whitespace
                            Container(
                              height: MediaQuery.of(context).size.height /2 ,
                              width: MediaQuery.of(context).size.width/2,
                              child: CachedNetworkImage(
                                imageUrl: posterUrl ?? ' ' ,
                                fit: BoxFit.fill,
                              ),
                            // ignore: sized_box_for_whitespace
                            ) else Container(
                              height: MediaQuery.of(context).size.height /2 ,
                              width: MediaQuery.of(context).size.width /4,
                              child: ExtendedImage.network(
                                posterUrl ?? '',
                                fit: BoxFit.fill,
                              ),
                            ) ,
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01),
                            child:Text( description , style: const TextStyle(
                              fontSize: 20,
                            ),) ,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}