import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/movies_lists.dart';

class SideBar extends StatelessWidget {

  const SideBar({Key key, this.trending, this.popular, this.popularTv, this.onAir}) : super(key: key);

  final List <dynamic> trending;
  final List <dynamic> popular;
  final List <dynamic> popularTv;
  final List <dynamic> onAir;


  @override
  Widget build(BuildContext context) {

    final Color color = HexColor.fromHex('#032541');
    return Drawer(
      child: Material(
        // ignore: avoid_unnecessary_containers
        child: Container(
          color: color,
          child: ListView(
            children:<Widget> [
              const SizedBox(height: 10,),
              Container(
                height:MediaQuery.of(context).size.height/4,
                width:MediaQuery.of(context).size.width ,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.jpg'),
                    )
                ),
              ),
              ListTile(
                leading: const Icon(Icons.trending_up , color: Colors.white,),
                title: const Text('Trending Movies' , style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.white
                ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute <void> (
                    builder: (BuildContext context) => MoviesLists( movies:trending)
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.public , color: Colors.white,),
                title: const Text(' popular Movies' , style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.white
                ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute <void> (
                      builder: (BuildContext context) => MoviesLists(movies: popular ,)
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.live_tv , color: Colors.white,),
                title: const Text('popular TV Shows' , style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.white
                ),),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute<void>(
                    builder: (BuildContext context) => MoviesLists(movies: popularTv ,)
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.tv , color: Colors.white,),
                title: const Text('On Air TV Shows' , style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.white
                ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => MoviesLists(movies: onAir ,)
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings , color: Colors.white,),
                title: const Text(' Setting' , style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.white
                ),),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    // ignore: always_put_control_body_on_new_line
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
