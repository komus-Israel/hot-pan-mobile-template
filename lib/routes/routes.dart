import 'package:flutter/material.dart';
import '../components/tabview_component.dart';








//Route to Food List Page

void openTabViewComponent(context){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          //builder: (context) => HomePage(),
          builder: (context) => TabComponent(),
          fullscreenDialog: false),
          (route) => false
  );
}

//to navigate the route of the tabs in the market place page
void tabChanged(tabcontroller, tabs){
  if (tabcontroller.indexIsChanging){
    print('tab changed: ${tabs[tabcontroller.index].tabName}');

  }
}

void pageRoute(context, routeWidget, fullscreenDialog){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context)=>routeWidget,
        fullscreenDialog: fullscreenDialog,
      ),
          (route)=>false

  );
}

void namedPageRoute(context, routeName, data){
  Navigator.pushNamed(context, routeName, arguments:data);
}

