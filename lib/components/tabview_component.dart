import 'package:flutter/material.dart';
import 'package:hot_pan/screens/profile.dart';
import 'package:hot_pan/screens/transaction.dart';
import '../routes/routes.dart';
import '../screens/homepage.dart';
import 'customClasses.dart';
import '../screens/foodProduct.dart';
import '../screens/order.dart';
import '../screens/drawer.dart';
import '../screens/cart.dart';

class TabComponent extends StatefulWidget {
  @override
  _TabComponentState createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> with SingleTickerProviderStateMixin{

  TabController _tabController;
  String pageTitle;


  List<TabRouteObject> tabObject = [

    TabRouteObject(tabName: 'Home', tabPage: HomePage(), tabIcon: Icon(
      Icons.home
    )),
    TabRouteObject(tabName: 'Product', tabPage: FoodProducts(), tabIcon: Icon(
      Icons.fastfood
    )),
    TabRouteObject(tabName: 'Cart', tabPage: FoodCart(), tabIcon: Icon(
      Icons.shopping_cart_sharp
    )),
    TabRouteObject(tabName: 'Transactions', tabPage: TransactionLog(), tabIcon: Icon(
      Icons.monetization_on_outlined
    ))

  ];

  List test = [
    {'name':'timie'},
    {'name': 'tope'},
    {'name': 'tope'},
    {'name': 'tope'}
  ];

  Map signedIn;


  @override
  void initState(){
    super.initState();

    pageTitle = tabObject[0].tabName;

    _tabController = TabController(length: tabObject.length, vsync: this);

    // to set the page title for each pages
    _tabController.addListener(()=>setState(()=>pageTitle = tabObject[_tabController.index].tabName));







  }

  @override
  void dispose(){
    super.dispose();

    @override
    void dispose(){
      _tabController.dispose();
      super.dispose();
    }
    _tabController.dispose();
  }





  Widget build(BuildContext context) {

    signedIn = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        elevation: 0.0,
        centerTitle: true,
        actions: pageTitle == tabObject[1].tabName ? [
          IconButton(
            icon: Icon(
                Icons.search_sharp
            ),
            onPressed: ()=>namedPageRoute(context,'/search', {}),
        )
        ] : [] ,
      ),

      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: tabObject.map((tab)=>tab.tabPage).toList(),

        ),
      ),

        bottomNavigationBar: SafeArea(
              child: Container(
                color: Colors.amberAccent,
                child: TabBar(
                  controller: _tabController,
                  tabs: tabObject.map((tab)=>Tab(
                    child: Column(
                      children: <Widget>[
                        tab.tabIcon,
                        Text(tab.tabName)
                      ],
                    )
                  )).toList(),
                  indicatorColor: Color.fromRGBO(35, 24, 75, 1.0),
                  labelPadding: EdgeInsets.all(10),
                  unselectedLabelColor: Colors.black38,
                  labelColor: Color.fromRGBO(35, 24, 75, 1.0),

                  /*test.map((object)=>Tab(
                      child: Text(object['name']))
                  ).toList()*/

                ),
              ),
          ),

      drawer:  AppDrawer(signedIn: true),
    );
  }
}




