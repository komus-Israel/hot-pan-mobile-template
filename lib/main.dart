import 'package:flutter/material.dart';
import 'package:hot_pan/screens/profile.dart';
import 'screens/splash.dart';
import 'screens/order.dart';
import 'screens/signin.dart';
import 'screens/signup.dart';
import 'screens/searchPage.dart';
import 'components/tabview_component.dart';
void main() {

  runApp(HotPan());
}

class HotPan extends StatefulWidget {
  @override
  _HotPanState createState() => _HotPanState();
}

class _HotPanState extends State<HotPan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/order': (context)=>FoodOrderPage(),
        '/accountPage': (context)=>AccountPage(),
        '/signIn': (context)=>SignIn(),
        '/signUp':(context)=>SignUp(),
        '/tabView':(context)=>TabComponent(),
        '/search':(context)=>SearchPage()

      },
      home: Scaffold(
        body: Splash()
      ),
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      

    );
  }
}


