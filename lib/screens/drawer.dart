import 'package:flutter/material.dart';
import '../routes/routes.dart';

class AppDrawer extends StatefulWidget {

  bool signedIn;

  AppDrawer({Key key, @required this.signedIn}) : super(key:key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  List<Map> drawerComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    drawerComponents = [
      {'name':'Account', 'icon':Icon(
          Icons.person
      ), 'routeName': '/accountPage'},

      {'name':'Food Cart', 'icon':Icon(
          Icons.shopping_cart
      ), 'routeName': '/accountPage'},

      {'name':'Transactions', 'icon':Icon(
          Icons.monetization_on_outlined
      ), 'routeName': '/accountPage'},

      {'name':'Privacy', 'icon':Icon(
          Icons.policy
      ), 'routeName': '/accountPage'},

      {'name': widget.signedIn ? 'Sign Out' : 'Sign In', 'icon':Icon(
          Icons.login
      ), 'routeName': '/signIn'},
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Stack(
        children: [
          Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Image(
                    image: AssetImage(
                      'assets/images/drawer_img2.png'
                    ),
                  ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(0),
              ),

              Container(
                height: 300,
                //color: Colors.red,
                child: ListView.builder(
                  itemCount:drawerComponents.length,
                    itemBuilder: (context, index){
                      return ListTile(
                          onTap: (){
                            /*drawerComponents[index]['onTap'];
                            print('working');*/
                            Navigator.pushNamed(context, drawerComponents[index]['routeName']);
                          },
                          title: Text(drawerComponents[index]['name']),
                        leading: drawerComponents[index]['icon'],
                      );
                    }
                ),
              ),




            ],
          ),
        ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                  'v1.0',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
            ),
          )
    ]
      ),
    );
  }
}
