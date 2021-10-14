import 'package:flutter/material.dart';
import 'dart:async';
import '../routes/routes.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  //a function to run after 8secs

  /*void initState(){
    super.initState();
    Timer(
      Duration(
        seconds: 8
      ), (){
      print('8sec');
      openTabViewComponent(context);

    }
    );

  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage('assets/images/drawer_img2.png'),
          )
        )
      )
    );
  }
}
