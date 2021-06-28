
import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {

  const AppResponsive({Key key, this.app, this.web}) : super(key: key);

  final Widget app;
  final Widget web;


  static bool isApp(BuildContext context) => MediaQuery.of(context).size.width < 900 ;
  static bool isWeb(BuildContext context) => MediaQuery.of(context).size.width > 900 ;


  @override
  Widget build(BuildContext context) {

    if(isWeb(context)){
      return web;
    }else{
      return app;
    }
  }
}
